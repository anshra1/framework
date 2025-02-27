// Package imports:
import 'package:baby_package/baby_package.dart';
import 'package:dartz/dartz.dart';
import 'package:framework/src/core/error/failures/failure.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;
typedef ResultStream<T> = Stream<Either<Failure, T>>;
typedef DataMap = Map<String, dynamic>;
