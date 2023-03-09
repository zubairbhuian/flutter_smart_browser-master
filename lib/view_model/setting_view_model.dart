import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:smart_browser/route/app_route.dart';
import 'package:smart_browser/common/const/util_const.dart';
import 'package:smart_browser/common/const/color_const.dart';
import 'package:smart_browser/model/local/web_url_model.dart';
import 'package:smart_browser/view_model/home_view_model.dart';
import 'package:smart_browser/common/helper/get_storage_helper.dart';

class SettingViewModel extends GetxController {
  RxString welcomeMessage = "".obs,
      webUrl = "".obs,
      copyClass = "".obs,
      copyClassParent = "".obs,
      pasteId = "".obs;
  RxList<WebUrlModel> webUrls = <WebUrlModel>[].obs;
  Rx<TextEditingController> welcomeMessageTEdtCtl = TextEditingController().obs,
      webUrlTEdtCtl = TextEditingController().obs,
      copyClassTEdtCtl = TextEditingController().obs,
      copyClassParentTEdtCtl = TextEditingController().obs,
      pasteIdTEdtCtl = TextEditingController().obs;

  @override
  void onInit() {
    _getSharedPrefValue();
    _setSharedPrefValue();
    super.onInit();
  }

  void onPressedHomeBtn() {
    Get.delete<HomeViewModel>();
    _goToHomeView();
  }

  Future<dynamic>? _goToHomeView() => Get.toNamed(AppRoute.home);

  void onPressedSaveBtn() => _saveSharedPrefValue();

  void _saveSharedPrefValue() {
    if (welcomeMessage.value.trim().isEmpty && webUrls.isEmpty) {
      showSnackBar(
        "Warning",
        "Please add a welcome Message or Web Url!",
        leftBarIndicatorColor: colorWarning,
      );
      return;
    }

    showSnackBar(
      "Success",
      "Message and Web Urls saved successfully!",
      leftBarIndicatorColor: colorSuccess,
    );
    GetStorageHelper.writeGetStorageValue(
        GetStorageHelper.welcomeMessage, welcomeMessage.value);
    GetStorageHelper.writeGetStorageValue(
        GetStorageHelper.webUrls, jsonEncode(webUrls));
  }

  void onPressedAddWebUrlBtn() => _addWebUrl();

  void _addWebUrl() {
    if (webUrlTEdtCtl.value.text.trim().isNotEmpty) {
      webUrl.value = webUrlTEdtCtl.value.text;
      copyClass.value = copyClassTEdtCtl.value.text;
      copyClassParent.value = copyClassParentTEdtCtl.value.text;
      pasteId.value = pasteIdTEdtCtl.value.text;
      webUrls.add(WebUrlModel(
          webUrl.value, copyClass.value, copyClassParent.value, pasteId.value));
      webUrlTEdtCtl.value.clear();
      copyClassTEdtCtl.value.clear();
      copyClassParentTEdtCtl.value.clear();
      pasteIdTEdtCtl.value.clear();
    } else {
      showSnackBar(
        "Warning",
        "Please enter a web url!",
        leftBarIndicatorColor: colorWarning,
      );
    }
  }

  void removeWebUrl(int index) {
    if (webUrls.isNotEmpty) {
      webUrls.removeAt(index);
      webUrls.refresh();
    }
  }

  void _setSharedPrefValue() =>
      welcomeMessageTEdtCtl.value.text = welcomeMessage.value;

  void _getSharedPrefValue() {
    welcomeMessage.value =
        GetStorageHelper.readGetStorageValue(GetStorageHelper.welcomeMessage) ??
            "";
    webUrls.value = webUrlModelFromJson(
        GetStorageHelper.readGetStorageValue(GetStorageHelper.webUrls) ?? "[]");
  }
}
