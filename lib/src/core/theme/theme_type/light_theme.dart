import 'package:baby_package/baby_package.dart';
import 'package:flutter/material.dart';
import 'package:framework/src/core/design_system/colors.dart';

class LightTheme {
  static ThemeData get theme => ThemeData(
        scaffoldBackgroundColor: DSColors.lightBackgroundPrimary,
        brightness: Brightness.light,
        useMaterial3: true,
        elevatedButtonTheme: _elevatedButtonTheme,
        outlinedButtonTheme: _outlinedButtonTheme,
        textButtonTheme: _textButtonTheme,
        inputDecorationTheme: _inputDecorationTheme,
        cardTheme: _cardTheme,
        appBarTheme: _appBarTheme,
        dividerTheme: _dividerTheme,
        dialogTheme: _dialogTheme,
        tooltipTheme: _tooltipTheme,
        colorScheme: const ColorScheme.light(
          primary: DSColors.primaryMain,
          primaryContainer: DSColors.primaryLight,
          secondary: DSColors.secondary,
          secondaryContainer: DSColors.secondaryLight,
          error: DSColors.error,
          onSecondary: DSColors.lightTextInverse,
          onSurface: DSColors.lightTextPrimary,
        ),
        textTheme: TextTheme(
          displayLarge:
              AppFonts.displayLarge.copyWith(color: DSColors.lightTextPrimary),
          displayMedium: AppFonts
              .displayMedium
              .copyWith(color: DSColors.lightTextPrimary),
          displaySmall:
              AppFonts.displaySmall.copyWith(color: DSColors.lightTextPrimary),
          headlineLarge: AppFonts
              .headlineLarge
              .copyWith(color: DSColors.lightTextPrimary),
          headlineMedium: AppFonts
              .headlineMedium
              .copyWith(color: DSColors.lightTextPrimary),
          headlineSmall: AppFonts
              .headlineSmall
              .copyWith(color: DSColors.lightTextPrimary),
          titleLarge:
              AppFonts.titleLarge.copyWith(color: DSColors.lightTextPrimary),
          titleMedium:
              AppFonts.titleMedium.copyWith(color: DSColors.lightTextPrimary),
          titleSmall:
              AppFonts.titleSmall.copyWith(color: DSColors.lightTextPrimary),
          labelLarge:
              AppFonts.labelLarge.copyWith(color: DSColors.lightTextPrimary),
          labelMedium:
              AppFonts.labelMedium.copyWith(color: DSColors.lightTextPrimary),
          labelSmall:
              AppFonts.labelSmall.copyWith(color: DSColors.lightTextPrimary),
          bodyLarge:
              AppFonts.bodyLarge.copyWith(color: DSColors.lightTextPrimary),
          bodyMedium:
              AppFonts.bodyMedium.copyWith(color: DSColors.lightTextPrimary),
          bodySmall:
              AppFonts.bodySmall.copyWith(color: DSColors.lightTextPrimary),
        ),
      );

  // Elevated Button Theme
  static final _elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: ElevationTokens.level1,
      padding:
          const EdgeInsets.symmetric(horizontal: Spacing.md16, vertical: Spacing.sm12),
      minimumSize: Size(AppSize.minButtonWidth64, AppSize.buttonMD40),
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.radiusMD8)),
      backgroundColor: DSColors.primaryMain,
      foregroundColor: DSColors.lightTextInverse,
    ),
  );

  // Outlined Button Theme
  static final _outlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      padding:
          const EdgeInsets.symmetric(horizontal: Spacing.md16, vertical: Spacing.sm12),
      minimumSize: Size(AppSize.minButtonWidth64, AppSize.buttonMD40),
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.radiusMD8)),
      side: const BorderSide(color: DSColors.lightBorder),
      foregroundColor: DSColors.lightTextPrimary,
    ),
  );

  // Text Button Theme
  static final _textButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      padding:
          const EdgeInsets.symmetric(horizontal: Spacing.sm12, vertical: Spacing.xxs4),
      minimumSize: Size(AppSize.minButtonWidth64, AppSize.buttonSM32),
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.radiusMD8)),
      foregroundColor: DSColors.lightTextPrimary,
    ),
  );

  // Input Decoration Theme
  static final _inputDecorationTheme = InputDecorationTheme(
    contentPadding:
        const EdgeInsets.symmetric(horizontal: Spacing.md16, vertical: Spacing.sm12),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.radiusMD8),
      borderSide: const BorderSide(color: DSColors.lightBorder),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.radiusMD8),
      borderSide: const BorderSide(color: DSColors.lightBorder),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.radiusMD8),
      borderSide: const BorderSide(color: DSColors.lightBorderFocus, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.radiusMD8),
      borderSide: const BorderSide(color: DSColors.lightBorderError),
    ),
    filled: true,
    fillColor: DSColors.lightBackgroundSecondary,
  );

  // Card Theme
  static final _cardTheme = CardTheme(
    elevation: ElevationTokens.level1,
    shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.radiusLG16)),
    margin: const EdgeInsets.all(Spacing.sm12),
    color: DSColors.lightSurface,
  );

  // AppBar Theme
  static const _appBarTheme = AppBarTheme(
    elevation: ElevationTokens.level0,
    centerTitle: true,
    backgroundColor: DSColors.lightSurface,
    foregroundColor: DSColors.lightTextPrimary,
  );

  // Divider Theme
  static const _dividerTheme = DividerThemeData(
    color: DSColors.lightBorder,
    space: 1,
    thickness: 1,
  );

  // Dialog Theme
  static final _dialogTheme = DialogTheme(
    backgroundColor: DSColors.lightSurface,
    elevation: ElevationTokens.level1,
    shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.radiusLG16)),
  );

  // Tooltip Theme
  static final _tooltipTheme = TooltipThemeData(
    textStyle: AppFonts.bodyMedium.copyWith(color: DSColors.lightTextInverse),
    decoration: BoxDecoration(
      color: DSColors.lightOverlay,
      borderRadius: BorderRadius.circular(AppSize.radiusMD8),
    ),
  );
}
