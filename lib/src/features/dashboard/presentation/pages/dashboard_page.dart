import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:framework/src/core/routes/names.dart';
import 'package:framework/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:framework/src/features/auth/presentation/cubit/auth_state.dart';
import 'package:go_router/go_router.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignOutSuccess) {
          context.pushNamed(RoutesName.login);
        }
      },
      builder: (context, state) {
        return Center(
          child: TextButton(
            onPressed: () {
              context.read<AuthCubit>().logout();
            },
            child: const Text('Log Out'),
          ),
        );
      },
    );
  }
}
