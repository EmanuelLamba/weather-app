import 'package:flutter/material.dart';

import '../../../coomon_widgets/app_background.dart';
import '../../../coomon_widgets/custom_delimiter.dart';
import '../../../utils/sizes.dart';
import '../widgets/signin_form.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(final BuildContext context) {
    return AppBackground(
      child: Container(
        padding: const EdgeInsets.all(defaultSize),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.width / 3.5,
            ),
            const Text(
              'Sign In',
              style: TextStyle(fontSize: bigFont),
            ),
            const CustomDelimiter(size: 26),
            const SignInForm(),
          ],
        ),
      ),
    );
  }
}
