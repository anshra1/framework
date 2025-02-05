import 'package:baby_package/baby_package.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:framework/src/features/auth/domain/repositories/repositories.dart';

class SignInWithGoogle {
  SignInWithGoogle({required this.repository});
  final AuthRepository repository;

  Future<Either<Failure, User>> call() async {
    return repository.signInWithGoogle();
  }
}

class SignOut {
  SignOut({required this.repository});
  final AuthRepository repository;

  Future<Either<Failure, void>> call() async {
    return repository.signOut();
  }
}
