import 'package:baby_package/baby_package.dart';

class ErrorMapper {
  static Failure mapErrorToFailure(dynamic error) {
    // Since exceptions already have proper messages and codes,
    // we just need to map them directly

    if (error is AppException) {
      return ServerFailure(
        message: error.showUImessage ?? 'Unknown Error',
        code: error.errorCode,
        category: error.category,
        isRecoverable: error.isRecoverable,
        severity: error.severity,
      );
    }

    if (error is ServerException) {
      return ServerFailure(
        message: error.showUImessage ?? 'Unknown Error',
        code: error.errorCode,
        category: error.category,
        isRecoverable: error.isRecoverable,
        severity: error.severity,
      );
    }

    // Validation Exceptions
    if (error is ValidationException) {
      return ValidationFailure(
        message: error.showUImessage ?? 'Unknown Error',
        code: error.errorCode,
        category: error.category,
        isRecoverable: error.isRecoverable,
        severity: error.severity,
      );
    }

    // Network Exceptions
    if (error is NetworkException) {
      return NetworkFailure(
        message: error.showUImessage ?? 'Unknown Error',
        code: error.errorCode,
        category: error.category,
        isRecoverable: error.isRecoverable,
        severity: error.severity,
      );
    }

    // Cache Exceptions
    if (error is CacheException) {
      return CacheFailure(
        message: error.showUImessage ?? 'Unknown Error',
        code: error.errorCode,
        category: error.category,
        isRecoverable: error.isRecoverable,
        severity: error.severity,
      );
    }

    if (error is StorageException) {
      return StoreageFailure(
        message: error.showUImessage ?? 'Unknown Error',
        code: error.errorCode,
        category: error.category,
        isRecoverable: error.isRecoverable,
        severity: error.severity,
      );
    }

    // Unknown/Unexpected Errors
    return const UnknownFailure(message: 'unknown Error');
  }
}
