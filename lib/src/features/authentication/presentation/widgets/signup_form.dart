import 'package:flutter/material.dart';

import '../../../coomon_widgets/custom_button.dart';
import '../../../coomon_widgets/custom_delimiter.dart';
import '../../../coomon_widgets/custom_form_field.dart';
import '../../../utils/colors.dart';
import '../../../utils/sizes.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
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
          const CustomFormField(
            hintText: 'Reenter your password...',
          ),
          const CustomDelimiter(),
          const CustomButton(
            text: 'Sign up',
          ),
          const CustomDelimiter(size: 0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Already have an account?',
                style: TextStyle(fontSize: defaultFont),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Sign in',
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
