import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/models/course.dart';
import 'course_card.dart';
import 'title_text.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const TitleText(title: "Courses"),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  ...courses
                      .map((course) => Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 5),
                            child: CourseCard(course: course),
                          ))
                      .toList(),
                ],
              ),
            ),
            const TitleText(title: "Recent"),
            ...recentCourses
                .map(
                  (recentCourse) => Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      bottom: 20.0,
                    ),
                    child: RecentCourseCard(course: recentCourse),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}

class RecentCourseCard extends StatelessWidget {
  const RecentCourseCard({
    super.key,
    required this.course,
  });

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: course.bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  course.title,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const Text(
                  "Watch video - 15 mins",
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
            child: VerticalDivider(
              color: Colors.white70,
            ),
          ),
          const SizedBox(width: 8),
          SvgPicture.asset(course.iconSrc),
        ],
      ),
    );
  }
}
