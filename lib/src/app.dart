import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/authentication/domain/auth_controller.dart';
import 'routing/app_router.dart';
import 'theme/custom_theme.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(final BuildContext context) {
    return ChangeNotifierProvider<AuthState>(
      create: (final BuildContext context) => AuthState(),
      child: Builder(
        builder: (final BuildContext context) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: lightTheme(context),
          routerConfig: AppRouter(Provider.of<AuthState>(context)).router,
        ),
      ),
    );
  }
}
