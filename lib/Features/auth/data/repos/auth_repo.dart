import 'package:moviebox/Features/auth/data/models/user_model.dart';

abstract class AuthRepo {
  Future<UserModel> registerWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> logOut();
}
