import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/config/themes/app_text_styles.dart';
import 'package:portfolio/core/constants/app_colors.dart';
import 'package:portfolio/model/message_model/message_model.dart';
import 'package:portfolio/view/widgtes/input_field.dart';
import 'package:portfolio/viewmodel/contact_viewmodel/contact_viewmodel.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController messageController;
  final formKey = GlobalKey<FormState>();
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
    formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
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
              icon: const Icon(FontAwesomeIcons.user),
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return "contact.name_error".tr();
                }
                return null;
              },
            ),
            SizedBox(height: 20.h),
            InputField(
              controller: emailController,
              hintText: "contact.email".tr(),
              icon: const Icon(FontAwesomeIcons.envelope),
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return "contact.email_req".tr();
                }
                final emailRegex =
                    RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                if (!emailRegex.hasMatch(text)) {
                  return "contact.email_error".tr();
                }
                return null;
              },
            ),
            SizedBox(height: 20.h),
            InputField(
              controller: messageController,
              hintText: "contact.message".tr(),
              maxLines: 8,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return "contact.message_error".tr();
                }
                return null;
              },
            ),
            SizedBox(height: 40.h),
            BlocConsumer<ContactViewmodel, ContactViewmodelState>(
              listener: (context, state) {
                if (state is SendMessageSuccessState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "contact.message_sent".tr(),
                        style: AppTextStyles.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                      backgroundColor: Colors.green,
                    ),
                  );
                  messageController.clear();
                }
                if (state is SendMessageErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        state.message,
                        style: AppTextStyles.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                      backgroundColor: AppColors.primary,
                    ),
                  );
                }
              },
              builder: (context, state) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.sizeOf(context).width * 0.5, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    textStyle: AppTextStyles.textButton,
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<ContactViewmodel>().sendMessage(
                            MessageModel(
                              name: nameController.text,
                              email: emailController.text,
                              message: messageController.text,
                            ),
                          );
                    }
                  },
                  child: state is SendMessageLoadingState
                      ? const CircularProgressIndicator(
                          color: AppColors.wight,
                        )
                      : Text(
                          "contact.send".tr(),
                          style: AppTextStyles.textButton.copyWith(
                            color: AppColors.wight,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
