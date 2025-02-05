import 'package:baby_package/baby_package.dart';
import 'package:flutter/material.dart';
import 'package:framework/src/core/design_system/typography_service.dart';

class SeedTheme {
  // Seed Colors
  static const _seedColors = (
    primary: Color(0xFF0061A4),
    secondary: Color(0xFF5856D6),
    tertiary: Color(0xFF34C759),
    error: Color(0xFFBA1A1A),
  );

  // Light Theme
  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: _seedColors.primary,
          secondary: _seedColors.secondary,
          error: _seedColors.error,
        ),
        textTheme: TextTheme(
          displayLarge: TypographyService().displayLarge,
          displayMedium: TypographyService().displayMedium,
          displaySmall: TypographyService().displaySmall,
          headlineLarge: TypographyService().headlineLarge,
          headlineMedium: TypographyService().headlineMedium,
          headlineSmall: TypographyService().headlineSmall,
          titleLarge: TypographyService().titleLarge,
          titleMedium: TypographyService().titleMedium,
          titleSmall: TypographyService().titleSmall,
          bodyLarge: TypographyService().bodyLarge,
          bodyMedium: TypographyService().bodyMedium,
          bodySmall: TypographyService().bodySmall,
          labelLarge: TypographyService().labelLarge,
          labelMedium: TypographyService().labelMedium,
          labelSmall: TypographyService().labelSmall,
        ),
        elevatedButtonTheme: _elevatedButtonTheme,
        outlinedButtonTheme: _outlinedButtonTheme,
        textButtonTheme: _textButtonTheme,
        inputDecorationTheme: _inputDecorationTheme,
        cardTheme: _cardTheme,
        appBarTheme: _appBarTheme,
        extensions: const [
          // CustomColors(
          //   success: Color(0xFF43A047),
          //   warning: Color(0xFFFFA000),
          //   info: Color(0xFF1976D2),
          //   border: Color(0xFFE0E0E0),
          // ),
        ],
      );

  // Dark Theme
  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: _seedColors.primary,
          secondary: _seedColors.secondary,
          error: _seedColors.error,
        ),
        textTheme: TextTheme(
          displayLarge: TypographyService().displayLarge,
          displayMedium: TypographyService().displayMedium,
          displaySmall: TypographyService().displaySmall,
          headlineLarge: TypographyService().headlineLarge,
          headlineMedium: TypographyService().headlineMedium,
          headlineSmall: TypographyService().headlineSmall,
          titleLarge: TypographyService().titleLarge,
          titleMedium: TypographyService().titleMedium,
          titleSmall: TypographyService().titleSmall,
          bodyLarge: TypographyService().bodyLarge,
          bodyMedium: TypographyService().bodyMedium,
          bodySmall: TypographyService().bodySmall,
          labelLarge: TypographyService().labelLarge,
          labelMedium: TypographyService().labelMedium,
          labelSmall: TypographyService().labelSmall,
        ),
        elevatedButtonTheme: _elevatedButtonTheme,
        outlinedButtonTheme: _outlinedButtonTheme,
        textButtonTheme: _textButtonTheme,
        inputDecorationTheme: _inputDecorationTheme,
        cardTheme: _cardTheme,
        appBarTheme: _appBarTheme,
        extensions: const [
          // CustomColors(
          //   success: Color(0xFF43A047),
          //   warning: Color(0xFFFFA000),
          //   info: Color(0xFF1976D2),
          //   border: Color(0xFF424242),
          // ),
        ],
      );

  // Component Themes
  static final _elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: ElevationTokens.level1,
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.md16,
        vertical: Spacing.sm12,
      ),
      minimumSize: Size(AppSize.minButtonWidth64, AppSize.buttonMD40),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.radiusMD8),
      ),
    ),
  );

  static final _outlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.md16,
        vertical: Spacing.sm12,
      ),
      minimumSize: Size(AppSize.minButtonWidth64, AppSize.buttonMD40),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.radiusMD8),
      ),
    ),
  );

  static final _textButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.sm12,
        vertical: Spacing.xxs4,
      ),
      minimumSize: Size(AppSize.minButtonWidth64, AppSize.buttonSM32),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.radiusMD8),
      ),
    ),
  );

  static final _inputDecorationTheme = InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(
      horizontal: Spacing.md16,
      vertical: Spacing.sm12,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.radiusMD8),
    ),
    filled: true,
  );

  static final _cardTheme = CardTheme(
    elevation: ElevationTokens.level1,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSize.radiusLG16),
    ),
    margin: const EdgeInsets.all(Spacing.sm12),
  );

  static const _appBarTheme = AppBarTheme(
    elevation: ElevationTokens.level0,
    centerTitle: true,
  );
}
