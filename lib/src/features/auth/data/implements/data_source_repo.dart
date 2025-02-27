import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:framework/src/core/error/error_mapper.dart';
import 'package:framework/src/core/typedef/typedef.dart';
import 'package:framework/src/features/auth/data/sources/remote_data_source.dart';
import 'package:framework/src/features/auth/domain/repositories/auth_repo.dart';

class AuthRepositoryImpl implements AuthRepo {
  AuthRepositoryImpl({required this.authRemoteDataSource});

  final AuthRemoteDataSource authRemoteDataSource;

  @override
  ResultFuture<String?> getAuthToken() {
    throw UnimplementedError();
  }

  @override
  ResultFuture<bool> saveAuthToken(String token) {
    throw UnimplementedError();
  }

  @override
  ResultFuture<User?> signInWithGoogle() async {
    try {
      final result = await authRemoteDataSource.signInWithGoogle();
      return Right(result);
    } catch (e) {
      return Left(ErrorMapper.mapErrorToFailure(e));
    }
  }

  @override
  ResultFuture<bool> signOut() async {
    try {
      final result = await authRemoteDataSource.signOut();
      return Right(result);
    } catch (e) {
      return Left(ErrorMapper.mapErrorToFailure(e));
    }
  }
}
