// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:framework/src/core/system/logger/debug_logger.dart';
import 'package:framework/src/features/auth/domain/usecases/usecases.dart';
import 'package:framework/src/features/auth/presentation/cubit/auth_state.dart'; // Import the states defined above

class AuthCubit extends Cubit<AuthState> {
  // Constructor
  AuthCubit({
    required SignInWithGoogle signInWithGoogle,

    required SignOut signOut,
  })  : _signInWithGoogle = signInWithGoogle,
        
        _signOut = signOut,
        super(const AuthInitial()); // Initial state

  // Dependencies
  final SignInWithGoogle _signInWithGoogle;

  final SignOut _signOut;

  // Method to sign in with Google
  Future<void> signIn() async {
    emit(const AuthLoading());
    final result = await _signInWithGoogle();

    result.fold(
      (failure) =>
          emit(FailureState(message: failure.message, severity: failure.severity)),
      (userData) {
        DebugLogger.instance.info(userData);
        return emit(SignInSuccess(userData));
      },
    );
  }


  // Method to sign out
  Future<void> logout() async {
    emit(const AuthLoading());
    final result = await _signOut();

    result.fold(
      (failure) => emit(FailureState(message: '', severity: failure.severity)),
      (_) => emit(const SignOutSuccess()),
    );
  }
}
