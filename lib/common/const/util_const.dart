import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:smart_browser/common/const/color_const.dart';

showSnackBar(
  String title,
  String message, {
  Color colorText = colorWhite,
  Color backgroundColor = colorAccent,
  Color leftBarIndicatorColor = colorPrimary,
}) =>
    Get.snackbar(title, message,
        colorText: colorText,
        backgroundColor: backgroundColor,
        leftBarIndicatorColor: leftBarIndicatorColor,
        borderRadius: 10.0);
