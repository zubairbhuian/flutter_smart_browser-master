import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final bool automaticallyImplyLeading, isCenterTitle;
  final double elevation;
  final String title;
  final List<Widget> actions;
  final Widget body;

  const CustomAppBar({
    Key? key,
    this.automaticallyImplyLeading = true,
    this.elevation = 0.0,
    this.isCenterTitle = false,
    required this.title,
    this.actions = const [],
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: automaticallyImplyLeading,
        elevation: elevation,
        centerTitle: isCenterTitle,
        title: Text(
          title,
        ),
        actions: actions,
      ),
      body: body,
    );
  }
}
