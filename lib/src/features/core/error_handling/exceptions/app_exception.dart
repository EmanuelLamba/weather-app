import 'error_codes.dart';

class AppException {
  AppException(this.message);

  final String message;

  factory AppException.getFirebaseExceptions(final String code) {
    switch (code) {
      case emailExists:
        return AppException(emailExistsMessage);
      case internalError:
        return AppException(internalErrorMessage);
      case invalidCredential:
        return AppException(invalidCredentialMessage);
      case invalidPassword:
        return AppException(invalidPasswordMessage);
      case userDisabled:
        return AppException(userDisabledMessage);
      case userNotFound:
        return AppException(userNotFoundMessage);
      case wrongPassword:
        return AppException(wrongPasswordMessage);
      case userCancel:
        return AppException(userCancel);
      default:
        return AppException(unknownErrorMessage);
    }
  }

  // factory AppException.getAppExceptions(final String type) {
  //   switch (type) {
  //     case 'email-already-exists':
  //       return AppException('Email is already in use.');
  //     case 'internal-error':
  //       return AppException(
  //         'The server encountered an error. Please try again later.',
  //       );
  //     case 'invalid-credential':
  //       return AppException('The provided credential is invalid.');
  //     case 'invalid-password':
  //       return AppException('The provided password is invalid.');
  //     case 'user-not-found':
  //       return AppException('There is no user associated to this email.');
  //     default:
  //       return AppException('An unknown error occured');
  //   }
  // }
}
