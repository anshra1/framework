import 'package:flutter/material.dart';
import 'package:framework/src/core/widgets/buttons/button_types/animated_button.dart';
import 'package:framework/src/core/widgets/buttons/import.dart';

class WorkspacePage extends StatelessWidget {
  const WorkspacePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workspace Page'),
      ),
      body: const Center(
        child: Column(
          children: [
            PrimaryButton(
              label: 'Promat',
              isDisabled: true,
            ),
            AnimatedButton(text: 'ANimated'),
          ],
        ),
      ),
    );
  }
}
