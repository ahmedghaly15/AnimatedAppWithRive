import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialIconButton extends StatelessWidget {
  const SocialIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  final VoidCallback onPressed;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 40,
      onPressed: onPressed,
      icon: SvgPicture.asset(
        icon,
      ),
    );
  }
}
