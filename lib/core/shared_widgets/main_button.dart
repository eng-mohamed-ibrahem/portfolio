import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/config/themes/app_colors.dart';
import 'package:portfolio/config/themes/app_text_styles.dart';
import 'package:portfolio/core/utils/functions/get_responsive_font_size.dart';

class MainButton extends StatefulWidget {
  const MainButton({
    super.key,
    this.text,
    this.child,
    required this.onPressed,
    this.borderRadius,
    this.textStyle,
    this.width,
    this.height,
    this.padding,
    this.fontSize,
    this.margin,
    this.backgroundColor,
    this.borderColor,
    this.gradient,
  });

  final String? text;
  final Widget? child;
  final double? borderRadius;
  final TextStyle? textStyle;
  final void Function()? onPressed;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor, borderColor;
  final Gradient? gradient;

  @override
  State<MainButton> createState() => _MainButtonState();

  factory MainButton.icon({
    required BuildContext context,
    required String labelText,
    required String svgIcon,
    TextStyle? textStyle,
    double borderRadius = 14,
    void Function()? onPressed,
    double? width,
    double? height,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Color? backgroundColor,
    Color? borderColor,
    Gradient? gradient,
  }) =>
      MainButton(
        height: height,
        width: width,
        padding: padding,
        gradient: gradient,
        margin: margin,
        backgroundColor: backgroundColor,
        borderColor: borderColor,
        onPressed: onPressed,
        child: Row(
          spacing: 16.w,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Text(
                labelText,
                style: textStyle ?? AppTextStyles.font18Medium(context),
              ),
            ),
            SvgPicture.asset(svgIcon),
          ],
        ),
      );
}

class _MainButtonState extends State<MainButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        width: widget.width?.w,
        height: widget.height?.h,
        margin: widget.margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 16.r),
          gradient: widget.gradient ??
              const LinearGradient(
                colors: AppColors.primaryGradient,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? AppColors.glowPrimary.withValues(alpha: 0.4)
                  : AppColors.glowPrimary.withValues(alpha: 0.2),
              blurRadius: _isHovered ? 24 : 16,
              offset: const Offset(0, 8),
            ),
          ],
          border: Border.all(
            color: widget.borderColor ?? AppColors.glassBorder,
            width: 1,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onPressed,
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 16.r),
            child: Container(
              padding: widget.padding ??
                  EdgeInsets.symmetric(
                    horizontal: 32.w,
                    vertical: 16.h,
                  ),
              child: Center(
                child: AnimatedScale(
                  duration: const Duration(milliseconds: 200),
                  scale: _isHovered ? 1.05 : 1.0,
                  child: widget.child ??
                      Text(
                        widget.text!,
                        style: widget.textStyle ??
                            AppTextStyles.font18Medium(context).copyWith(
                              fontSize: getResponsiveFontSize(
                                context,
                                fontSize: widget.fontSize ?? 18,
                              ),
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
