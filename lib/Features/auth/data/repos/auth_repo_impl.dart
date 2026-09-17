import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:moviebox/Features/auth/data/errors/auth_failure.dart';
import 'package:moviebox/Features/auth/data/models/user_model.dart';
import 'package:moviebox/Features/auth/data/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AuthRepoImpl(this._firebaseAuth, this._googleSignIn);

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
  Future<UserModel> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.authenticate();
      final idToken = googleUser.authentication.idToken;
      final credential = GoogleAuthProvider.credential(idToken: idToken);
      final userCredential = await _firebaseAuth.signInWithCredential(
        credential,
      );
      final user = userCredential.user!;
      return UserModel.fromFirebaseUser(
        uid: user.uid,
        displayName: user.displayName ?? '',
        email: user.email!,
      );
    } on GoogleSignInException catch (e) {
      throw AuthFailure.fromGoogleSignInError(e);
    } on FirebaseAuthException catch (e) {
      throw AuthFailure.fromFirebaseError(e);
    }
  }

  @override
  Future<void> logOut() async {}
}
