import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../common_widgets/custom_button.dart';
import '../../../../utils/sizes.dart' as sizes;
import '../../data/auth_repository.dart';
import '../../domain/auth_controller.dart';
import '../../domain/form_controller.dart';
import '../widgets/google_button.dart';
import '../widgets/signing_form.dart';
import '../widgets/text_and_button.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(final BuildContext context) {
    final AuthState authState = Provider.of<AuthState>(context);

    return ChangeNotifierProvider<AuthController>(
      create: (final _) => AuthController(AuthRepository(), authState),
      child: Builder(
        builder: (final BuildContext context) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(sizes.defaultSize),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 6,
                    ),
                    const Text(
                      'Sign In',
                      style: TextStyle(fontSize: sizes.bigFont),
                    ),
                    const SizedBox(height: sizes.formDelimiter),
                    ChangeNotifierProvider<FormController>(
                      create: (final _) => FormController.signIn(),
                      child: const SigningForm(
                        sendButtonText: 'Sign In',
                        isSingIn: true,
                      ),
                    ),
                    const SizedBox(
                      height: sizes.formDelimiter * 2,
                    ),
                    CustomButton(
                      text: 'Recover your password',
                      onPressed: () async => context.push('/forgotpassword'),
                      isTextButton: true,
                    ),
                    const SizedBox(height: 4),
                    TextAndButton(
                      text: "Don't have an account?",
                      buttonText: 'Create one',
                      onPressed: () => context.go('/signup'),
                    ),
                    const SizedBox(height: sizes.defaultDelimiter),
                    GoogleButton(
                      onPressed: () async => Provider.of<AuthController>(
                        context,
                        listen: false,
                      ).signInWithGoogle(context),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
