import 'package:bloc_auth_flow/services/auth/auth_gate.dart';
import 'package:bloc_auth_flow/services/auth/login_or_register.dart';
import 'package:bloc_auth_flow/firebase_options.dart';
import 'package:bloc_auth_flow/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import 'theme/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      theme: lightMode,
    );
  }
}
