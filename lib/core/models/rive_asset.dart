import 'package:rive/rive.dart';

import '../global/app_assets.dart';

class RiveAsset {
  final String artboard, stateMachineName, title, src;
  late SMIBool? input;

  RiveAsset(
    this.src, {
    required this.artboard,
    required this.stateMachineName,
    required this.title,
    this.input,
  });

  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> bottomNavs = <RiveAsset>[
  RiveAsset(
    AppAssets.riveAssetsIcons,
    artboard: "CHAT",
    stateMachineName: "CHAT_Interactivity",
    title: "Chat",
  ),
  RiveAsset(
    AppAssets.riveAssetsIcons,
    artboard: "SEARCH",
    stateMachineName: "SEARCH_Interactivity",
    title: "Search",
  ),
  RiveAsset(
    AppAssets.riveAssetsIcons,
    artboard: "TIMER",
    stateMachineName: "TIMER_Interactivity",
    title: "Timer",
  ),
  RiveAsset(
    AppAssets.riveAssetsIcons,
    artboard: "BELL",
    stateMachineName: "BELL_Interactivity",
    title: "Notifications",
  ),
  RiveAsset(
    AppAssets.riveAssetsIcons,
    artboard: "USER",
    stateMachineName: "USER_Interactivity",
    title: "Profile",
  ),
];

List<RiveAsset> sideMenus = <RiveAsset>[
  RiveAsset(
    AppAssets.riveAssetsIcons,
    artboard: "HOME",
    stateMachineName: "HOME_interactivity",
    title: "Home",
  ),
  RiveAsset(
    AppAssets.riveAssetsIcons,
    artboard: "SEARCH",
    stateMachineName: "SEARCH_Interactivity",
    title: "Search",
  ),
  RiveAsset(
    AppAssets.riveAssetsIcons,
    artboard: "LIKE/STAR",
    stateMachineName: "STAR_Interactivity",
    title: "Favorites",
  ),
  RiveAsset(
    AppAssets.riveAssetsIcons,
    artboard: "CHAT",
    stateMachineName: "CHAT_Interactivity",
    title: "Help",
  ),
];

List<RiveAsset> historySideMenus = <RiveAsset>[
  RiveAsset(
    AppAssets.riveAssetsIcons,
    artboard: "TIMER",
    stateMachineName: "TIMER_Interactivity",
    title: "History",
  ),
  RiveAsset(
    AppAssets.riveAssetsIcons,
    artboard: "BELL",
    stateMachineName: "BELL_Interactivity",
    title: "Notifications",
  ),
];
