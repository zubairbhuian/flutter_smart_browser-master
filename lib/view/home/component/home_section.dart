import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:smart_browser/common/const/dimen_const.dart';
import 'package:smart_browser/common/const/color_const.dart';
import 'package:smart_browser/common/helper/enum_helper.dart';
import 'package:smart_browser/view_model/home_view_model.dart';
import 'package:smart_browser/common/helper/speed_dial_helper.dart';
import 'package:smart_browser/common/widget/custom_speed_dial.dart';
import 'package:smart_browser/common/widget/custom_progress_bar.dart';
import 'package:smart_browser/common/widget/custom_scaffold_fab.dart';

class HomeSection extends GetWidget<HomeViewModel> {
  const HomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
        onWillPop: controller.onWillPop,
        child: CustomScaffoldFab(
          title: DropdownButton<String>(
            dropdownColor: colorPrimary,
            underline: const Divider(
              color: colorDarkAsh,
              height: 2.0,
              thickness: 1.5,
            ),
            hint: Text(
              "Web Url",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: colorDarkAsh,
                  ),
            ),
            items: controller.webUrls.value.map((webUrlModel) {
              return DropdownMenuItem<String>(
                value: webUrlModel.webUrl,
                child: Text(
                  webUrlModel.webUrl!,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: colorWhite,
                      ),
                ),
              );
            }).toList(),
            onChanged: (selectedWebUrl) =>
                controller.onChangedDropdownBtn(selectedWebUrl!),
            value: controller.webUrl.value.isNotEmpty
                ? controller.webUrl.value
                : null,
            isExpanded: true,
          ),
          actions: [
            IconButton(
              onPressed: () => controller.goToHomeView(),
              icon: const Icon(
                Icons.home,
                color: colorWhite,
              ),
            ),
            PopupMenuButton<HomeMenu>(
              onSelected: (HomeMenu menu) =>
                  controller.selectedMenuOnPressed(menu.name, context),
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem(
                  value: HomeMenu.list,
                  child: Text(
                    "Responses",
                  ),
                ),
                const PopupMenuItem(
                  value: HomeMenu.settings,
                  child: Text(
                    "Settings",
                  ),
                ),
              ],
              tooltip: "Menu",
            ),
          ],
          body: Stack(
            children: [
              WebViewWidget(
                controller: controller.webViewController.value,
              ),
              controller.isLoading.value ? const CustomProgressBar() : Stack(),
            ],
          ),
          fab: Padding(
            padding: const EdgeInsets.only(
              right: paddingSmall,
              bottom: paddingExtraLarge,
            ),
            child: CustomSpeedDial(
              backgroundColor: colorAccent,
              speedDialChildList: [
                SpeedDialHelper.speedDial(context, Icons.refresh, colorPrimary,
                    "Refresh", () => controller.refreshWebPage()),
                SpeedDialHelper.speedDial(context, Icons.copy, colorSuccess,
                    "Copy", () => controller.setClipboardText()),
                SpeedDialHelper.speedDial(context, Icons.paste, colorEdit,
                    "Paste", () => controller.pasteClipboardText()),
                SpeedDialHelper.speedDial(context, Icons.send, colorWarning,
                    "Send", () => controller.getClipboardText()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
