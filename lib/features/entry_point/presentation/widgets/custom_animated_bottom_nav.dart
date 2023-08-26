import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../../../core/global/app_colors.dart';
import '../../../../core/models/rive_asset.dart';
import '../../../../core/utils/rive_utils.dart';
import 'animated_bar.dart';

class CustomAnimatedBottomNav extends StatefulWidget {
  const CustomAnimatedBottomNav({super.key});

  @override
  State<CustomAnimatedBottomNav> createState() =>
      _CustomAnimatedBottomNavState();
}

class _CustomAnimatedBottomNavState extends State<CustomAnimatedBottomNav> {
  RiveAsset selectedBottomNav = bottomNavs.first;
  late SMIBool searchTrigger;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor2.withOpacity(0.8),
          borderRadius: const BorderRadius.all(Radius.circular(24)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ...List.generate(
              bottomNavs.length,
              (index) => GestureDetector(
                onTap: () {
                  bottomNavs[index].input!.change(true);

                  if (bottomNavs[index] != selectedBottomNav) {
                    setState(() {
                      selectedBottomNav = bottomNavs[index];
                    });
                  }

                  Future.delayed(
                    const Duration(seconds: 1),
                    () {
                      bottomNavs[index].input!.change(false);
                    },
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedBar(
                      isActive: bottomNavs[index] == selectedBottomNav,
                    ),
                    SizedBox(
                      height: 36,
                      width: 36,
                      child: Opacity(
                        opacity:
                            bottomNavs[index] == selectedBottomNav ? 1 : 0.5,
                        child: RiveAnimation.asset(
                          bottomNavs.first.src,
                          artboard: bottomNavs[index].artboard,
                          onInit: (artboard) {
                            StateMachineController controller =
                                RiveUtils.getRiveController(
                              artboard,
                              stateMachine: bottomNavs[index].stateMachineName,
                            );
                            bottomNavs[index].input =
                                controller.findSMI("active") as SMIBool;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
