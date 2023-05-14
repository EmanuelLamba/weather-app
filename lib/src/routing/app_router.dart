import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/authentication/domain/auth_controller.dart';
import '../features/authentication/presentation/views/forgot_pass_view.dart';
import '../features/authentication/presentation/views/signin_view.dart';
import '../features/authentication/presentation/views/signup_view.dart';
import '../features/core/views/home_view.dart';

class AppRouter {
  AppRouter(this.authState);

  final AuthState authState;

  late final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (final BuildContext context, final GoRouterState state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: '/signin',
        builder: (final BuildContext context, final GoRouterState state) {
          return const SignInView();
        },
      ),
      GoRoute(
        path: '/forgotpassword',
        builder: (final BuildContext context, final GoRouterState state) {
          return const ForgotPassView();
        },
      ),
      GoRoute(
        path: '/signup',
        builder: (final BuildContext context, final GoRouterState state) {
          return const SignUpView();
        },
      ),
    ],
    redirect: (final BuildContext context, final GoRouterState state) {
      final bool isSignedIn = authState.status == AuthStatus.authenticated;
      final bool isSigninIn = state.matchedLocation == '/signin';
      final bool isSigninUp = state.matchedLocation == '/signup';
      final bool isForgotPassword = state.matchedLocation == '/forgotpassword';
      // print(authState.credential);
      if (!isSignedIn && !isSigninUp && !isForgotPassword) {
        return isSigninIn ? null : '/signin';
      }
      if (!isSignedIn && !isSigninIn && !isForgotPassword) {
        return isSigninUp ? null : '/signup';
      }
      if (!isSignedIn && !isSigninIn && !isSigninUp) {
        return isForgotPassword ? null : '/forgotpassword';
      }
      if (isSigninIn) {
        return '/';
      }
      return null;
    },
    refreshListenable: authState,
  );
}
