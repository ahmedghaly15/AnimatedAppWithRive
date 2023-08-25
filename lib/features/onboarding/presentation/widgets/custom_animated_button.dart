import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../../../core/global/app_assets.dart';

class CustomAnimatedButton extends StatelessWidget {
  const CustomAnimatedButton({
    super.key,
    required RiveAnimationController btnAnimationController,
    required this.onTap,
  }) : _btnAnimationController = btnAnimationController;

  final RiveAnimationController _btnAnimationController;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 64,
        width: 260,
        child: Stack(
          children: <Widget>[
            RiveAnimation.asset(
              AppAssets.riveAssetsButton,
              controllers: [_btnAnimationController],
            ),
            const Positioned.fill(
              // To make exactly at the center
              top: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.arrow_right_alt),
                  SizedBox(width: 8),
                  Text(
                    "Start the course",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
