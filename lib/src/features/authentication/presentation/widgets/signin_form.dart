import 'package:flutter/material.dart';

import '../../../../coomon_widgets/custom_button.dart';
import '../../../../coomon_widgets/custom_delimiter.dart';
import '../../../../coomon_widgets/custom_form_field.dart';
import '../../../../utils/colors.dart' as colors;
import '../../../../utils/sizes.dart' as sizes;
import '../views/signup_view.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          const CustomFormField(
            hintText: 'Enter your email...',
          ),
          const CustomDelimiter(),
          const CustomFormField(
            hintText: 'Enter your password...',
          ),
          const CustomDelimiter(),
          CustomButton(
            text: 'Sign in',
            onPressed: () {},
          ),
          const CustomDelimiter(
            size: -8,
          ),
          CustomButton(
            text: 'Recover your password',
            onPressed: () {},
            isTextButton: true,
          ),
          const CustomDelimiter(
            size: -16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Don't have an account?",
                style: TextStyle(fontSize: sizes.defaultFont),
              ),
              CustomButton(
                text: 'Create one',
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpView())),
                isTextButton: true,
              ),
            ],
          ),
          const CustomDelimiter(size: -8),
          CustomButton(
            assetImage: Container(
              decoration: const BoxDecoration(
                color: colors.primaryColor900,
                borderRadius: BorderRadius.all(Radius.circular(3)),
              ),
              width: 32,
              child: Image.asset(
                'assets/images/google_icon.png',
              ),
            ),
            text: 'Sign in with Google',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
