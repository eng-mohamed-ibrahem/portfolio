import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/config/themes/app_colors.dart';
import 'package:portfolio/config/themes/app_text_styles.dart';
import 'package:portfolio/core/constants/app_assets.dart';
import 'package:portfolio/core/constants/app_constants.dart';
import 'package:portfolio/core/constants/app_strings.dart';
import 'package:portfolio/core/shared_widgets/my_sized_box.dart';
import 'package:portfolio/core/utils/functions/open_url.dart';
import 'package:portfolio/features/experience/model/project.dart';

class ProjectItem extends StatelessWidget {
  const ProjectItem({
    super.key,
    required this.project,
    this.isTablet = false,
  });

  final Project project;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 36.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23.r),
        gradient: AppConstants.boxPrimaryLinearGradient,
        border: Border.all(
          color: AppColors.color6971A2.withAlpha(41),
          width: 1.w,
        ),
      ),
      child: isTablet
          ? Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(14.r),
                          child: Image.asset(
                            Assets.imagesProjectItemBackground,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                      AspectRatio(
                        aspectRatio: 1.7,
                        child: Image.asset(project.image),
                      ),
                    ],
                  ),
                ),
                MySizedBox.width16,
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        project.name,
                        style: AppTextStyles.font26Bold(context),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 18.h),
                        child: Text(
                          project.description,
                          style: AppTextStyles.font16Regular(context),
                          // textAlign: TextAlign.justify,
                        ),
                      ),
                      MySizedBox.height14,
                      _buildProjectLinks(project: project),
                    ],
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14.r),
                        child: Image.asset(
                          Assets.imagesProjectItemBackground,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => const Icon(Icons.error),
                        ),
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: 1.7,
                      child: Image.asset(project.image),
                    ),
                  ],
                ),
                MySizedBox.height32,
                Text(
                  project.name,
                  style: AppTextStyles.font32Bold(context),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 18.h),
                    child: Text(
                      project.description,
                      style: AppTextStyles.font20Regular(context),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                MySizedBox.height14,
                _buildProjectLinks(project: project),
              ],
            ),
    );
  }

  Widget _buildProjectLinks({required Project project}) {
    return Wrap(
      spacing: 16.w,
      direction: Axis.horizontal,
      alignment: WrapAlignment.spaceEvenly,
      runAlignment: WrapAlignment.start,
      children: [
        if (project.downloadUrl != null)
          ProjectItemTextButton(
            url: project.downloadUrl!,
            titleText: AppStrings.downloadApp,
            svgPath: Assets.svgsDownloadIcon,
          ),
        if (project.githubUrl != null)
          ProjectItemTextButton(
            url: project.githubUrl!,
            titleText: AppStrings.viewOnGitHub,
            svgPath: Assets.svgsGithubIcon,
          ),
        if (project.promoUrl != null)
          ProjectItemTextButton(
            url: project.promoUrl!,
            titleText: AppStrings.seeThePromo,
            svgPath: Assets.svgsPlay,
          ),
      ],
    );
  }
}

class ProjectItemTextButton extends StatelessWidget {
  const ProjectItemTextButton({
    super.key,
    required this.url,
    required this.titleText,
    required this.svgPath,
  });

  final String url, titleText, svgPath;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        textStyle: AppTextStyles.font20Medium(context),
        foregroundColor: AppColors.colorCBACF9,
      ),
      onPressed: () async => await openUrl(url),
      icon: Text(titleText),
      label: SvgPicture.asset(svgPath),
    );
  }
}
