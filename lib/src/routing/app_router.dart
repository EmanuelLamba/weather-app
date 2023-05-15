import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/authentication/domain/auth_controller.dart';
import '../features/authentication/presentation/views/forgot_pass_view.dart';
import '../features/authentication/presentation/views/signin_view.dart';
import '../features/authentication/presentation/views/signup_view.dart';
import '../features/core/presentation/views/account_info_view.dart';
import '../features/core/presentation/views/friends_view.dart';
import '../features/core/presentation/views/home_view.dart';
import '../features/core/presentation/views/recent_searches_view.dart';
import '../features/core/presentation/widgets/app_scaffold.dart';

class AppRouter {
  AppRouter(this.authState);

  final AuthState authState;

  final ValueKey<String> _scaffoldKey = const ValueKey<String>('Home Scaffold');

  late final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
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
      ShellRoute(
        builder: (
          final BuildContext context,
          final GoRouterState state,
          final Widget child,
        ) {
          return AppScaffold(child: child);
        },
        routes: <GoRoute>[
          GoRoute(
            path: '/',
            pageBuilder:
                (final BuildContext context, final GoRouterState state) {
              return NoTransitionPage<HomeView>(
                key: _scaffoldKey,
                child: const HomeView(),
              );
            },
          ),
          GoRoute(
            path: '/friends',
            pageBuilder:
                (final BuildContext context, final GoRouterState state) {
              return NoTransitionPage<HomeView>(
                key: _scaffoldKey,
                child: const FriendsView(),
              );
            },
          ),
          GoRoute(
            path: '/recent-searches',
            pageBuilder:
                (final BuildContext context, final GoRouterState state) {
              return NoTransitionPage<HomeView>(
                key: _scaffoldKey,
                child: const RecentSearchesView(),
              );
            },
          ),
          GoRoute(
            path: '/account-info',
            pageBuilder:
                (final BuildContext context, final GoRouterState state) {
              return NoTransitionPage<HomeView>(
                key: _scaffoldKey,
                child: const AccountInfoView(),
              );
            },
          )
        ],
      )
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
