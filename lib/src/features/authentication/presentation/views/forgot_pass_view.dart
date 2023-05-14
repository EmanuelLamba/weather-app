import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../../common_widgets/custom_button.dart';
import '../../../../utils/sizes.dart' as sizes;
import '../../data/auth_repository.dart';
import '../../domain/auth_controller.dart';
import '../../domain/form_controller.dart';
import '../widgets/custom_back_button.dart';

class ForgotPassView extends StatelessWidget {
  const ForgotPassView({super.key});

  @override
  Widget build(final BuildContext context) {
    final AuthState authState = Provider.of<AuthState>(context);
    final double screenHeight = MediaQuery.of(context).size.height;
    return MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider<FormController>(
          create: (final _) => FormController.forgotPassword(),
        ),
        ChangeNotifierProvider<AuthController>(
          create: (final _) => AuthController(AuthRepository(), authState),
        ),
      ],
      child: Builder(
        builder: (final BuildContext context) {
          final FormController formController =
              Provider.of<FormController>(context);
          final AuthController authController =
              Provider.of<AuthController>(context);
          return Scaffold(
            body: Container(
              padding: const EdgeInsets.all(sizes.defaultSize),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 35,
                  ),
                  const CustomBackButton(),
                  SizedBox(
                    height: screenHeight > 800
                        ? MediaQuery.of(context).size.height / 7
                        : sizes.defaultDelimiter,
                  ),
                  const Text(
                    'Recover password',
                    style: TextStyle(fontSize: sizes.bigFont),
                  ),
                  const SizedBox(height: sizes.formDelimiter),
                  TextField(
                    decoration: const InputDecoration(
                      hintText: 'Enter your email...',
                    ),
                    onChanged: formController.onEmailChange,
                  ),
                  const SizedBox(height: sizes.formDelimiter),
                  CustomButton(
                    text: 'Send email',
                    onPressed: () async {
                      final bool isSuccess =
                          await authController.resetPassoword(
                        formController.state.email!.value!,
                        context,
                      );
                      if (isSuccess) {
                        await Future<void>.delayed(
                          const Duration(milliseconds: 500),
                        );
                        if (context.mounted) {
                          context.pop();
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
