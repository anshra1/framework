// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:my_flutter_app/src/presentation/blocs/authentication/authentication_cubit.dart';

// class LoginPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 context.read<AuthenticationCubit>().signIn();
//               },
//               child: Text('Sign In with Google'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 context.read<AuthenticationCubit>().logout();
//               },
//               child: Text('Logout'),
//             ),
//             BlocBuilder<AuthenticationCubit, AuthenticationState>(
//               builder: (context, state) {
//                 if (state is AuthenticationLoading) {
//                   return CircularProgressIndicator();
//                 } else if (state is AuthenticationSuccess) {
//                   return Column(
//                     children: [
//                       Text('Welcome, ${state.user.name}'),
//                       Image.network(state.user.photoUrl),
//                     ],
//                   );
//                 } else if (state is AuthenticationFailure) {
//                   return Text(state.message);
//                 } else {
//                   return Text('Please sign in');
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }