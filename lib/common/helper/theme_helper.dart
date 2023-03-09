import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_browser/common/const/color_const.dart';
import 'package:smart_browser/common/const/dimen_const.dart';
import 'package:smart_browser/common/helper/round_border_helper.dart';

class ThemeHelper {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primaryColor: colorPrimary,
        secondaryHeaderColor: colorPrimary,
        appBarTheme: AppBarTheme(
          color: colorPrimary,
          titleTextStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold,
                color: colorWhite,
              ),
          iconTheme: const IconThemeData(
            color: colorWhite,
          ),
        ),
        cardTheme: CardTheme(
          color: colorLightPrimary,
          shadowColor: colorPrimary,
          shape: RoundBorderHelper.roundedRectangleBorder(
            radius: radiusMedium,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            shape: RoundBorderHelper.roundedRectangleBorder(),
            textStyle: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: colorAccent,
            foregroundColor: colorWhite,
            shape: RoundBorderHelper.roundedRectangleBorder(),
            textStyle: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        colorScheme: const ColorScheme.light(
          primary: colorPrimary,
          secondary: colorPrimary,
        )
            .copyWith(
              error: colorError,
            )
            .copyWith(
              secondary: colorAccent,
            ),
      );

  static void setStatusBarStyle(
          {Color statusBarColor = colorPrimary,
          Brightness statusBarBrightness = Brightness.light}) =>
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: colorPrimary,
          statusBarIconBrightness: statusBarBrightness));
}
