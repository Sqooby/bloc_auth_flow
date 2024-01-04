import 'package:bloc_auth_flow/pages/login_page.dart';
import 'package:bloc_auth_flow/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  //initially, show login page
  bool showLoginPage = true;

  //toogle between login and register page
  void tooglepages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        onTap: tooglepages,
      );
    } else {
      return RegisterPage(
        onTap: tooglepages,
      );
    }
  }
}
