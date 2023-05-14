// ignore_for_file: always_specify_types

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../core/error_handling/exceptions/error_codes.dart';
import '../../core/error_handling/snackbar_controller.dart';
import '../data/auth_repository.dart';

enum AuthStatus {
  authenticated,
  unauthenticated,
  unknown,
}

class AuthState extends ChangeNotifier {
  AuthState({this.status = AuthStatus.unknown});

  AuthStatus status;
  UserCredential? credential;

  void setState(
    final AuthStatus newStatus,
    final UserCredential? newCredential,
  ) {
    status = newStatus;
    credential = newCredential;
    notifyListeners();
  }

  @override
  String toString() {
    return '$status';
  }
}

class AuthController extends ChangeNotifier {
  AuthController(this.authRepository, this.authState);

  AuthState authState;

  final AuthRepository authRepository;
  final SnackBarController snackBar = SnackBarController();

  Future<void> createUser(
    final BuildContext context,
    final String email,
    final String password,
  ) async {
    final response = await authRepository.createUser(email, password);
    response.when(
      (final UserCredential success) {
        setAuthState(AuthStatus.authenticated, success);
      },
      (final String error) => snackBar
        ..setSnackbarMessage(error)
        ..showSnackBarError(context),
    );
  }

  Future<void> signInUser(
    final BuildContext context,
    final String email,
    final String password,
  ) async {
    final response = await authRepository.signInUser(email, password);
    response.when(
      (final UserCredential success) {
        setAuthState(AuthStatus.authenticated, success);
      },
      (final String error) => snackBar
        ..setSnackbarMessage(error)
        ..showSnackBarError(context),
    );
  }

  Future<void> signInWithGoogle(final BuildContext context) async {
    final respose = await authRepository.signInWithGoogle();
    respose.when(
        (final success) => setAuthState(AuthStatus.authenticated, success),
        (final String error) {
      if (error == userCancel) {
        return;
      }
      snackBar
        ..setSnackbarMessage(error)
        ..showSnackBarError(context);
    });
  }

  Future<void> signOutUser(final BuildContext context) async {
    final response = await authRepository.signOutUser();
    response.when((final String success) {
      setAuthState(AuthStatus.unauthenticated, null);
    }, (final String error) {
      snackBar
        ..setSnackbarMessage(error)
        ..showSnackBarError(context);
    });
  }

  Future<bool> resetPassoword(
    final String email,
    final BuildContext context,
  ) async {
    final response = await authRepository.resetPassword(email);
    final isSuccess = response.when((final success) {
      snackBar
        ..setSnackbarMessage('An email has been sent.')
        ..showSnackBarSuccess(context);
      return true;
    }, (final String error) {
      snackBar
        ..setSnackbarMessage(error)
        ..showSnackBarError(context);
      return false;
    });
    return isSuccess;
  }

  void setAuthState(final AuthStatus status, final UserCredential? credential) {
    authState.setState(status, credential);
  }
}
//listen for state changes
//create user done only review
//log in user done only review
//log out user done only review
//reset password
//delete user
//sing in with google
