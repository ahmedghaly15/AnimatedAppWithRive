import 'package:flutter/material.dart';
import 'package:reusable_components/reusable_components.dart';

import '../../../../core/global/app_assets.dart';
import '../../../../core/global/app_text_styles.dart';
import 'close_dialog_button.dart';
import 'sign_in_form.dart';
import 'social_icon_button.dart';

class DialogContent extends StatelessWidget {
  const DialogContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Column(
          children: <Widget>[
            const Text(
              "Sign In",
              style: AppTextStyles.textStyle40,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Access to 240+ hours of content. Learn design and code by building real apps with Flutter",
                textAlign: TextAlign.center,
              ),
            ),
            const SignInForm(),
            const Row(
              children: <Widget>[
                Expanded(
                  child: CustomDivider(
                    height: 1,
                    width: 50,
                    color: Colors.black26,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    "OR",
                    style: TextStyle(color: Colors.black26),
                  ),
                ),
                Expanded(
                  child: CustomDivider(
                    height: 1,
                    width: 50,
                    color: Colors.black26,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Text(
                "Sign up with Email, Apple or Google",
                style: TextStyle(color: Colors.black54),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SocialIconButton(
                  onPressed: () {},
                  icon: AppAssets.iconsEmailBox,
                ),
                SocialIconButton(
                  onPressed: () {},
                  icon: AppAssets.iconsAppleBox,
                ),
                SocialIconButton(
                  onPressed: () {},
                  icon: AppAssets.iconsGoogleBox,
                ),
              ],
            ),
          ],
        ),
        const CloseDialogButton(),
      ],
    );
  }
}
