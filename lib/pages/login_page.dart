import 'package:bloc_auth_flow/auth/auth_service.dart';
import 'package:bloc_auth_flow/components/my_botton.dart';
import 'package:bloc_auth_flow/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  //email na pw text controllers
  final TextEditingController _emailControl = TextEditingController();
  final TextEditingController _pwControl = TextEditingController();
  LoginPage({super.key, required this.onTap});

  //tap to go to register page
  void Function()? onTap;

  //login method
  void login(BuildContext context) async {
    //auth service
    final authService = AuthService();

    //try login
    try {
      await authService.singInWithEmailPassword(
        _emailControl.text,
        _pwControl.text,
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            const Icon(
              Icons.message,
              size: 70,
            ),

            //wecolme back message
            const SizedBox(
              height: 20,
            ),
            Text(
              "Welcome back, you've been missed?",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 25,
            ),

            // emial textfiled
            MyTextField(
              hintText: 'Email',
              obscureText: false,
              controller: _emailControl,
            ),
            const SizedBox(
              height: 10,
            ),

            // pw textfiled
            MyTextField(
              hintText: 'Password',
              obscureText: true,
              controller: _pwControl,
            ),
            const SizedBox(
              height: 25,
            ),
            // login button
            MyButton(
              text: "Login",
              onTap: () => login(context),
            ),

            //register now
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member? ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                    onTap: onTap,
                    child: Text(
                      'Register now',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
