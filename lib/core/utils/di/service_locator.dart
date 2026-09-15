import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:moviebox/Features/auth/data/repos/auth_repo.dart';
import 'package:moviebox/Features/auth/data/repos/auth_repo_impl.dart';

GetIt getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<FirebaseAuth>(
    () => FirebaseAuth.instance,
  );

  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(getIt()),
  );
}