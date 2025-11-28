import 'package:flutter/material.dart';
import 'package:portfolio/config/themes/app_colors.dart';

/// An animated gradient background with smooth color transitions
/// Perfect for hero sections and full-screen backgrounds
class AnimatedGradientBackground extends StatefulWidget {
  const AnimatedGradientBackground({
    super.key,
    this.colors = AppColors.backgroundGradient,
    this.duration = const Duration(seconds: 10),
    this.child,
  });

  final List<Color> colors;
  final Duration duration;
  final Widget? child;

  @override
  State<AnimatedGradientBackground> createState() =>
      _AnimatedGradientBackgroundState();
}

class _AnimatedGradientBackgroundState extends State<AnimatedGradientBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: widget.colors,
              stops: [
                0.0,
                _animation.value * 0.5,
                1.0,
              ],
            ),
          ),
          child: widget.child,
        );
      },
    );
  }
}

/// A decorative gradient overlay for adding depth to sections
class GradientOverlay extends StatelessWidget {
  const GradientOverlay({
    super.key,
    this.gradient,
    this.opacity = 0.5,
  });

  final Gradient? gradient;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Opacity(
        opacity: opacity,
        child: Container(
          decoration: BoxDecoration(
            gradient: gradient ??
                LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.primaryGradient[0].withValues(alpha: 0.2),
                    AppColors.backgroundDark.withValues(alpha: 0.8),
                  ],
                ),
          ),
        ),
      ),
    );
  }
}

/// Animated gradient border effect
class AnimatedGradientBorder extends StatefulWidget {
  const AnimatedGradientBorder({
    super.key,
    required this.child,
    this.borderRadius = 16.0,
    this.strokeWidth = 2.0,
    this.gradientColors = AppColors.primaryGradient,
    this.duration = const Duration(seconds: 3),
  });

  final Widget child;
  final double borderRadius;
  final double strokeWidth;
  final List<Color> gradientColors;
  final Duration duration;

  @override
  State<AnimatedGradientBorder> createState() => _AnimatedGradientBorderState();
}

class _AnimatedGradientBorderState extends State<AnimatedGradientBorder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            gradient: SweepGradient(
              colors: widget.gradientColors,
              stops: const [0.0, 0.5, 1.0],
              transform: GradientRotation(_controller.value * 2 * 3.14159),
            ),
          ),
          child: Container(
            margin: EdgeInsets.all(widget.strokeWidth),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(
                widget.borderRadius - widget.strokeWidth,
              ),
            ),
            child: widget.child,
          ),
        );
      },
    );
  }
}
