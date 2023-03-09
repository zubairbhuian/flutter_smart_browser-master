import 'package:flutter/material.dart';

class CustomScaffoldFab extends StatelessWidget {
  final bool automaticallyImplyLeading, isCenterTitle;
  final double elevation;
  final List<Widget> actions;
  final Widget title, body, fab;
  final FloatingActionButtonLocation fabLocation;

  const CustomScaffoldFab({
    Key? key,
    this.automaticallyImplyLeading = true,
    this.elevation = 0.0,
    this.isCenterTitle = false,
    this.actions = const [],
    required this.title,
    required this.body,
    required this.fab,
    this.fabLocation = FloatingActionButtonLocation.endFloat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: automaticallyImplyLeading,
        elevation: elevation,
        centerTitle: isCenterTitle,
        title: title,
        actions: actions,
      ),
      body: body,
      floatingActionButton: fab,
      floatingActionButtonLocation: fabLocation,
    );
  }
}
