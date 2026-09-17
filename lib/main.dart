import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moviebox/core/di/service_locator.dart';
import 'package:moviebox/firebase_options.dart';
import 'package:moviebox/movie_box.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupGetIt();
  runApp(const MovieBox());
}
