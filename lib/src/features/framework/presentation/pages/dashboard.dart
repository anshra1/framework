import 'package:flutter/material.dart';
import 'package:framework/src/core/theme/theme_barrel.dart';
import 'package:framework/src/core/widgets/custom_app_bar.dart';

class FrameWorkPage extends StatelessWidget {
  const FrameWorkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //   backgroundColor: Colors.amber,
      appBar: CustomAppBar(title: 'title'),
      body: ThemeSwitch(),
    );
  }
}
