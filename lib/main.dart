import 'package:animated_app/core/global/app_theme.dart';
import 'package:animated_app/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reusable_components/reusable_components.dart';

void main() {
  setSystemUIOverlayStyle();
  runApp(const AnimatedAppWithRive());
}

class AnimatedAppWithRive extends StatelessWidget {
  const AnimatedAppWithRive({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme(),
      home: const OnboardingView(),
    );
  }
}

void setSystemUIOverlayStyle() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    CustomHelper.setTheSystemUIOverlayStyle(),
  );
}
