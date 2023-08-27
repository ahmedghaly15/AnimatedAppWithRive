import 'package:flutter/material.dart';

import '../../../../core/models/course.dart';
import 'course_card.dart';
import 'recent_course_card.dart';
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
            Container(
              margin: const EdgeInsets.only(top: 42),
              child: const TitleText(title: "Courses"),
            ),
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
