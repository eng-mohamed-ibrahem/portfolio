import 'package:flutter/material.dart';

/// A widget that conditionally wraps its child widgets based on a given condition.
///
/// The [ConditionallyWrapper] requires a [wrapper] function that takes a list of child widgets
/// and a boolean [condition]. If the condition is true, the [wrapper] function can apply some
/// modifications or transformations to the children widgets. If the condition is false, the
/// children are provided as-is.
///
/// This widget is useful when you want to apply a certain layout or decoration conditionally
/// without having to repeat the same logic multiple times.
///
/// Example usage:
/// ```dart
/// ConditionallyWrapper(
///   condition: someCondition,
///   wrapper: (children, condition) => condition
///       ? DecoratedBox(
///           decoration: BoxDecoration(color: Colors.red),
///           child: Row(children: children),
///         )
///       : Column(children: children),
///   children: [
///     Text('Hello'),
///     Text('World'),
///   ],
/// )
/// ```
///
/// In this example, if `someCondition` is true, the children will be wrapped in a red [DecoratedBox].
///
/// The [condition] parameter determines whether the [wrapper] logic should be applied.
/// The [children] parameter contains the list of widgets to be potentially wrapped.

class ConditionallyWrapper extends StatelessWidget {
  /// Creates a [ConditionallyWrapper] widget.
  ///
  /// The [wrapper] callback is called with the [children] and the [condition] value.
  /// If the [condition] is true, the [wrapper] callback should return a widget that
  /// wraps the [children] with the desired decoration or layout. If the [condition]
  /// is false, the [wrapper] callback should return the [children] as-is.
  const ConditionallyWrapper({
    super.key,
    required this.wrapper,
    required this.condition,
    required this.children,
  });
  final bool condition;
  final List<Widget> children;
  final Widget Function(List<Widget> children, bool condition) wrapper;

  @override
  Widget build(BuildContext context) {
    return wrapper(children, condition);
  }
}
