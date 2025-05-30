import 'package:flutter/material.dart';

/// Explanation: This widget is used to restart the main cubits on top of the app

class HotRestartController extends StatefulWidget {
  const HotRestartController({required this.child, super.key});

  final Widget child;

  static void performHotRestart(BuildContext context) {
    final state = context.findAncestorStateOfType<_HotRestartControllerState>();
    if (state != null) {
      state.performHotRestart();
    }
  }

  @override
  State<HotRestartController> createState() => _HotRestartControllerState();
}

class _HotRestartControllerState extends State<HotRestartController> {
  Key key = UniqueKey();

  void performHotRestart() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      child: widget.child,
    );
  }
}
