import 'package:flutter/material.dart';
import 'package:portfolio/model/experience_model.dart';

width(context) => MediaQuery.of(context).size.width;

height(context) => MediaQuery.of(context).size.height;

sbh(double h) => SizedBox(
      height: h,
    );

sbw(double w) => SizedBox(
      width: w,
    );

unFocus() {
  FocusManager.instance.primaryFocus?.unfocus();
}

class Constants {
  static const String name = "Muhammed Jasir.";
  static const String objective = "With three years of experience in Flutter, I’ve built high-performance, cross-platform apps driven by a passion for seamless user experiences. Recently, I expanded into backend development with Node.js, adding server-side skills to my toolkit for more versatile problem-solving.";
  static const String tagLine = "I build Android and iOS apps";
  static const String shortDescription =
      "I'm a developer started my tech courier as a flutter developer. im passionate about building scalable "
      "and ui/ux rich application";

  static const String aboutMe = 'Hello,'
      '''Im a passionate developer with an experience in mobile application development,
seeking a developer role to utilise my knowledge and skill to the level best, by
building good designed scalable applications, which can
helpful in the day to day life''';

  static const List tech = ["Flutter", "Dart", "Firebase", "Java", "Node js"];

  static List<ExperienceModel> experience = [
    ExperienceModel(
      title: "Global study Uk",
      link:
          "https://play.google.com/store/apps/details?id=com.globalstudyuk.gsuk&hl=en_US&gl=US",
      date: "July 2022",
      description:
          "which is an application for students who applied invarious universities, in which they can track theirstatusand updates and share documents.",
      techs: [
        "Document uploading and downloading with progress",
        "Push notification",
        "Firebase analytics.",
      ],
    ),
    ExperienceModel(
      title: "Lori",
      date: "July 2022",
      description:
          "Lori is an application for transport services, whereUsers can transport and receive goods.",
      techs: [
        "Dynamic Form",
        "Push notification",
        "Social sign in.",
      ],
    ),
    ExperienceModel(
      title: "Mark Builders",
      date: "March 2021",
      description:
          "It is a staff management application where employees of A construction company can mark their attendance with location , can report materials needed and their daily work tasks accomplished etc.",
      techs: [
        "Firebase authentication",
        "Push notification",
        "local notification.",
      ],
    ),
    ExperienceModel(
      title: "QFoodie",
      date: "August 2021",
      link: "https://play.google.com/store/apps/details?id=com.jithuz.qFoodie",
      description:
          "QFoodie is a small application for monitoring sales and purchases of a chain of restaurants and bakeries, the data will keep updating every minutes",
      techs: ["Authentication", "Data updating"],
    ),
    ExperienceModel(
      title: "Winternet",
      date: "June 2021",
      description:
          "Winternet is for visitors who visit the firm where they can mark their identity and visiting details.",
      techs: [
        "Dynamic forms",
        "Bluetooth Printing",
      ],
    ),
  ];
}
