import 'package:portfolio/core/utils/app_assets.dart';
import 'package:portfolio/core/utils/app_strings.dart';

class SocialIconModel {
  final String icon;
  final String url;

  const SocialIconModel({
    required this.icon,
    required this.url,
  });
  static List<SocialIconModel> socialIcons = [
    const SocialIconModel(
      url: AppStrings.whatsappUrl,
      icon: Assets.svgsWhatsappIcon,
    ),
    const SocialIconModel(
      url: AppStrings.gitHubUrl,
      icon: Assets.svgsGithubIcon,
    ),
    const SocialIconModel(
      url: AppStrings.linkedInUrl,
      icon: Assets.svgsLinkedInIcon,
    ),
  ];
}
