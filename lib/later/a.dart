// import 'dart:async';
// import 'package:flutter/foundation.dart';
// import 'package:stack_trace/stack_trace.dart';

// class OperationHandler {
//   /// Execute a synchronous operation with state management and error handling
//   static T execute<T>({
//     required T Function() action,
//     void Function()? onStart,
//     void Function(T result)? onSuccess,
//     void Function(Object error, StackTrace stackTrace)? onError,
//     bool enableAnalytics = true,
//   }) {
//     try {
//       onStart?.call(); // Notify start of operation
//       final result = action(); // Execute the operation
//       onSuccess?.call(result); // Notify success
//       return result;
//     } catch (error, stackTrace) {
//       _handleError(error, stackTrace, onError, enableAnalytics);
//       rethrow; // Rethrow after handling
//     }
//   }

//   /// Execute an asynchronous operation with state management and error handling
//   static Future<T> executeAsync<T>({
//     required Future<T> Function() action,
//     void Function()? onStart,
//     void Function(T result)? onSuccess,
//     void Function(Object error, StackTrace stackTrace)? onError,
//     bool enableAnalytics = true,
//   }) async {
//     try {
//       onStart?.call(); // Notify start of operation
//       final result = await action(); // Execute the operation
//       onSuccess?.call(result); // Notify success
//       return result;
//     } catch (error, stackTrace) {
//       _handleError(error, stackTrace, onError, enableAnalytics);
//       rethrow; // Rethrow after handling
//     }
//   }

//   /// Handle errors and report them to analytics/crash reporting tools
//   static void _handleError(
//     Object error,
//     StackTrace stackTrace,
//     void Function(Object error, StackTrace stackTrace)? onError,
//     bool enableAnalytics,
//   ) {
//     if (kDebugMode) {
//       _logErrorDetails(error, stackTrace); // Log detailed error in debug mode
//     }

//     // Call custom error handler if provided
//     onError?.call(error, stackTrace);

//     // Report error to analytics or crash reporting tools
//     if (enableAnalytics) {
//       _reportToAnalytics(error, stackTrace);
//     }
//   }

//   /// Log detailed error information (only in debug mode)
//   static void _logErrorDetails(Object error, StackTrace stackTrace) {
//     print('=== Error Details ===');
//     print('Timestamp: ${DateTime.now().toIso8601String()}');
//     print('Error: $error');
//     print('Error Type: ${error.runtimeType}');
//     print('Stack Trace:');
//     print(Chain.forTrace(stackTrace).terse);
//     print('=====================');
//   }

//   /// Report error to analytics or crash reporting tools
//   static void _reportToAnalytics(Object error, StackTrace stackTrace) {
//     // Example: Integrate with Firebase Crashlytics or another analytics tool
//     print('Reporting error to analytics: $error'); // Placeholder for actual implementation
//   }
// }