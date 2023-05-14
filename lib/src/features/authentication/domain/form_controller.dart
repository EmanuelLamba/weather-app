import 'package:flutter/material.dart';

import '../../core/error_handling/snackbar_controller.dart';

class FieldItem {
  FieldItem(this.value, this.error);

  final String? value;
  final String? error;

  @override
  String toString() {
    return '$value, $error';
  }
}

class MyFormState {
  MyFormState({this.email, this.password});

  final FieldItem? email;
  final FieldItem? password;

  MyFormState copyWith({final FieldItem? email, final FieldItem? password}) {
    return MyFormState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  String toString() {
    return '$email, $password';
  }
}

class FormController extends ChangeNotifier {
  FormController(this.state);

  MyFormState state;

  factory FormController.signIn() {
    return FormController(
      MyFormState(
        email: FieldItem(null, null),
        password: FieldItem(null, null),
      ),
    );
  }

  factory FormController.forgotPassword() {
    return FormController(
      MyFormState(email: FieldItem(null, null)),
    );
  }

  final SnackBarController snackBarController = SnackBarController();

  final RegExp emailRegex = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );

  final RegExp passRegex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\()$&*~]).{8,}$');

  void onEmailChange(final String value) {
    if (emailRegex.hasMatch(value)) {
      state = state.copyWith(email: FieldItem(value, null));
    } else {
      state = state.copyWith(email: FieldItem(null, 'Invalid Email'));
    }
    notifyListeners();
  }

  void onPasswordChange(final String value) {
    if (passRegex.hasMatch(value)) {
      state = state.copyWith(password: FieldItem(value, null));
    } else {
      state = state.copyWith(password: FieldItem(null, 'Invalid Password'));
    }
    notifyListeners();
  }

  bool validateForm(final BuildContext context) {
    if (state.email?.error == null &&
        state.password?.error == null &&
        state.email?.value != null &&
        state.password?.value != null) {
      return true;
    }

    snackBarController
      ..setSnackbarMessage('Complete all fields')
      ..showSnackBarError(context);

    return false;
  }
}
// make controller reusable on more parts of the app 
// (create some factory constructors that you can use for specific cases)

// possibilities: 1. use a map with fields that contains specific FieldItem
// and pass it to the FormState
// 2. use factory constructors and return FormState based on the constructors
// like state for one field, two fields, three fields
// 3. 
