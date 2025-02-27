part of 'injection_container.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  await auth();
}

Future<void> auth() async {
  const secureStorage = FlutterSecureStorage();
  final googleSignIn = GoogleSignIn();

  sl
    ..registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        secureStorage: secureStorage,
        googleSignIn: googleSignIn,
      ),
    )
    ..registerLazySingleton<AuthRepo>(
      () => AuthRepositoryImpl(authRemoteDataSource: sl()),
    )
    ..registerLazySingleton(() => SignInWithGoogle(authRepo: sl()))
  
    ..registerLazySingleton(() => SignOut(authRepo: sl()))
    //
    ..registerFactory(
      () => AuthCubit(
        signInWithGoogle: sl(),
       
        signOut: sl(),
      ),
    );
}
