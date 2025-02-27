import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:framework/firebase_options.dart';
import 'package:framework/re_name.dart';
import 'package:framework/src/core/services/config/injection_container.dart';

// Future<void> initializeWindow() async {
//   if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
//     await windowManager.ensureInitialized();

//     const windowOptions = WindowOptions(
//       size: Size(500, 800),
//       minimumSize: Size(500, 926),
//       maximumSize: Size(1920, double.infinity),
//       alwaysOnTop: true,
//       skipTaskbar: false,
//       titleBarStyle: TitleBarStyle.normal,
//     );

//     await windowManager.waitUntilReadyToShow(windowOptions, () async {
//       await windowManager.show();
//       await windowManager.focus();
//     });

//     await windowManager.setResizable(true);
//   }
// }

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

// FirebaseUIAuth.configureProviders([
//     GoogleProvider(clientId: GOOGLE_CLIENT_ID),
//   ]);

    await init();
    runApp(const RootApp());
  } catch (e) {
    runApp(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text('Error initializing app: $e'),
          ),
        ),
      ),
    );
  }
}
