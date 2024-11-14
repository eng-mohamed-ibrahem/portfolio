import 'package:flutter/material.dart';

class ConditionallyWrapper extends StatelessWidget {
  const ConditionallyWrapper(
      {super.key,
      required this.child,
      required this.wrapper,
      required this.condition});
  final bool condition;
  final Widget child;
  final Widget Function(Widget child) wrapper;

  @override
  Widget build(BuildContext context) {
    return condition ? wrapper(child) : child;
  }
}
