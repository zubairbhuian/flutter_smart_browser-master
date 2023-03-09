import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:smart_browser/common/const/color_const.dart';

class SpeedDialHelper {
  static SpeedDialChild speedDial(BuildContext context, IconData iconData,
          Color backgroundColor, String label, VoidCallback onTap) =>
      SpeedDialChild(
        child: Icon(
          iconData,
          color: colorWhite,
        ),
        backgroundColor: backgroundColor,
        label: label,
        labelStyle: Theme.of(context).textTheme.titleMedium,
        onTap: onTap,
      );
}
