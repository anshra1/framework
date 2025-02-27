import 'package:firebase_auth/firebase_auth.dart';
import 'package:framework/src/core/typedef/typedef.dart';
import 'package:framework/src/core/usecases/usecases.dart';
import 'package:framework/src/features/auth/domain/repositories/auth_repo.dart';

// Use case for signing in with Google
class SignInWithGoogle extends FutureUseCaseWithoutParams<User?> {
  const SignInWithGoogle({required this.authRepo});

  final AuthRepo authRepo;

  @override
  ResultFuture<User?> call() {
    return authRepo.signInWithGoogle();
  }
}



// Use case for signing out
class SignOut extends FutureUseCaseWithoutParams<bool> {
  const SignOut({required this.authRepo});

  final AuthRepo authRepo;

  @override
  ResultFuture<bool> call() {
    return authRepo.signOut();
  }
}
