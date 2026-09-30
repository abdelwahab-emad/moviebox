import 'package:firebase_auth/firebase_auth.dart';
import 'package:moviebox/Features/auth/data/errors/auth_failure.dart';
import 'package:moviebox/Features/profile/data/repos/profile_repo.dart';
import 'package:moviebox/core/networking/api_result.dart';

class ProfileRepoImpl implements ProfileRepo {
  final FirebaseAuth _firebaseAuth;

  ProfileRepoImpl(this._firebaseAuth);

  @override
  String getCurrentEmail() => _firebaseAuth.currentUser?.email ?? '';

  @override
  String getCurrentName() => _firebaseAuth.currentUser?.displayName ?? '';

  @override
  Future<ApiResult<void>> updateName(String name) async {
    try {
      await _firebaseAuth.currentUser?.updateDisplayName(name);
      return Success(null);
    } on FirebaseAuthException catch (e) {
      return Failure(AuthFailure.fromFirebaseError(e).errMessage);
    }
  }

  @override
  Future<ApiResult<void>> updatePassword(String newPassword) async {
    try {
      await _firebaseAuth.currentUser?.updatePassword(newPassword);
      return Success(null);
    } on FirebaseAuthException catch (e) {
      return Failure(AuthFailure.fromFirebaseError(e).errMessage);
    }
  }
}
