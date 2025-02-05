import 'package:baby_package/baby_package.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';


abstract class AuthRepository {
  Future<Either<Failure, User>> signInWithGoogle();
  Future<Either<Failure, void>> signOut();
}