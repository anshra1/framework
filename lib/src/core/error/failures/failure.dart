// import 'package:baby_package/baby_package.dart';
// import 'package:equatable/equatable.dart';

// abstract class Failure extends Equatable {
//   const Failure({
//     required this.message,
//     this.code,
//     this.category = ErrorCategory.unknown,
//     this.severity = ErrorSeverity.low,
//     this.isRecoverable,
//   });

//   final String message;
//   final ErrorCode? code;
//   final ErrorCategory? category;
//   final ErrorSeverity severity;
//   final bool? isRecoverable;

//   @override
//   List<Object?> get props => [message, code];
// }

// class ServerFailure extends Failure {
//   const ServerFailure({
//     required super.message,
//     required super.code,
//     required super.category,
//     required super.isRecoverable,
//     required super.severity,
//   });
// }

// class StoreageFailure extends Failure {
//   const StoreageFailure({
//     required super.message,
//     super.code,
//     super.category,
//     super.isRecoverable,
//     super.severity,
//   });
// }

// class CacheFailure extends Failure {
//   const CacheFailure({
//     required super.message,
//     super.code,
//     super.category,
//     super.isRecoverable,
//     super.severity,
//   });
// }

// class AuthFailure extends Failure {
//   const AuthFailure({
//     required super.message,
//     super.code,
//     super.category,
//     super.isRecoverable,
//     super.severity,
//   });
// }

// class NetworkFailure extends Failure {
//   const NetworkFailure({
//     required super.message,
//     super.code,
//     super.category,
//     super.isRecoverable,
//     super.severity,
//   });
// }

// class ValidationFailure extends Failure {
//   const ValidationFailure({
//     required super.message,
//     required super.code,
//     super.category,
//     super.isRecoverable,
//     super.severity,
//   });

//   @override
//   List<Object?> get props => [...super.props];
// }

// class TimeoutFailure extends Failure {
//   const TimeoutFailure({
//     required super.message,
//     super.code,
//     super.category,
//     super.isRecoverable,
//     super.severity,
//   });

//   @override
//   List<Object?> get props => [...super.props];
// }

// class UnknownFailure extends Failure {
//   const UnknownFailure({
//     required super.message,
//     required super.severity,
//     super.code,
//     super.category,
//     super.isRecoverable,
//   });
// }
