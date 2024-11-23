import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/config/navigation/routes_enum.dart';
import 'package:portfolio/model/work_model/work_model.dart';
import 'package:portfolio/view/widgtes/work_card.dart';

class WorksSection extends StatelessWidget {
  const WorksSection({super.key});
  final options = const LiveOptions(
    // Start animation after
    delay: Duration(milliseconds: 300),
    // Show each item through
    showItemInterval: Duration(milliseconds: 300),
    // Animation duration
    showItemDuration: Duration(milliseconds: 300),
    visibleFraction: 0.05,
    reAnimateOnVisibility: true,
  );

  @override
  Widget build(BuildContext context) {
    return LiveList.options(
      shrinkWrap: true,
      // physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index, animation) {
        return InkWell(
          onTap: () {
            context.goNamed(
              Routes.workDetails.name,
              pathParameters: {
                'id': works[index].title,
              },
              extra: works[index],
            );
          },
          child: _buildAnimatedItem(context, index, animation),
        );
      },
      itemCount: works.length,
      options: options,
    );
  }

  Widget _buildAnimatedItem(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) =>
      FadeTransition(
        opacity: Tween<double>(
          begin: 0,
          end: 1,
        ).animate(animation),
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -0.1),
            end: Offset.zero,
          ).animate(animation),
          child: WorkCard(
            work: works[index],
          ),
        ),
      );
}

List<WorkModel> works = [
  WorkModel(
    title: 'Hawkamah',
    thumbnailUrl: 'assets/images/hawkamah_home.jpg',
    date: DateTime(2024),
    type: "Mobile Application",
    links: [
      const LinkModel(
        link: "https://www.youtube.com/embed/bDIsDVGvb7A",
        type: LinkType.youtube,
      ),
      const LinkModel(
        link: "https://www.youtube.com/embed/36M1ttlVDn8",
        type: LinkType.youtube,
      ),
    ],
    description:
        "Hawkamah is a Flutter project that helps to manage and automate the process of evaluation and support for employees in a company.",
    idDid: [
      "Create Firebase For Messaging",
      "Redirect To Specific page depdending on Payload even if user is not logged in",
      "Build Notification Screen To Display Missed Notifications",
    ],
  ),
  WorkModel(
    title: "Better One",
    description:
        "The \"Better One\" mobile application is designed to help users manage tasks, estimate time, and provide encouragement.",
    date: DateTime(2024),
    type: "Mobile Application",
    thumbnailUrl: "assets/images/better_one.jpg",
    links: [],
    idDid: [
      "Handle Background Service For Listening To User Interaction",
      "Make Notification Avialable Even The App is Terminated",
      "Share Task Between Users",
      "Provice User Comments To Shared Tasks",
      "Sync Data To Cloud",
    ],
  ),
  WorkModel(
    title: "Hum-L",
    description:
        "This project is a Flutter application for a transportation company. It includes a variety of features such as: \"Transport Furniture\", \"Cleaning After Transportation\", \"Carry it for me\", \"Remove Old Furniture\"",
    date: DateTime(2023),
    type: "Mobile Application",
    thumbnailUrl: "assets/images/huml.jpg",
    links: [
      const LinkModel(
        link: "https://www.youtube.com/embed/VGo2sCdrtBU",
        type: LinkType.youtube,
      ),
      const LinkModel(
        link: "https://www.youtube.com/embed/SQUulfX6OOo",
        type: LinkType.youtube,
      ),
    ],
    idDid: [
      "Build a tracking Driver and Provide Totoal Estimate Time",
      "Make App Responsive",
      "Improve UI Features",
      "Create UI From Scratch",
      "Handling Google Map API",
      "Handle Payment Methods"
    ],
  ),
  WorkModel(
    title: "Hum-L Driver",
    description:
        "This project is a Driver application for a Hum-L. It includes a variety featues for driver and live orders requests",
    date: DateTime(2023),
    type: "Mobile Application",
    thumbnailUrl: "assets/images/huml_provider.jpg",
    links: [
      const LinkModel(
        link: "https://www.youtube.com/embed/SQUulfX6OOo",
        type: LinkType.youtube,
      ),
    ],
    idDid: [
      "Improve UI Features",
      "Fix Issue of Live Location",
    ],
  ),
  WorkModel(
    title: "ECHO_Online Market(vendor , supplier)",
    description:
        "E-Commerce Application, has Two Module Vendor and Supplier, all have product to sell and another to buy with provide Payment Gateway",
    date: DateTime(2023),
    type: "Mobile Application",
    thumbnailUrl: "assets/images/echo.jpg",
    links: [
      const LinkModel(
        link: "https://www.youtube.com/embed/jjrlEVlSx3k",
        type: LinkType.youtube,
      ),
      const LinkModel(
        link: "https://www.youtube.com/embed/EJI2TOP2sIM",
        type: LinkType.youtube,
      ),
    ],
    idDid: [
      "Build Vendor Section Of The App",
      "Create UI From Scratch",
      "provide Payment Gateway",
      "Login As Guest"
    ],
  ),
  WorkModel(
    title: "B2B RealState",
    description:
        "RealState Application, Provide large Units from many Developers and customize them in Categoreis and Developers Company and Preview and Buy",
    date: DateTime(2023),
    type: "Mobile Application",
    thumbnailUrl: "assets/images/b2b.jpg",
    links: [
      const LinkModel(
        link: "https://www.youtube.com/embed/4wziI7TykkM",
        type: LinkType.youtube,
      ),
    ],
    idDid: [
      "Build From [A-Z] RealState APP",
      "Provide Chat Service",
      "Preview Unit before Purchase",
    ],
  ),
  // agency
  // WorkModel(
  //   title: "",
  //   description: "",
  //   date: DateTime(2023),
  //   type: "",
  //   thumbnailUrl: "",
  //   links: [],
  //   idDid: [],
  // ),
];
