import 'package:animated_app/core/global/app_theme.dart';
import 'package:animated_app/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:reusable_components/reusable_components.dart';

void main() {
  runApp(const AnimatedAppWithRive());
}

class AnimatedAppWithRive extends StatelessWidget {
  const AnimatedAppWithRive({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeConfig().init;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Flutter Way',
      theme: AppTheme.appTheme(),
      home: const OnboardingView(),
    );
  }
}
