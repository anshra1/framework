import 'package:flutter/material.dart';
import 'package:framework/src/core/theme/theme_barrel.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting Page'),
      ),
      body: const ThemeSwitch(),
    );
  }
}
