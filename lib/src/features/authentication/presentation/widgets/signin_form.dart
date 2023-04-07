import 'package:flutter/material.dart';

import '../../../coomon_widgets/custom_button.dart';
import '../../../coomon_widgets/custom_delimiter.dart';
import '../../../coomon_widgets/custom_form_field.dart';
import '../../../utils/colors.dart';
import '../../../utils/sizes.dart';
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
          const CustomButton(
            text: 'Sign in',
          ),
          const CustomDelimiter(size: 0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Don't have an account?",
                style: TextStyle(fontSize: defaultFont),
              ),
              TextButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpView())),
                child: const Text(
                  'Create one',
                  style: TextStyle(
                    fontSize: defaultFont,
                    color: detailColor,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
