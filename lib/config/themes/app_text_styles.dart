import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/functions/get_responsive_font_size.dart';

class AppTextStyles {
  AppTextStyles._();

  // Hero/Display Text Styles
  static TextStyle font72Bold(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 72),
        fontWeight: FontWeight.w700,
        letterSpacing: -1.5,
        height: 1.1,
      );

  static TextStyle font48Bold(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 48),
        fontWeight: FontWeight.w700,
        letterSpacing: -0.5,
        height: 1.2,
      );

  static TextStyle font32Bold(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 32),
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
        height: 1.3,
      );

  static TextStyle font30Bold(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 30),
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
        height: 1.3,
      );

  static TextStyle font26Bold(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 26),
        fontWeight: FontWeight.w700,
        letterSpacing: 0.25,
        height: 1.4,
      );

  static TextStyle font24Regular(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 24),
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        height: 1.5,
      );

  static TextStyle font24Bold(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 24),
        fontWeight: FontWeight.w700,
        letterSpacing: 0.25,
        height: 1.4,
      );

  static TextStyle font20Regular(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 20),
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        height: 1.6,
      );

  static TextStyle font20Medium(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 20),
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        height: 1.5,
      );

  static TextStyle font18Medium(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 18),
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        height: 1.5,
      );

  static TextStyle font16Regular(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 16),
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        height: 1.6,
      );

  static TextStyle font16Medium(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 16),
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        height: 1.5,
      );

  static TextStyle font14Medium(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 14),
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        height: 1.5,
      );

  static TextStyle font13Medium(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 13),
        fontWeight: FontWeight.w500,
        letterSpacing: 0.25,
        height: 1.5,
      );
}
