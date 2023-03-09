import 'package:flutter/material.dart';
import 'package:smart_browser/common/const/dimen_const.dart';

class RoundBorderHelper {
  static OutlineInputBorder outlineInputBorder({double radius = radiusLarge}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            radius,
          ),
        ),
      );

  static RoundedRectangleBorder roundedRectangleBorder(
          {double radius = radiusLarge}) =>
      RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            radius,
          ),
        ),
      );
}
