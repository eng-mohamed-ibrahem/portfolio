import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/config/themes/app_text_styles.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/view/widgtes/input_field.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController messageController;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    messageController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width > 600
              ? MediaQuery.sizeOf(context).width * 0.12
              : 10.w,
          vertical: 5.h,
        ),
        children: [
          Text(
            "contact.title".tr(),
            style: AppTextStyles.bodyLarge,
          ),
          SizedBox(height: 30.h),
          InputField(
            controller: nameController,
            hintText: "contact.name".tr(),
            icon: const Icon(Icons.person),
          ),
          SizedBox(height: 20.h),
          InputField(
            controller: emailController,
            hintText: "contact.email".tr(),
            icon: const Icon(Icons.email),
          ),
          SizedBox(height: 20.h),
          InputField(
            controller: messageController,
            hintText: "contact.message".tr(),
            maxLines: 8,
          ),
          SizedBox(height: 40.h),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(MediaQuery.sizeOf(context).width * 0.5, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              textStyle: AppTextStyles.textButton,
            ),
            onPressed: () {},
            child: Text(
              "contact.send".tr(),
              style: AppTextStyles.textButton.copyWith(
                color: AppColors.wight,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
