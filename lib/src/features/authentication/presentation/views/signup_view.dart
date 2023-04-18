import 'package:flutter/material.dart';
import '../../../../coomon_widgets/custom_delimiter.dart';
import '../../../../utils/sizes.dart' as sizes;

import '../widgets/signup_form.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(sizes.defaultSize),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.width / 3.5,
            ),
            const Text(
              'Sign Up',
              style: TextStyle(fontSize: sizes.bigFont),
            ),
            const CustomDelimiter(size: sizes.defaultSize),
            const SignUpForm(),
          ],
        ),
      ),
    );
  }
}
