import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common_widgets/custom_button.dart';

import '../../../authentication/data/auth_repository.dart';
import '../../../authentication/domain/auth_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(final BuildContext context) {
    final AuthState authState = Provider.of<AuthState>(context);

    return ChangeNotifierProvider<AuthController>(
      create: (final _) => AuthController(AuthRepository(), authState),
      child: Builder(
        builder: (final BuildContext context) {
          final AuthController authController =
              Provider.of<AuthController>(context);
          return Center(
            child: CustomButton(
              text: 'Sign out',
              onPressed: () async {
                await authController.signOutUser(context);
              },
            ),
          );
        },
      ),
    );
  }
}
