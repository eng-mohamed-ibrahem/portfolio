class Project {
  final String name, description, image;
  final String? githubUrl, downloadUrl, promoUrl, googlePlayUrl, appStoreUrl;

  const Project({
    required this.name,
    required this.description,
    required this.image,
    this.githubUrl,
    this.downloadUrl,
    this.promoUrl,
    this.googlePlayUrl,
    this.appStoreUrl,
  });
}
