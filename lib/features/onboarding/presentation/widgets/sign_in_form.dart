import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive/rive.dart';

import '../../../../core/global/app_assets.dart';
import '../../../../core/global/app_colors.dart';
import 'custom_positioned.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    super.key,
  });

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isShowLoading = false;
  bool isShowConfetti = false;

  late SMITrigger check;
  late SMITrigger error;
  late SMITrigger reset;

  late SMITrigger confetti;

  StateMachineController getRiveController(Artboard artboard) {
    StateMachineController? controller = StateMachineController.fromArtboard(
      artboard,
      "State Machine 1",
    );

    artboard.addController(controller!);

    return controller;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text("Email"),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SvgPicture.asset(AppAssets.iconsEmail),
                    ),
                  ),
                  validator: (String? value) {
                    if (value!.isEmpty) return "";
                    return null;
                  },
                  onSaved: (email) {},
                ),
              ),
              const Text("Password"),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SvgPicture.asset(AppAssets.iconsPassword),
                    ),
                  ),
                  validator: (String? value) {
                    if (value!.isEmpty) return "";
                    return null;
                  },
                  onSaved: (password) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 24),
                child: ElevatedButton.icon(
                  onPressed: () => signIn(context),
                  icon: const Icon(
                    Icons.arrow_right_alt,
                    color: Color(0xFFFE0037),
                  ),
                  label: const Text("Sign In"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonColor,
                    minimumSize: const Size(double.infinity, 56),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(25.0),
                        bottomLeft: Radius.circular(25.0),
                        bottomRight: Radius.circular(25.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        isShowLoading
            ? CustomPositioned(
                child: RiveAnimation.asset(
                  AppAssets.riveAssetsCheck,
                  onInit: (Artboard artboard) {
                    StateMachineController controller =
                        getRiveController(artboard);
                    check = controller.findSMI("Check") as SMITrigger;
                    error = controller.findSMI("Error") as SMITrigger;
                    reset = controller.findSMI("Reset") as SMITrigger;
                  },
                ),
              )
            : const SizedBox(),
        isShowConfetti
            ? CustomPositioned(
                child: Transform.scale(
                  scale: 7,
                  child: RiveAnimation.asset(
                    AppAssets.riveAssetsConfetti,
                    onInit: (artboard) {
                      StateMachineController controller =
                          getRiveController(artboard);

                      confetti =
                          controller.findSMI("Trigger explosion") as SMITrigger;
                    },
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }

  void signIn(BuildContext context) {
    // First, once the SignIn button is clicked, it shows the loading

    setState(() {
      isShowLoading = true;
      isShowConfetti = true;
    });

    Future.delayed(
      const Duration(seconds: 1),
      () {
        if (_formKey.currentState!.validate()) {
          // If everything looks good, it shows success animation
          check.fire();
          Future.delayed(
            const Duration(seconds: 2),
            () {
              setState(() {
                isShowLoading = false;
              });

              confetti.fire();
            },
          );
        } else {
          // Or error animation
          error.fire();
          Future.delayed(
            const Duration(seconds: 2),
            () {
              setState(() {
                isShowLoading = false;
              });
            },
          );
        }
      },
    );
  }
}
