import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:framework/src/core/constants/app_constants.dart';
import 'package:framework/src/core/routes/names.dart';
import 'package:go_router/go_router.dart';
// Import your routes file

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<String>(
        future: _determineInitialRoute(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            // Navigate to the determined route
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.pushReplacementNamed(snapshot.data ?? RoutesName.login);
            });
            return const SizedBox.shrink(); // Return an empty widget
          }
        },
      ),
    );
  }

  // Method to determine the initial route
  Future<String> _determineInitialRoute() async {
    final value =
        await const FlutterSecureStorage().read(key: AppConstants.secureStorageKey);
    if (value == null) {
      return RoutesName.login;
    }
    return RoutesName.dashboard;
  }
}
