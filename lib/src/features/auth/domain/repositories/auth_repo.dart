import 'package:firebase_auth/firebase_auth.dart';
import 'package:framework/src/core/typedef/typedef.dart';

abstract class AuthRepo {
  ResultFuture<User?> signInWithGoogle();
  ResultFuture<bool> signOut();
}
