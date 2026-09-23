import 'package:firebase_auth/firebase_auth.dart';

class FirebaseErrorHandler {
  static String handle(Object error) {
    if (error is FirebaseException) {
      switch (error.code) {
        case 'permission-denied':
          return 'You do not have permission to perform this action.';
        case 'unavailable':
          return 'Service is currently unavailable.';
        default:
          return error.message ?? 'Something went wrong.';
      }
    }
    return 'Something went wrong.';
  }
}