import 'package:flutter/material.dart';
import 'package:portfolio/config/themes/app_text_styles.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.hintText,
    required this.controller,
    this.icon,
    this.maxLines,
    this.validator,
  });
  final String hintText;
  final TextEditingController controller;
  final Widget? icon;
  final int? maxLines;
  final String? Function(String? text)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color.fromRGBO(224, 224, 224, 1),
            width: 2,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color.fromRGBO(224, 224, 224, 1),
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.red[700]!,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color.fromRGBO(224, 224, 224, 1),
            width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.only(
          left: 15,
          bottom: 11,
          top: 11,
          right: 15,
        ),
        hintText: hintText,
        prefixIcon: icon,
      ),
      maxLines: maxLines,
      style: AppTextStyles.bodyMedium,
    );
  }
}
