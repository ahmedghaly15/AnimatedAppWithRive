import 'dart:ui';

import 'package:animated_app/core/global/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:rive/rive.dart';

import '../../../../core/global/app_assets.dart';
import 'custom_animated_button.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation(
      "active",
      // To stop animation of the button for the first time when the screen is opened
      // So it only works when the button is tapped
      autoplay: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          width: SizeConfig.screenWidth! * 1.7,
          bottom: 200,
          left: 100,
          child: Image.asset(AppAssets.backgroundsSpline),
        ),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
          ),
        ),
        const RiveAnimation.asset(AppAssets.riveAssetsShapes),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: const SizedBox(),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Spacer(),
                const SizedBox(
                  width: 260,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Learn design & code",
                        style: AppTextStyles.textStyle60,
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Don't skip design. Learn design and code, by building real apps with Flutter. Complete courses about the best tools",
                      ),
                    ],
                  ),
                ),
                const Spacer(flex: 2),
                CustomAnimatedButton(
                  btnAnimationController: _btnAnimationController,
                  onTap: () {
                    _btnAnimationController.isActive = true;
                  },
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.0),
                  child: Text(
                    "Purchase includes access to 30+ courses, 240+ premium tutorilas, 120+ hours of videos, source files and certificates",
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
