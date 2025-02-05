import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class BabyResponsiveToken {
  // Screen size breakpoints
  static const double mobileS = 320;
  static const double mobileM = 375;
  static const double mobileL = 425;
  static const double tablet = 768;
  static const double laptop = 1024;
  static const double laptopL = 1440;
  static const double desktop = 2560;

  // Orientation breakpoints
  static const double portraitBreakpoint = 600;
  static const double landscapeBreakpoint = 960;

  // Content scaling factors
  static double getScalingFactor(double screenWidth) {
    if (screenWidth >= desktop) return 1.2;
    if (screenWidth >= laptopL) return 1.1;
    if (screenWidth >= laptop) return 1;
    if (screenWidth >= tablet) return 0.9;
    return 0.8;
  }

  // Aspect ratios
  static const double mobileAspectRatio = 9 / 16;
  static const double tabletAspectRatio = 3 / 4;
  static const double desktopAspectRatio = 16 / 9;
}

// Extension on BuildContext for responsive utilities
extension ResponsiveContext on BuildContext {
  // Scale width based on screen size
  double scaleWidth(double value) => value.w;

  // Scale height based on screen size
  double scaleHeight(double value) => value.h;

  // Scale font size based on screen size
  double scaleFontSize(double value) {
    final scalingFactor =
        BabyResponsiveToken.getScalingFactor(1.sw); // Use ScreenUtil's screen width
    return (value * scalingFactor).sp * .5;
  }

  // Check if the device is a mobile
  bool get isMobile => 1.sw < BabyResponsiveToken.tablet;

  // Check if the device is a tablet
  bool get isTablet =>
      1.sw >= BabyResponsiveToken.tablet && 1.sw < BabyResponsiveToken.laptop;

  // Check if the device is a desktop
  bool get isDesktop => 1.sw >= BabyResponsiveToken.laptop;

  // Check orientation
  bool get isPortrait => 1.sw < BabyResponsiveToken.landscapeBreakpoint;

  bool get isLandscape => 1.sw >= BabyResponsiveToken.landscapeBreakpoint;
}

// Example reusable widget with dynamic scaling
class ScaledText extends StatelessWidget {
  const ScaledText({required this.text, required this.fontSize, super.key});
  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: context.scaleFontSize(fontSize)),
    );
  }
}

// Example screen to demonstrate responsiveness
class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ScaledText(text: 'Responsive App', fontSize: 20),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: context.scaleWidth(200),
              height: context.scaleHeight(100),
              color: Colors.blue,
              child: const Center(
                child: ScaledText(text: 'Scaled Text', fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Device Type: ${context.isMobile ? "Mobile" : context.isTablet ? "Tablet" : "Desktop"}',
              style: TextStyle(fontSize: 16.sp),
            ),
            Text(
              'Orientation: ${context.isPortrait ? "Portrait" : "Landscape"}',
              style: TextStyle(fontSize: 16.sp),
            ),
          ],
        ),
      ),
    );
  }
}
