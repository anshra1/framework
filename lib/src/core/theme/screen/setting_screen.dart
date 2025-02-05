import 'package:flutter/material.dart';
import 'package:framework/src/core/theme/screen/theme_switch.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ThemeSwitch(),
          Divider(height: 32),
          // Add more settings sections here
        ],
      ),
    );
  }
}
