import 'package:bloc_auth_flow/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRepository {
  Stream<User?> get user;
  Future<User> signUp(MyUser user, String password);
  Future<void> signIn(String email, String password);
  Future<void> setUserData(MyUser user);
}
