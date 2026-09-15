class UserModel {
  final String uid;
  final String name;
  final String email;

  UserModel({required this.uid, required this.name, required this.email});

  factory UserModel.fromFirebaseUser({
    required String uid,
    required String displayName,
    required String email,
  }) {
    return UserModel(uid: uid, name: displayName, email: email);
  }
}
