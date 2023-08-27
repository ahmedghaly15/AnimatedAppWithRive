import 'dart:math';

import 'package:animated_app/core/utils/rive_utils.dart';
import 'package:animated_app/core/widgets/animed_side_menu.dart';
import 'package:animated_app/features/entry_point/presentation/widgets/custom_animated_bottom_nav.dart';
import 'package:animated_app/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:reusable_components/reusable_components.dart';
import 'package:rive/rive.dart';

import '../../../../core/global/app_colors.dart';
import '../widgets/menu_button.dart';

class EntryPointView extends StatefulWidget {
  const EntryPointView({super.key});

  @override
  State<EntryPointView> createState() => _EntryPointViewState();
}

class _EntryPointViewState extends State<EntryPointView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scaleAnimation;

  late SMIBool isSidebarClosed;

  bool isSideMenuClosed = true;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..addListener(() {
        setState(() {});
      });

    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: AppColors.backgroundColor2,
      body: Stack(
        children: <Widget>[
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn,
            left: isSideMenuClosed ? -288 : 0,
            height: SizeConfig.screenHeight,
            width: 288,
            child: const AnimatedSideMenu(),
          ),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              // Rotate 30 degree
              ..rotateY(animation.value - 30 * animation.value * pi / 180),
            child: Transform.translate(
              offset: Offset(animation.value * 288, 0),
              child: Transform.scale(
                scale: scaleAnimation.value,
                child: const ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  child: HomeView(),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            // top: 10,
            left: isSideMenuClosed ? 0 : 220,
            child: MenuButton(
              riveOnInit: (artboard) {
                StateMachineController controller = RiveUtils.getRiveController(
                  artboard,
                  stateMachine: "State Machine",
                );

                isSidebarClosed = controller.findSMI("isOpen") as SMIBool;

                isSidebarClosed.value = true;
              },
              onTap: () {
                isSidebarClosed.value = !isSidebarClosed.value;

                if (isSideMenuClosed) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }

                setState(() {
                  isSideMenuClosed = isSidebarClosed.value;
                });
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Transform.translate(
        // To hide it when SideMenu is Open
        offset: Offset(0, 100 * animation.value),
        child: const CustomAnimatedBottomNav(),
      ),
    );
  }
}
