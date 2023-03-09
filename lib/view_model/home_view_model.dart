import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_browser/route/app_route.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:smart_browser/common/api/api_url.dart';
import 'package:smart_browser/common/api/api_param.dart';
import 'package:smart_browser/common/api/api_service.dart';
import 'package:smart_browser/common/const/util_const.dart';
import 'package:smart_browser/common/const/color_const.dart';
import 'package:smart_browser/model/local/web_url_model.dart';
import 'package:smart_browser/common/helper/enum_helper.dart';
import 'package:smart_browser/model/network/chat_gpt_model.dart';
import 'package:smart_browser/view_model/setting_view_model.dart';
import 'package:smart_browser/view_model/response_view_model.dart';
import 'package:smart_browser/common/helper/get_storage_helper.dart';

class HomeViewModel extends GetxController {
  String welcomeMessage = "";
  RxList<WebUrlModel> webUrls = <WebUrlModel>[].obs;
  RxBool isLoading = false.obs;
  RxString clipboardText = "".obs,
      webUrl = "".obs,
      copyClass = "".obs,
      copyClassParent = "".obs,
      htmlInnerText = "".obs,
      pasteId = "".obs,
      clipboardTextPaste = "".obs;
  Rx<WebViewController> webViewController = WebViewController().obs;
  final Completer<WebViewController> webViewControllerCompleter =
      Completer<WebViewController>();

  @override
  void onInit() {
    _getSharedPrefValue();
    _setSharedPrefValue();
    _setupWebView();
    super.onInit();
  }

  Future<dynamic>? goToHomeView() => Get.toNamed(AppRoute.welcome);

  void refreshWebPage() {
    _getSharedPrefValue();
    _setSharedPrefValue();
    _setupWebView();
  }

  void selectedMenuOnPressed(String selectedMenu, BuildContext context) {
    if (selectedMenu == HomeMenu.list.name) {
      _onPressedResponseListBtn();
    } else if (selectedMenu == HomeMenu.settings.name) {
      _onPressedSettingBtn();
    }
  }

  void _onPressedResponseListBtn() {
    Get.delete<ResponseViewModel>();
    _goToResponseView();
  }

  Future<dynamic>? _goToResponseView() => Get.toNamed(AppRoute.response);

  void _onPressedSettingBtn() {
    Get.delete<SettingViewModel>();
    _goToSettingView();
  }

  Future<dynamic>? _goToSettingView() => Get.toNamed(AppRoute.setting);

  void pasteClipboardText() async {
    ClipboardData? clipboardData =
        await Clipboard.getData(Clipboard.kTextPlain);
    if (clipboardData != null) {
      clipboardTextPaste.value =
          jsonEncode(clipboardData.text!.replaceAll("'", ""));
    }
    webViewController.value.runJavaScriptReturningResult(
        "document.getElementById('${pasteId.value}').value"
        " = ${clipboardTextPaste.value}");
  }

  void setClipboardText() async {
    await Clipboard.setData(ClipboardData(text: "$htmlInnerText"));
    showSnackBar("Success", "✓   Text copied",
        leftBarIndicatorColor: colorSuccess);
  }

  Future<bool> onWillPop() async {
    if (await webViewController.value.canGoBack()) {
      webViewController.value.goBack();
      return Future.value(false);
    }
    return Future.value(true);
  }

  void onBackPressed() async => Get.back();

  void onChangedDropdownBtn(String selectedWebUrl) {
    webUrl.value = selectedWebUrl;
    for (WebUrlModel webUrlModel in webUrls) {
      if (webUrlModel.webUrl == selectedWebUrl) {
        copyClass.value = webUrlModel.copyClass!;
        copyClassParent.value = webUrlModel.copyClassParent!;
        pasteId.value = webUrlModel.pasteId!;
      }
    }
    isLoading.value = true;
    _setupWebView();
  }

  void getClipboardText() async {
    ClipboardData? clipboardData =
        await Clipboard.getData(Clipboard.kTextPlain);
    clipboardText.value = clipboardData!.text!;
    clipboardText.value = "$welcomeMessage ${clipboardText.value}";

    _getChatGptResponse();
  }

  void _getChatGptResponse() async {
    isLoading.value = true;
    ApiService().post(
      urlCompletionsPath,
      {
        paramModel: "text-davinci-003",
        paramPrompt: clipboardText.value,
        paramTemperature: 0,
        paramMaxTokens: 2000,
        paramTopP: 1,
        paramFrequencyPenalty: 0.0,
        paramPresencePenalty: 0.0,
      },
      beforeSend: () => {},
      onSuccess: (onResponse) {
        ChatGptModel chatGptModel = chatGptModelFromJson(onResponse.toString());
        Clipboard.setData(ClipboardData(text: chatGptModel.choices![0].text!));
        _saveChatGptResponse(
            clipboardText.value, chatGptModel.choices![0].text!);
        isLoading.value = false;
      },
      onError: (onError) {
        showSnackBar(
          "Error",
          onError.toString(),
          leftBarIndicatorColor: colorError,
        );
        isLoading.value = false;
      },
    );
  }

  void _saveChatGptResponse(String ask, String response) {
    Map<String, dynamic> responsesMap = {};
    responsesMap.addAll(GetStorageHelper.readGetStorageValue(
            GetStorageHelper.chatGptResponse) ??
        {});
    responsesMap[ask] = response;
    GetStorageHelper.writeGetStorageValue(
        GetStorageHelper.chatGptResponse, responsesMap);
  }

  void _setupWebView() {
    webViewController.value
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(colorWhite)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            isLoading.value = true;
          },
          onPageStarted: (String url) {
            url == "https://"
                ? isLoading.value = false
                : isLoading.value = true;
          },
          onPageFinished: (String url) async {
            Future innerText = Future(() => "");
            copyClassParent.value.isEmpty
                ? innerText = webViewController.value
                    .runJavaScriptReturningResult(
                        "document.getElementsByClassName"
                        "('${copyClass.value.trim()}')[0].innerText")
                : innerText = webViewController.value.runJavaScriptReturningResult(
                    "document.getElementsByClassName"
                    "('${copyClassParent.value.trim()}')[0]"
                    ".getElementsByClassName('${copyClass.value.trim()}')[0].innerText");
            htmlInnerText.value = await innerText;
            isLoading.value = false;
          },
        ),
      )
      ..loadRequest(
        Uri.parse(
          webUrl.value.isEmpty ? "https://" : webUrl.value,
        ),
      );
  }

  void _setSharedPrefValue() {
    if (webUrls.isNotEmpty) {
      webUrl.value = webUrls[0].webUrl!;
      copyClass.value = webUrls[0].copyClass!;
      copyClassParent.value = webUrls[0].copyClassParent!;
      pasteId.value = webUrls[0].pasteId!;
    }
  }

  void _getSharedPrefValue() {
    welcomeMessage =
        GetStorageHelper.readGetStorageValue(GetStorageHelper.welcomeMessage) ??
            "";
    webUrls.value = webUrlModelFromJson(
        GetStorageHelper.readGetStorageValue(GetStorageHelper.webUrls) ?? "[]");
  }
}
