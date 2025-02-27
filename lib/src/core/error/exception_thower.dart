import 'package:baby_package/baby_package.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:framework/src/core/error/firebase_error/firebase_error_config.dart';
import 'package:framework/src/core/system/logger/debug_logger.dart';

class Exp {
  static Never firebaseServerException({
    required FirebaseException firebaseException,
    required StackTrace dartStackTrace,
    required String methodName,
  }) {
    final serverity = FirebaseErrorConfig.getSeverity(firebaseException);
    final errorCode = FirebaseErrorConfig.getErrorCode(firebaseException);
    final isRecoverable = FirebaseErrorConfig.isRecoverable(firebaseException);
    final technicalMessage = FirebaseErrorConfig.technicalMessage(firebaseException);
    final category = FirebaseErrorConfig.getCategory(firebaseException);

    final serverException = ServerException(
      errorCode: errorCode,
      debugCode: firebaseException.code,
      showUImessage: firebaseException.message ?? 'Firebase Error Occurred',
      debugDetails:
          'Custom Details $technicalMessage \n Firebase StackTrace: ${firebaseException.stackTrace}',
      severity: serverity,
      isRecoverable: isRecoverable,
      dartError: 'Dart Error is FirebaseException',
      dartStackTrace: dartStackTrace.readable,
      methodName: methodName,
      errorCategory: category,
    );
    DebugLogger.instance.error(serverException.toString());
    throw serverException;
  }

  static Never unknownException({
    required dynamic error,
    required StackTrace stackTrace,
    required String methodName,
  }) {
    if (error is AppException) {
      DebugLogger.instance.error(error.toString());
      throw error; // Rethrow if already an AppException
    }

    throw UnknownException(
      dartError: error,
      methodName: methodName,
      dartStackTrace: stackTrace.readable,
    );
  }
}
