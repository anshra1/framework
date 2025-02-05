// import 'package:bloc/bloc.dart';
// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';
// import 'package:my_flutter_app/src/core/errors/failures.dart';
// import 'package:my_flutter_app/src/domain/entities/user.dart';
// import 'package:my_flutter_app/src/domain/usecases/sign_in_with_google.dart';
// import 'package:my_flutter_app/src/domain/usecases/sign_out.dart';

// part 'authentication_state.dart';

// class AuthenticationCubit extends Cubit<AuthenticationState> {
//   final SignInWithGoogle signInWithGoogle;
//   final SignOut signOut;

//   AuthenticationCubit({required this.signInWithGoogle, required this.signOut})
//       : super(AuthenticationInitial());

//   Future<void> signIn() async {
//     emit(AuthenticationLoading());
//     final failureOrUser = await signInWithGoogle();
//     emit(
//       failureOrUser.fold(
//         (failure) => AuthenticationFailure(message: _mapFailureToMessage(failure)),
//         (user) => AuthenticationSuccess(user: user),
//       ),
//     );
//   }

//   Future<void> logout() async {
//     emit(AuthenticationLoading());
//     final failureOrVoid = await signOut();
//     emit(
//       failureOrVoid.fold(
//         (failure) => AuthenticationFailure(message: _mapFailureToMessage(failure)),
//         (_) => AuthenticationInitial(),
//       ),
//     );
//   }

//   String _mapFailureToMessage(Failure failure) {
//     switch (failure.runtimeType) {
//       case ServerFailure:
//         return 'Server Failure';
//       case CacheFailure:
//         return 'Cache Failure';
//       default:
//         return 'Unexpected Error';
//     }
//   }
// }