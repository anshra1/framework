// lib/services/typography_service.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TypographyService {
  // Singleton pattern
  factory TypographyService() => _instance;
  TypographyService._internal();
  static final TypographyService _instance = TypographyService._internal();

  // Cache for performance
  final Map<String, TextStyle> _styleCache = {};

  // Core method for responsive text styling
  TextStyle getResponsiveStyle({
    double? fontSize,
    FontWeight? fontWeight = FontWeight.normal,
    double? height,
    Color? color,
  }) {
    final key = '${fontSize}_${fontWeight}_${height}_$color';

    return _styleCache.putIfAbsent(key, () {
      // Calculate scaled font size
      final scaledFontSize = fontSize != null ? ScreenUtil().setSp(fontSize) * 1.03 : null;

      // Calculate responsive height while maintaining ratio
      double? responsiveHeight;
      if (height != null && scaledFontSize != null && fontSize != null) {
        responsiveHeight = height * (scaledFontSize / fontSize);
      }

      return TextStyle(
        fontSize: scaledFontSize,
        fontWeight: fontWeight,
        height: responsiveHeight ?? height,
        color: color,
      );
    });
  }

  // Display styles
  TextStyle get displayLarge => getResponsiveStyle(
        fontSize: 57,
        height: 1.12,
      );

  TextStyle get displayMedium => getResponsiveStyle(
        fontSize: 45,
        height: 1.15,
      );

  TextStyle get displaySmall => getResponsiveStyle(
        fontSize: 36,
        height: 1.17,
      );

  // Headline styles
  TextStyle get headlineLarge => getResponsiveStyle(
        fontSize: 32,
        height: 1.25,
      );

  TextStyle get headlineMedium => getResponsiveStyle(
        fontSize: 28,
        height: 1.28,
      );

  TextStyle get headlineSmall => getResponsiveStyle(
        fontSize: 24,
        height: 1.33,
      );

  // Title styles
  TextStyle get titleLarge => getResponsiveStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        height: 1.27,
      );

  TextStyle get titleMedium => getResponsiveStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1.5,
      );

  TextStyle get titleSmall => getResponsiveStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.43,
      );

  // Label styles
  TextStyle get labelLarge => getResponsiveStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.43,
      );

  TextStyle get labelMedium => getResponsiveStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.33,
      );

  TextStyle get labelSmall => getResponsiveStyle(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        height: 1.45,
      );

  // Body styles
  TextStyle get bodyLarge => getResponsiveStyle(
        fontSize: 16,
        height: 1.5,
      );

  TextStyle get bodyMedium => getResponsiveStyle(
        fontSize: 14,
        height: 1.43,
      );

  TextStyle get bodySmall => getResponsiveStyle(
        fontSize: 12,
        height: 1.33,
      );

  // Clear cache if needed (e.g., when theme changes)
  void clearCache() {
    _styleCache.clear();
  }
}
