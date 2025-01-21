import 'package:animate_do/animate_do.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/constants/app_assets.dart';
import 'package:portfolio/core/constants/app_strings.dart';
import 'package:portfolio/core/shared_widgets/main_button.dart';

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
    return FadeInUp(
      delay: const Duration(milliseconds: 900),
      child: OverflowBar(
        alignment: MainAxisAlignment.center,
        overflowAlignment: OverflowBarAlignment.center,
        overflowSpacing: 16.h,
        spacing: 24.w,
        children: [
          // MainButton.icon(
          //   context: context,
          //   labelText: AppStrings.seeMyWork,
          //   svgIcon: Assets.svgsLinkArrow,
          //   gradient: gradient,
          //   width: areExpanded ? double.infinity : null,
          //   onPressed: () async => await openUrl(AppStrings.gitHubUrl),
          // ),
          MainButton.icon(
            context: context,
            labelText: AppStrings.downloadCV,
            svgIcon: Assets.svgsDownloadIcon,
            gradient: gradient,
            width: areExpanded ? double.infinity : null,
            onPressed: () async => await _downloadCV(),
          ),
        ],
      ),
    );
  }

  Future<void> _downloadCV() async {
    final ByteData data = await rootBundle.load(Assets.cv);
    final Uint8List bytes = data.buffer.asUint8List();
    await FileSaver.instance.saveFile(
      name: AppStrings.resumeName,
      bytes: bytes,
      ext: 'pdf',
      mimeType: MimeType.pdf,
    );

    // Step 1: Download the file
    // try {
    // final response = await http.get(
    //   Uri.parse(AppStrings.resumeUrl),
    // headers: {
    //   'Content-Type': 'application/pdf',
    //   'Authorization': 'Bearer ${AppStrings.resumeUrlAccessToken}',
    // },
    // );
    // if (response.statusCode == 200) {
    //   // Step 2: Save the file using the file_saver package
    //   await FileSaver.instance.saveFile(
    //     name: AppStrings.resumeName,
    //     bytes: response.bodyBytes,
    //     ext: 'pdf',
    //     mimeType: MimeType.pdf,
    //   );
    // } else {
    //   await Sentry.captureException(
    //     Exception('Failed to download CV: ${response.statusCode}'),
    //   );
    // }
    // } catch (e, stackTrace) {
    //   await Sentry.captureException(e, stackTrace: stackTrace);
    // }
  }
}
