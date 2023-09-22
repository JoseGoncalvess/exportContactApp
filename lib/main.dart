import 'package:exportontatcapp/view/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'view/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'database/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HomeController().getusername();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}
