import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
