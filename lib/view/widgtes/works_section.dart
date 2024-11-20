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
      itemBuilder: (context, index, animation) {
        return InkWell(
          onTap: () {
            context.pushNamed(Routes.works.name);
          },
          child: _buildAnimatedItem(context, index, animation),
        );
      },
      itemCount: 5,
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
            work: WorkModel(
              title: 'Better One',
              thumbnail: 'assets/images/thumnail.png',
              date: DateTime(2018),
              type: "Mobile Application",
              links: [],
              description:
                  '''give me descrption of flutter developer A Flutter Developer specializes in creating mobile applications using the Flutter framework developed by Google. Flutter developers are skilled in Dart programming language and possess a deep understanding of the entire mobile app development lifecycle. Their primary responsibilities include designing and developing user-friendly applications, implementing various functionalities, and ensuring the performance, quality, and responsiveness of applications. ''',
            ),
          ),
        ),
      );
}

List<WorkModel> works = [
  WorkModel(
    title: 'Hawkamah',
    thumbnail: 'assets/images/thumnail.png',
    date: DateTime(2024),
    type: "Mobile Application",
    links: [
      const LinkModel(
        link:
            "https://drive.google.com/drive/folders/1YiPVad2YlQln7-t08MeNYsCi-lX0r_A4?usp=sharing",
        type: LinkType.drive,
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
    thumbnail: "assets/images/thumnail.png",
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
    thumbnail: "assets/images/thumnail.png",
    links: [],
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
    thumbnail: "assets/images/thumnail.png",
    links: [],
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
    thumbnail: "assets/images/thumnail.png",
    links: [
      const LinkModel(
        link:
            "https://drive.google.com/file/d/17GIDXu603VRLg2Vn2e49WLd7We0kas9E/view?usp=sharing",
        type: LinkType.drive,
      )
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
    thumbnail: "assets/images/thumnail.png",
    links: [
      const LinkModel(
        link:
            "https://drive.google.com/file/d/1Ya2onib9m4kiIZfIcR98GfTTWoyvHlae/view?usp=sharing",
        type: LinkType.drive,
      )
    ],
    idDid: [
      "Build From [A-Z] RealState APP",
      "Provide Chat Service",
      "Preview Unit before Purchase",
    ],
  ),
  // agency
  WorkModel(
    title: "",
    description: "",
    date: DateTime(2023),
    type: "",
    thumbnail: "",
    links: [],
    idDid: [],
  ),
];
