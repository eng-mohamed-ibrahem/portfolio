import 'dart:ui';

import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final double blur;
  final double opacity;
  final Color? color;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double borderOpacity;
  final double? width;

  const GlassContainer({
    super.key,
    required this.child,
    this.blur = 15.0,
    this.opacity = 0.2, // 0.1 - 0.3 for glass
    this.color,
    this.borderRadius,
    this.padding,
    this.margin,
    this.borderOpacity = 0.3,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final defaultColor = isDark ? Colors.black : Colors.white;
    final effectiveColor = color ?? defaultColor;
    final effectiveBorderRadius = borderRadius ?? BorderRadius.circular(20);

    return Container(
      margin: margin,
      width: width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            spreadRadius: 5,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: effectiveBorderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              color: effectiveColor.withValues(alpha: opacity),
              borderRadius: effectiveBorderRadius,
              border: Border.all(
                color: Colors.white.withValues(alpha: borderOpacity),
                width: 1.5,
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  effectiveColor.withValues(alpha: opacity + 0.1),
                  effectiveColor.withValues(alpha: opacity),
                ],
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final Color? color;

  const SectionTitle({super.key, required this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.displaySmall?.copyWith(
          fontWeight: FontWeight.bold,
          color: color,
          shadows: [
            Shadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
      ),
    );
  }
}
