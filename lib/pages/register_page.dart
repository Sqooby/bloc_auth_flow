import 'package:bloc_auth_flow/components/my_botton.dart';
import 'package:bloc_auth_flow/components/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final TextEditingController _emailControl = TextEditingController();
  final TextEditingController _pwControl = TextEditingController();
  final TextEditingController _pwConfirmControl = TextEditingController();

  //login method
  void login() {}
  void register() {}

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
              hintText: 'email',
              obscureText: false,
              controller: _emailControl,
            ),
            const SizedBox(
              height: 10,
            ),

            // pw textfiled
            MyTextField(
              hintText: 'password',
              obscureText: true,
              controller: _pwControl,
            ),
            const SizedBox(
              height: 10,
            ),

            // pw textfiled
            MyTextField(
              hintText: 'password',
              obscureText: true,
              controller: _pwConfirmControl,
            ),
            const SizedBox(
              height: 25,
            ),
            // login button
            MyButton(text: "register", onTap: register),

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
                    onTap: register,
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
