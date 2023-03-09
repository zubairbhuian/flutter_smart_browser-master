import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:smart_browser/common/const/color_const.dart';
import 'package:smart_browser/common/const/dimen_const.dart';
import 'package:smart_browser/common/widget/custom_button.dart';
import 'package:smart_browser/common/widget/custom_app_bar.dart';
import 'package:smart_browser/view_model/setting_view_model.dart';

class SettingSection extends GetWidget<SettingViewModel> {
  const SettingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(
      () => CustomAppBar(
        title: "Setting",
        actions: [
          IconButton(
            onPressed: () => controller.onPressedHomeBtn(),
            icon: const Icon(
              CupertinoIcons.globe,
              color: colorWhite,
            ),
          ),
        ],
        body: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: paddingSmall,
                horizontal: paddingStandardPlus,
              ),
              child: Text(
                "Set a welcome message",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 24.0,
                    ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: marginLarge,
                horizontal: marginVeryLarge,
              ),
              color: colorLightAsh,
              child: TextField(
                controller: controller.welcomeMessageTEdtCtl.value,
                onChanged: (welcomeMessage) =>
                    controller.welcomeMessage.value = welcomeMessage,
                keyboardType: TextInputType.multiline,
                minLines: 5,
                maxLines: 7,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(
                    paddingMedium,
                  ),
                  border: InputBorder.none,
                  hintText: "Message",
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: paddingSmall,
                horizontal: paddingStandardPlus,
              ),
              child: Text(
                "Add web urls",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 24.0,
                    ),
              ),
            ),
            controller.webUrls.isEmpty
                ? Container()
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: paddingStandardPlus,
                    ),
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.webUrls.length,
                    itemBuilder: (context, index) => Row(
                      children: [
                        Expanded(
                          child: Text(
                            "${index + 1}. ${controller.webUrls[index].webUrl}\n"
                            "Copy Class: ${controller.webUrls[index].copyClass}\n"
                            "Copy Class Parent: "
                            "${controller.webUrls[index].copyClassParent}\n"
                            "Paste Id: ${controller.webUrls[index].pasteId}",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        IconButton(
                          onPressed: () => controller.removeWebUrl(index),
                          icon: const Icon(
                            Icons.close,
                            color: colorError,
                          ),
                        )
                      ],
                    ),
                  ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: marginSmall,
                        horizontal: marginVeryLarge,
                      ),
                      color: colorLightAsh,
                      child: TextField(
                        controller: controller.webUrlTEdtCtl.value,
                        onChanged: (webUrl) => controller.webUrl.value = webUrl,
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 3,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(
                            paddingMedium,
                          ),
                          border: InputBorder.none,
                          hintText: "Web Url",
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: marginSmall,
                        horizontal: marginVeryLarge,
                      ),
                      color: colorLightAsh,
                      child: TextField(
                        controller: controller.copyClassTEdtCtl.value,
                        onChanged: (copyClass) =>
                            controller.copyClass.value = copyClass,
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 3,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(
                            paddingMedium,
                          ),
                          border: InputBorder.none,
                          hintText: "Copy Class",
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: marginSmall,
                        horizontal: marginVeryLarge,
                      ),
                      color: colorLightAsh,
                      child: TextField(
                        controller: controller.copyClassParentTEdtCtl.value,
                        onChanged: (copyClassParent) =>
                            controller.copyClassParent.value = copyClassParent,
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 3,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(
                            paddingMedium,
                          ),
                          border: InputBorder.none,
                          hintText: "Copy Class Parent",
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: marginVeryLarge,
                        top: marginSmall,
                        right: marginVeryLarge,
                        bottom: marginVeryLarge,
                      ),
                      color: colorLightAsh,
                      child: TextField(
                        controller: controller.pasteIdTEdtCtl.value,
                        onChanged: (pasteId) =>
                            controller.pasteId.value = pasteId,
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 3,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(
                            paddingMedium,
                          ),
                          border: InputBorder.none,
                          hintText: "Paste Id",
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: 5.0,
                  bottom: -3.0,
                  child: FloatingActionButton.small(
                    elevation: 2.0,
                    onPressed: () => controller.onPressedAddWebUrlBtn(),
                    child: const Icon(
                      Icons.add,
                      color: colorWhite,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: paddingExtraLarge,
                vertical: paddingLarge,
              ),
              child: CustomButton(
                onPressed: () => controller.onPressedSaveBtn(),
                text: "Save",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
