import 'package:bloc_auth_flow/auth/login_or_register.dart';
import 'package:bloc_auth_flow/pages/login_page.dart';

import 'package:flutter/material.dart';

import 'theme/light_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginOrRegister(),
      theme: lightMode,
    );
  }
}
