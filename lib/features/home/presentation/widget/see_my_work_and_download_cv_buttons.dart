import 'package:animate_do/animate_do.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/constants/app_assets.dart';
import 'package:portfolio/core/constants/app_strings.dart';
import 'package:portfolio/core/service_locator/inject.dart';
import 'package:portfolio/core/shared_widgets/main_button.dart';
import 'package:portfolio/features/resume/presentation/cubit/resume_cubit.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class SeeMyWorkAndDownloadCVButtons extends StatelessWidget {
  const SeeMyWorkAndDownloadCVButtons({
    super.key,
    this.areExpanded = false,
    this.gradient,
  });

  final bool areExpanded;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ResumeCubit>(
      create: (context) => inject<ResumeCubit>()..fetchResumeUrl(),
      child: BlocBuilder<ResumeCubit, ResumeState>(
        builder: (context, state) {
          if (state is ResumeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ResumeLoaded) {
            return FadeInUp(
              delay: const Duration(milliseconds: 900),
              child: OverflowBar(
                alignment: MainAxisAlignment.center,
                overflowAlignment: OverflowBarAlignment.center,
                overflowSpacing: 16.h,
                spacing: 24.w,
                children: [
                  MainButton.icon(
                    context: context,
                    labelText: AppStrings.downloadCV,
                    svgIcon: Assets.svgsDownloadIcon,
                    gradient: gradient,
                    width: areExpanded ? double.infinity : null,
                    onPressed: () async => await _downloadCV(state.resume.url),
                  ),
                ],
              ),
            );
          } else if (state is ResumeError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<void> _downloadCV(String url) async {
    try {
      await FileSaver.instance.saveFile(
        name: AppStrings.resumeName,
        link: LinkDetails(link: url),
        ext: 'pdf',
        mimeType: MimeType.pdf,
      );
    } catch (e, stackTrace) {
      await Sentry.captureException(e, stackTrace: stackTrace);
    }
  }
}
