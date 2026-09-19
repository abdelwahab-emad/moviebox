import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:moviebox/Features/auth/data/repos/auth_repo.dart';
import 'package:moviebox/Features/auth/data/repos/auth_repo_impl.dart';
import 'package:moviebox/Features/home/data/repos/home_repo.dart';
import 'package:moviebox/Features/home/data/repos/home_repo_impl.dart';
import 'package:moviebox/core/networking/dio_factory.dart';

GetIt getIt = GetIt.instance;

Future<void> setupGetIt() async {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  GoogleSignIn googleSignIn = GoogleSignIn.instance;
  await googleSignIn.initialize(
    serverClientId:
        '256085641929-7t3tu2d8e8404jthibl8nmap8maivk8u.apps.googleusercontent.com',
  );

  getIt.registerLazySingleton<FirebaseAuth>(() => firebaseAuth);
  getIt.registerLazySingleton<GoogleSignIn>(() => googleSignIn);
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(getIt(), getIt()));

  getIt.registerLazySingleton<Dio>(() => DioFactory.getDio());
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(getIt()));
}
