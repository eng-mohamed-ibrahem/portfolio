import 'package:portfolio/core/constants/app_assets.dart';
import 'package:portfolio/core/constants/app_strings.dart';
import 'package:portfolio/models/experience_model.dart';
import 'package:portfolio/models/project.dart';
import 'package:portfolio/models/skill.dart';
import 'package:portfolio/models/social_icon_model.dart';

class RuntimeCache {
  RuntimeCache._();

  static RuntimeCache get _instance => RuntimeCache._();

  factory RuntimeCache.instance() => _instance;

  final Map<String, dynamic> _cache = {};

  void add<T>(String key, T value) {
    _cache[key] = value;
  }

  T get<T>(String key) => _cache[key];

  List<Project> myProjects = [
    const Project(
      name: 'Hawkamah',
      description:
          "Hawkamah is a Flutter project that helps to manage and automate the process of evaluation and support for employees in a company.",
      image: Assets.hawkamah,
      // downloadUrl: ,
      promoUrl: 'https://www.youtube.com/embed/bDIsDVGvb7A',
    ),
    const Project(
      name: "Hum-L",
      description:
          "This project is a Flutter application for a transportation company. It includes a variety of features such as: \"Transport Furniture\", \"Cleaning After Transportation\", \"Carry it for me\", \"Remove Old Furniture\"",
      image: Assets.huml,
      downloadUrl:
          "https://drive.google.com/file/d/1kqREAtt2NFGm42etmBL_cSFGCCeNu82S/view?usp=drive_link",
      promoUrl: "https://www.youtube.com/embed/VGo2sCdrtBU",
    ),
    const Project(
      name: "Better One",
      description:
          "Storeify is a powerful and dynamic e-commerce Flutter application designed to provide users with a seamless and engaging shopping experience. With robust features and a user-centric interface, Storeify combines functionality and performance to deliver an all-in-one e-commerce solution.",
      image: Assets.betterOne,
      githubUrl: "https://github.com/eng-mohamed-ibrahem/better_one",
      downloadUrl:
          "https://drive.google.com/file/d/1D5O9P18RARIhIMGy3bxNTpSFNFALq5uM/view?usp=sharing",
      promoUrl: 'https://www.youtube.com/embed/TYWcF-MRkig',
    ),
    const Project(
      name: "Emergency Care",
      description:
          "Emergency Care application is designed to provide quick and efficient emergency care services.",
      image: Assets.emergencyCare,
      githubUrl: "https://github.com/eng-mohamed-ibrahem/emergency_care",
    ),
    const Project(
      name: "Hum-L Driver",
      description:
          "This project is a Driver application for a Hum-L. It includes a variety featues for driver and live orders requests",
      image: Assets.humlDriver,
      // downloadUrl: ,
      promoUrl: "https://www.youtube.com/embed/SQUulfX6OOo",
    ),
    const Project(
      name: "ECHO_Online Market(vendor , supplier)",
      description:
          "E-Commerce Application, has Two Module Vendor and Supplier, all have product to sell and another to buy with provide Payment Gateway",
      image: Assets.echo,
      downloadUrl:
          "https://drive.google.com/file/d/17K-BLtNDx6F2IpaCSh32Vv-R_GDcw4uR/view?usp=drive_link",
      promoUrl: "https://www.youtube.com/embed/jjrlEVlSx3k",
    ),
    const Project(
      name: "B2B RealState",
      description:
          "RealState Application, Provide large Units from many Developers and customize them in Categoreis and Developers Company and Preview and Buy",
      image: Assets.b2b,
      downloadUrl:
          "https://drive.google.com/file/d/1InSIlOdGJ-FdBKlGdthnMW16ITEilu6x/view?usp=drive_link",
      promoUrl: "https://www.youtube.com/embed/4wziI7TykkM",
    ),
  ];

  List<Skill> skills = [
    const Skill(name: 'Dart', percent: 0.85),
    const Skill(name: 'OOP', percent: 0.8),
    const Skill(name: 'Flutter Framework', percent: 0.8),
    const Skill(name: 'Problem Solving', percent: 0.7),
    const Skill(name: 'Version Control (Git)', percent: 0.85),
    const Skill(name: 'UI/UX Implementation', percent: 0.8),
    const Skill(name: 'State Management (Cubit & Bloc)', percent: 0.9),
    const Skill(name: 'Firebase', percent: 0.8),
    const Skill(name: 'APIs Handling', percent: 0.9),
    const Skill(name: 'Clean Architecture', percent: 0.8),
    const Skill(name: 'MVVM Pattern', percent: 0.9),
    const Skill(name: 'Responsiveness', percent: 0.8),
  ];

  List<SocialIconModel> socialIcons = [
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

  List<ExperienceModel> myExperience = [
    ExperienceModel(
      companyName: "CAD",
      companyLogo: Assets.cadCompanyLogo,
      companyType: "Software House",
      jobtitle: "Flutter Developer",
      startDate: "May 2023",
      endDate: "Feb 2024",
      descriptionInPoinst: [
        "Built and maintained multiple mobile applications"
            "Effectively managed the mobile application development team to ensure timely delivery",
        "Enhance app performance using profiling tools",
        "Implementing clean coding practices to provide user experience and reusable code."
      ],
    ),
    ExperienceModel(
      companyName: "ANY Solution",
      companyLogo: Assets.anysolutionCompanyLogo,
      companyType: "Software House",
      jobtitle: "Flutter Developer",
      startDate: "May 2024",
      endDate: "Jul 2024",
      descriptionInPoinst: [
        "Create shared package as helper of platform",
        "Implementing clean coding practices to provide user experience and reusable code.",
        "Build Safaria Traveler application"
      ],
    ),
    ExperienceModel(
      companyName: "Freelance",
      companyLogo: Assets.freelancerLogo,
      companyType: "freelance",
      jobtitle: "Flutter Developer",
      startDate: "May 2024",
      endDate: "Present",
      descriptionInPoinst: [
        "Develope a diverse range of mobile applications",
        "Integrate RESTful APIs and third-party libraries to enhance interaction with backend services",
        "Consistently delvered customized solutions that aligned with client",
        "Create rebust and error-free applications."
      ],
    ),
    ExperienceModel(
      companyName: "New Horizon",
      companyLogo: Assets.companyDefautLogo,
      companyType: "Software Learning Center",
      jobtitle: "Mobile Instructor",
      startDate: "Aug 2024",
      endDate: "Oct 2024",
      descriptionInPoinst: [
        "Teaching Java SE",
        "Teaching Dart",
        "Teach Flutter",
        "Teaching How to Think Like a Software Engineer",
      ],
    ),
  ];
}
