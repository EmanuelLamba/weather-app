import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../../../../utils/sizes.dart' as sizes;

import '../../data/auth_repository.dart';
import '../../domain/auth_controller.dart';
import '../../domain/form_controller.dart';
import '../widgets/signing_form.dart';
import '../widgets/text_and_button.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(final BuildContext context) {
    final AuthState authState = Provider.of<AuthState>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.all(sizes.defaultSize),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
            ),
            const Text(
              'Sign Up',
              style: TextStyle(fontSize: sizes.bigFont),
            ),
            const SizedBox(height: sizes.formDelimiter),
            MultiProvider(
              providers: <SingleChildWidget>[
                ChangeNotifierProvider<FormController>(
                  create: (final _) => FormController.signIn(),
                ),
                ChangeNotifierProvider<AuthController>(
                  create: (final _) =>
                      AuthController(AuthRepository(), authState),
                ),
              ],
              child: const SigningForm(
                sendButtonText: 'Sign Up',
                isSingIn: false,
              ),
            ),
            const SizedBox(
              height: sizes.formDelimiter * 2,
            ),
            TextAndButton(
              text: 'Already have an account?',
              buttonText: 'Sign in',
              onPressed: () => context.go('/signin'),
            ),
          ],
        ),
      ),
    );
  }
}
