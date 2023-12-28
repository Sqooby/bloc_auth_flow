import 'package:bloc_auth_flow/app.dart';
import 'package:bloc_auth_flow/repo/firebase_user_repo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp(FirebaseUserRepo()));
}
