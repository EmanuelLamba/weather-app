// ignore_for_file: always_specify_types

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../core/error_handling/exceptions/app_exception.dart';
import '../../core/error_handling/exceptions/error_codes.dart';

class AuthRepository {
  final FirebaseAuth authInstance = FirebaseAuth.instance;

  Future<Result<UserCredential, String>> createUser(
    final String email,
    final String password,
  ) async {
    try {
      final UserCredential credential =
          await authInstance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Success(credential);
    } on FirebaseAuthException catch (err) {
      final String errorMessage =
          AppException.getFirebaseExceptions(err.code).message;
      return Error(errorMessage);
    }
  }

  Future<Result<UserCredential, String>> signInUser(
    final String email,
    final String password,
  ) async {
    try {
      final UserCredential credential =
          await authInstance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Success(credential);
    } on FirebaseAuthException catch (err) {
      final String errorMessage =
          AppException.getFirebaseExceptions(err.code).message;
      return Error(errorMessage);
    }
  }

  Future<Result<String, String>> signOutUser() async {
    try {
      if (authInstance.currentUser != null) {
        await authInstance.signOut();
        return const Success('User signed out succesful');
      }
      throw Exception('Unable to sign out user');
    } on FirebaseAuthException catch (err) {
      final String errorMessage =
          AppException.getFirebaseExceptions(err.code).message;
      return Error(errorMessage);
    } on Exception catch (err) {
      return Error(err.toString());
    }
  }

  Future<Result<String, String>> deleteAccount() async {
    try {
      if (authInstance.currentUser != null) {
        await authInstance.currentUser!.delete();
        return const Success('User successfully deleted');
      }
      throw Exception('Unable to delete user account');
    } on FirebaseAuthException catch (err) {
      final String errorMessage =
          AppException.getFirebaseExceptions(err.code).message;
      return Error(errorMessage);
    } on Exception catch (err) {
      return Error(err.toString());
    }
  }

  Future<Result<String, String>> resetPassword(final String email) async {
    try {
      await authInstance.sendPasswordResetEmail(email: email);
      return const Success('A password reset email has been sent');
    } on FirebaseAuthException catch (err) {
      final String errorMessage =
          AppException.getFirebaseExceptions(err.code).message;
      return Error(errorMessage);
    }
  }

  Future<Result<UserCredential, String>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        return const Error(userCancel);
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final authCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential credential =
          await authInstance.signInWithCredential(authCredential);
      return Success(credential);
    } on FirebaseAuthException catch (err) {
      final String errorMessage =
          AppException.getFirebaseExceptions(err.code).message;
      return Error(errorMessage);
    }
  }

  // createUser done only review
  // signIn(){} done only review
  // signOut(){} done only review
  // deleteAccount(){} done only review
  //listen for state changes
  //reset password done only review
  //singin with google done only review
}
