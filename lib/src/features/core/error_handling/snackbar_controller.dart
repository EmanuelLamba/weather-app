import 'package:flutter/material.dart';

import '../../../utils/colors.dart' as colors;
import '../../../utils/sizes.dart' as sizes;

class SnackBarState {
  SnackBarState({required this.message});

  final String message;

  SnackBarState copyWith(final String? message) {
    return SnackBarState(
      message: message ?? this.message,
    );
  }

  @override
  String toString() {
    return message;
  }
}

class SnackBarController {
  factory SnackBarController() {
    return snackBarController;
  }

  SnackBarController._internal();

  static final SnackBarController snackBarController =
      SnackBarController._internal();

  SnackBarState state = SnackBarState(message: '');

  void showSnackBarSuccess(final BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(getSnackBar(state, colors.successColor));
  }

  void showSnackBarError(final BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(getSnackBar(state, colors.errorColor));
  }

  void setSnackbarMessage(final String message) {
    state = state.copyWith(message);
  }
}

SnackBar getSnackBar(final SnackBarState state, final Color color) {
  return SnackBar(
    content: Text(
      state.message,
      style: const TextStyle(fontSize: sizes.snackBarFont),
    ),
    backgroundColor: color,
  );
}
