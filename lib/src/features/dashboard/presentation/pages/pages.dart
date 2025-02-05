import 'package:baby_package/baby_package.dart';
import 'package:flutter/material.dart';
import 'package:framework/src/core/widgets/primary_button.dart';
import 'package:framework/src/core/widgets/responsive_text.dart';
import 'package:gap/gap.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Page'),
      ),
      body: Center(
        child: Column(
          children: [
            const ResponsiveButton(text: 'Testing'),
            const Gap(10),
            ResText.bodyLarge(
              'Hello World',
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            ResText.bodyLarge(
              'This is a body text example',
              
            ),
           
           AppText.bodyLarge(
              'This is a body text example',
            
            ),
         
          ],
        ),
      ),
    );
  }
}
