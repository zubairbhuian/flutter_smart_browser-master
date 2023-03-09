import 'package:flutter/material.dart';
import 'package:smart_browser/common/const/color_const.dart';

class CustomProgressBar extends StatelessWidget {
  final Color color;

  const CustomProgressBar({
    Key? key,
    this.color = colorAccent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
      ),
    );
  }
}
