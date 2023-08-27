import 'package:animated_app/core/models/rive_asset.dart';
import 'package:animated_app/core/utils/rive_utils.dart';
import 'package:animated_app/core/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'info_card.dart';
import 'side_menu_tile.dart';

class AnimatedSideMenu extends StatefulWidget {
  const AnimatedSideMenu({super.key});

  @override
  State<AnimatedSideMenu> createState() => _AnimatedSideMenuState();
}

class _AnimatedSideMenuState extends State<AnimatedSideMenu> {
  RiveAsset selectedMenu = sideMenus.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: const Color(0xFF17203A),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const InfoCard(
                name: "Ahmed Ghaly",
                profession: "Flutter Developer",
              ),
              const SectionTitle(title: "Browse"),
              ...sideMenus.map(
                (menu) => SideMenuTile(
                  isActive: selectedMenu == menu,
                  menu: menu,
                  riveOnInit: (artboard) {
                    StateMachineController controller =
                        RiveUtils.getRiveController(
                      artboard,
                      stateMachine: menu.stateMachineName,
                    );

                    menu.input = controller.findSMI("active") as SMIBool;
                  },
                  onTap: () {
                    menu.input!.change(true);

                    Future.delayed(
                      const Duration(seconds: 1),
                      () {
                        menu.input!.change(false);
                      },
                    );

                    setState(() {
                      selectedMenu = menu;
                    });
                  },
                ),
              ),
              const SectionTitle(title: "History"),
              ...historySideMenus.map(
                (menu) => SideMenuTile(
                  isActive: selectedMenu == menu,
                  menu: menu,
                  riveOnInit: (artboard) {
                    StateMachineController controller =
                        RiveUtils.getRiveController(
                      artboard,
                      stateMachine: menu.stateMachineName,
                    );

                    menu.input = controller.findSMI("active") as SMIBool;
                  },
                  onTap: () {
                    menu.input!.change(true);

                    Future.delayed(
                      const Duration(seconds: 1),
                      () {
                        menu.input!.change(false);
                      },
                    );

                    setState(() {
                      selectedMenu = menu;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
