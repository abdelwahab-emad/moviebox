import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:moviebox/Features/auth/data/errors/auth_failure.dart';
import 'package:moviebox/Features/auth/data/models/user_model.dart';
import 'package:moviebox/Features/auth/data/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FirebaseFirestore _firestore;

  AuthRepoImpl(this._firebaseAuth, this._googleSignIn, this._firestore);

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

      await _saveUserToFirestore(uid: user.uid, name: name, email: email);

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
      final googleAuth = googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final userCredential = await _firebaseAuth.signInWithCredential(
        credential,
      );
      final user = userCredential.user;

      if (user == null) {
        throw AuthFailure('failed to recieve user data from firebase');
      }

      final String uid = user.uid;
      final String name = user.displayName?.isNotEmpty == true
          ? user.displayName!
          : (googleUser.displayName ?? 'user');
      final String email = user.email ?? googleUser.email;
      if (userCredential.additionalUserInfo?.isNewUser == true) {
        await _saveUserToFirestore(uid: uid, name: name, email: email);
      }
      return UserModel.fromFirebaseUser(
        uid: uid,
        displayName: name,
        email: email,
      );
    } on GoogleSignInException catch (e) {
      throw AuthFailure.fromGoogleSignInError(e);
    } on FirebaseAuthException catch (e) {
      throw AuthFailure.fromFirebaseError(e);
    }
  }

  @override
  Future<void> logOut() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.disconnect();
  }

  Future<void> _saveUserToFirestore({
    required String uid,
    required String name,
    required String email,
  }) async {
    await _firestore.collection('users').doc(uid).set({
      'uid': uid,
      'name': name,
      'email': email,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}
