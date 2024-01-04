import 'package:bloc_auth_flow/auth/auth_service.dart';
import 'package:bloc_auth_flow/components/my_botton.dart';
import 'package:bloc_auth_flow/components/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key, required this.onTap});

  final TextEditingController _emailControl = TextEditingController();
  final TextEditingController _pwControl = TextEditingController();
  final TextEditingController _pwConfirmControl = TextEditingController();
  //tap to go to login page
  void Function()? onTap;

  //register method

  void register(BuildContext context) {
    //auth service
    final _auth = AuthService();

    //passwords match -> create user
    if (_pwControl.text == _pwConfirmControl.text) {
      try {
        _auth.singUpWithEmailPassword(_emailControl.text, _pwControl.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text('Passwords do now match'),
        ),
      );
    }

    // pasword dont match -> tell user to fix
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
              "Let's create account for you?",
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
              height: 10,
            ),

            // pw textfiled
            MyTextField(
              hintText: 'Confirm password',
              obscureText: true,
              controller: _pwConfirmControl,
            ),
            const SizedBox(
              height: 25,
            ),
            // login button
            MyButton(
              text: "Register",
              onTap: () => register(context),
            ),

            //register now
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                    onTap: onTap,
                    child: Text(
                      'Login now',
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
