import 'package:baby_package/baby_package.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Base state for authentication
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

// Initial state
class AuthInitial extends AuthState {
  const AuthInitial();
}

// Loading state (when an operation is in progress)
class AuthLoading extends AuthState {
  const AuthLoading();
}

// Success state for signing in with Google
class SignInSuccess extends AuthState {
  const SignInSuccess(this.userData);

  final User? userData;

  @override
  List<Object?> get props => [userData];
}

// Success state for saving an auth token
class SaveAuthTokenSuccess extends AuthState {
  const SaveAuthTokenSuccess();
}

// Success state for retrieving an auth token
class GetAuthTokenSuccess extends AuthState {
  const GetAuthTokenSuccess(this.token);

  final String? token;

  @override
  List<Object?> get props => [token];
}

class SignOutSuccess extends AuthState {
  const SignOutSuccess();
}

class FailureState extends AuthState {
  const FailureState({
    required this.message,
    required this.severity,
    this.code,
    this.category,
    this.isRecoverable,
  });

  final String message;
  final ErrorCode? code;
  final ErrorCategory? category;
  final ErrorSeverity severity;
  final bool? isRecoverable;

  @override
  List<Object?> get props => [message, code];
}
