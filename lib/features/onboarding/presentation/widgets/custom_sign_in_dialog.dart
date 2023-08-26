import 'package:flutter/material.dart';
import 'package:reusable_components/reusable_components.dart';

import 'dialog_content.dart';

Future<Object?> customSignInDialog(BuildContext context,
    {required ValueChanged onClosed}) {
  return showGeneralDialog(
    // Close it when outside is tapped
    barrierDismissible: true,
    barrierLabel: "Sign In",
    context: context,
    pageBuilder: (context, _, __) => Center(
      child: Container(
        height: SizeConfig.screenHeight! * 0.75,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(
          vertical: 32,
          horizontal: 24,
        ),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.94),
          borderRadius: const BorderRadius.all(
            Radius.circular(40.0),
          ),
        ),
        child: const Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(child: DialogContent()),
        ),
      ),
    ),

    // To make the dialog animate while transitioning
    transitionDuration: const Duration(milliseconds: 400),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      Tween<Offset> tween;
      tween = Tween(begin: const Offset(0, -1), end: Offset.zero);

      return SlideTransition(
        position: tween.animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          ),
        ),
        child: child,
      );
    },
  ).then(onClosed);
}
