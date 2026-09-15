import 'package:firebase_auth/firebase_auth.dart';
import 'package:moviebox/Features/auth/data/models/user_model.dart';
import 'package:moviebox/Features/auth/data/repos/auth_repo.dart';
import 'package:moviebox/core/errors/auth_failure.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuth _firebaseAuth;
  AuthRepoImpl(this._firebaseAuth);

  @override
  Future<UserModel> registerWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userCredential.user!.updateDisplayName(name);

      final user = userCredential.user!;

      return UserModel.fromFirebaseUser(
        uid: user.uid,
        displayName: name,
        email: user.email!,
      );
    } on FirebaseAuthException catch (e) {
      throw AuthFailure.fromFirebaseError(e);
    }
  }

  @override
  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user!;

      return UserModel.fromFirebaseUser(
        uid: user.uid,
        displayName: user.displayName ?? '',
        email: user.email!,
      );
    } on FirebaseAuthException catch (e) {
      throw AuthFailure.fromFirebaseError(e);
    }
  }

  @override
  Future<void> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }
}
