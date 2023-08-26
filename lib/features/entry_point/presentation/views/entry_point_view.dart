import 'package:animated_app/features/entry_point/presentation/widgets/custom_animated_bottom_nav.dart';
import 'package:animated_app/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';

class EntryPointView extends StatelessWidget {
  const EntryPointView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: HomeView(),
      bottomNavigationBar: CustomAnimatedBottomNav(),
    );
  }
}