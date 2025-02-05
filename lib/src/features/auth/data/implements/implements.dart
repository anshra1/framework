// import 'package:dartz/dartz.dart';
// import 'package:my_flutter_app/src/core/errors/failures.dart';
// import 'package:my_flutter_app/src/data/datasources/local/auth_local_data_source.dart';
// import 'package:my_flutter_app/src/data/datasources/remote/auth_remote_data_source.dart';
// import 'package:my_flutter_app/src/data/models/user_model.dart';
// import 'package:my_flutter_app/src/domain/repositories/auth_repository.dart';

// class AuthRepositoryImpl implements AuthRepository {
//   final AuthRemoteDataSource remoteDataSource;
//   final AuthLocalDataSource localDataSource;

//   AuthRepositoryImpl({
//     required this.remoteDataSource,
//     required this.localDataSource,
//   });

//   @override
//   Future<Either<Failure, User>> signInWithGoogle() async {
//     try {
//       final UserModel userModel = await remoteDataSource.signInWithGoogle();
//       await localDataSource.cacheUser(userModel);
//       return Right(userModel);
//     } catch (e) {
//       return Left(ServerFailure(message: e.toString()));
//     }
//   }

//   @override
//   Future<Either<Failure, void>> signOut() async {
//     try {
//       await remoteDataSource.signOut();
//       await localDataSource.clearUser();
//       return Right(unit);
//     } catch (e) {
//       return Left(ServerFailure(message: e.toString()));
//     }
//   }
// }