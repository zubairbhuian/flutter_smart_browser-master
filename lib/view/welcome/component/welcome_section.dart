import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:smart_browser/common/const/color_const.dart';
import 'package:smart_browser/common/const/dimen_const.dart';
import 'package:smart_browser/common/widget/custom_button.dart';
import 'package:smart_browser/common/widget/custom_scaffold.dart';
import 'package:smart_browser/view_model/welcome_view_model.dart';

class WelcomeSection extends GetWidget<WelcomeViewModel> {
  const WelcomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(
                  paddingLarge,
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () => controller.onPressedSettingBtn(),
                    icon: const Icon(
                      Icons.settings,
                      color: colorAccent,
                    ),
                  ),
                ),
              ),
              Image.asset(
                "assets/icons/logo.png",
                height: size.height * 0.5,
                width: size.width * 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: paddingMedium,
                  horizontal: paddingLarge,
                ),
                child: CustomButton(
                  onPressed: () => controller.onPressedHomeBtn(),
                  text: "Start",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
