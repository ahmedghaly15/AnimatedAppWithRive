import 'package:flutter/material.dart';

import '../global/app_assets.dart';

class Course {
  final String title, description, iconSrc;
  final Color bgColor;

  Course({
    required this.title,
    this.description = "Build and animate an IOS apps from scratch",
    this.iconSrc = AppAssets.iconsIos,
    this.bgColor = const Color(0xFF7553F6),
  });
}

List<Course> courses = <Course>[
  Course(
    title: "Dart Programming Language",
    description: "Everything you need to learn about Dart programming language",
    iconSrc: AppAssets.iconsCode,
  ),
  Course(
    title: "Animations in SwiftUI",
    bgColor: const Color(0xFF80A4FF),
  ),
  Course(
    title: "Animations in Flutter",
    description: "Build and animate an Android & IOS apps from scratch",
    iconSrc: AppAssets.iconsCode,
  ),
];

List<Course> recentCourses = <Course>[
  Course(title: "State Machine"),
  Course(
    title: "Animated Menu",
    iconSrc: AppAssets.iconsCode,
    bgColor: const Color(0xFF9CC5FF),
  ),
  Course(title: "Flutter with Rive"),
];
