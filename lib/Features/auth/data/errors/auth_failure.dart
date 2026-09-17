import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:moviebox/core/errors/failures.dart';

class AuthFailure extends Failure {
  AuthFailure(super.errMessage);

  factory AuthFailure.fromFirebaseError(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return AuthFailure(
          'This email is already registered. Try logging in instead.',
        );

      case 'invalid-email':
        return AuthFailure(
          'Please enter a valid email address.',
        );

      case 'weak-password':
        return AuthFailure(
          'Password is too weak. Use at least 8 characters.',
        );

      case 'user-not-found':
        return AuthFailure(
          'No account found with this email.',
        );

      case 'wrong-password':
        return AuthFailure(
          'Incorrect password. Please try again.',
        );

      case 'invalid-credential':
        return AuthFailure(
          'Incorrect email or password.',
        );

      case 'user-disabled':
        return AuthFailure(
          'This account has been disabled.',
        );

      case 'too-many-requests':
        return AuthFailure(
          'Too many attempts. Please try again later.',
        );

      case 'network-request-failed':
        return AuthFailure(
          'No internet connection. Please check your network.',
        );

      case 'operation-not-allowed':
        return AuthFailure(
          'This sign-in method is not enabled.',
        );

      default:
        return AuthFailure(
          e.message ?? 'Authentication failed. Please try again.',
        );
    }
  }

  
  factory AuthFailure.fromGoogleSignInError(GoogleSignInException e) {
    switch (e.code) {
      case GoogleSignInExceptionCode.canceled:
        return AuthFailure('Google sign-in was cancelled.');

      case GoogleSignInExceptionCode.interrupted:
        return AuthFailure('Sign-in was interrupted. Please try again.');

      case GoogleSignInExceptionCode.clientConfigurationError:
        return AuthFailure(
          'Google sign-in is not configured correctly for this app.',
        );

      case GoogleSignInExceptionCode.providerConfigurationError:
        return AuthFailure(
          'Google sign-in is not set up correctly on this device.',
        );

      case GoogleSignInExceptionCode.uiUnavailable:
        return AuthFailure(
          'Google sign-in UI is unavailable right now. Please try again.',
        );

      default:
        return AuthFailure(
          e.description ?? 'Google sign-in failed. Please try again.',
        );
    }
  }
}