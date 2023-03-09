import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:smart_browser/common/const/color_const.dart';
import 'package:smart_browser/common/const/dimen_const.dart';

class CustomSpeedDial extends StatelessWidget {
  final Color backgroundColor;
  final List<SpeedDialChild> speedDialChildList;

  const CustomSpeedDial({
    Key? key,
    required this.backgroundColor,
    required this.speedDialChildList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.menu,
      activeIcon: Icons.close,
      backgroundColor: backgroundColor,
      foregroundColor: Colors.white,
      activeBackgroundColor: colorAccent,
      activeForegroundColor: Colors.white,
      buttonSize: const Size(56.0, 56.0),
      visible: true,
      closeManually: false,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      elevation: elevationStandard,
      shape: const CircleBorder(),
      children: speedDialChildList,
    );
  }
}
