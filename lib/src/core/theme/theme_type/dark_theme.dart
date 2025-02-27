import 'package:baby_package/baby_package.dart';
import 'package:flutter/material.dart';
import 'package:framework/src/core/design_system/colors.dart';

class DarkTheme {
  static ThemeData get theme => ThemeData(
        scaffoldBackgroundColor: DSColors.darkBackgroundPrimary,
        brightness: Brightness.dark,
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
        colorScheme: const ColorScheme.dark(
          primary: DSColors.primaryLight,
          primaryContainer: DSColors.primaryDark,
          secondary: DSColors.secondary,
          secondaryContainer: DSColors.secondaryLight,
          error: DSColors.error,
          onSecondary: DSColors.darkTextInverse,
          onSurface: DSColors.darkTextPrimary,
        ),
        textTheme: TextTheme(
          displayLarge: AppFonts.displayLarge.copyWith(color: DSColors.darkTextPrimary),
          displayMedium: AppFonts.displayMedium.copyWith(color: DSColors.darkTextPrimary),
          displaySmall: AppFonts.displaySmall.copyWith(color: DSColors.darkTextPrimary),
          headlineLarge: AppFonts.headlineLarge.copyWith(color: DSColors.darkTextPrimary),
          headlineMedium:
              AppFonts.headlineMedium.copyWith(color: DSColors.darkTextPrimary),
          headlineSmall: AppFonts.headlineSmall.copyWith(color: DSColors.darkTextPrimary),
          titleLarge: AppFonts.titleLarge.copyWith(color: DSColors.darkTextPrimary),
          titleMedium: AppFonts.titleMedium.copyWith(color: DSColors.darkTextPrimary),
          titleSmall: AppFonts.titleSmall.copyWith(color: DSColors.darkTextPrimary),
          labelLarge: AppFonts.labelLarge.copyWith(color: DSColors.darkTextPrimary),
          labelMedium: AppFonts.labelMedium.copyWith(color: DSColors.darkTextPrimary),
          labelSmall: AppFonts.labelSmall.copyWith(color: DSColors.darkTextPrimary),
          bodyLarge: AppFonts.bodyLarge.copyWith(color: DSColors.darkTextPrimary),
          bodyMedium: AppFonts.bodyMedium.copyWith(color: DSColors.darkTextPrimary),
          bodySmall: AppFonts.bodySmall.copyWith(color: DSColors.darkTextPrimary),
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
      backgroundColor: DSColors.primaryLight,
      foregroundColor: DSColors.darkTextInverse,
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
      side: const BorderSide(color: DSColors.darkBorder),
      foregroundColor: DSColors.darkTextPrimary,
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
      foregroundColor: DSColors.darkTextPrimary,
    ),
  );

  // Input Decoration Theme
  static final _inputDecorationTheme = InputDecorationTheme(
    contentPadding:
        const EdgeInsets.symmetric(horizontal: Spacing.md16, vertical: Spacing.sm12),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.radiusMD8),
      borderSide: const BorderSide(color: DSColors.darkBorder),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.radiusMD8),
      borderSide: const BorderSide(color: DSColors.darkBorder),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.radiusMD8),
      borderSide: const BorderSide(color: DSColors.darkBorderFocus, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.radiusMD8),
      borderSide: const BorderSide(color: DSColors.darkBorderError),
    ),
    filled: true,
    fillColor: DSColors.darkBackgroundSecondary,
  );

  // Card Theme
  static final _cardTheme = CardTheme(
    elevation: ElevationTokens.level1,
    shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.radiusLG16)),
    margin: const EdgeInsets.all(Spacing.sm12),
    color: DSColors.darkSurface,
  );

  // AppBar Theme
  static const _appBarTheme = AppBarTheme(
    elevation: ElevationTokens.level0,
    centerTitle: true,
    backgroundColor: DSColors.darkSurface,
    foregroundColor: DSColors.darkTextPrimary,
  );

  // Divider Theme
  static const _dividerTheme = DividerThemeData(
    color: DSColors.darkBorder,
    space: 1,
    thickness: 1,
  );

  // Dialog Theme
  static final _dialogTheme = DialogTheme(
    backgroundColor: DSColors.darkSurface,
    elevation: ElevationTokens.level1,
    shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.radiusLG16)),
  );

  // Tooltip Theme
  static final _tooltipTheme = TooltipThemeData(
    textStyle: AppFonts.bodyMedium.copyWith(color: DSColors.darkTextInverse),
    decoration: BoxDecoration(
      color: DSColors.darkOverlay,
      borderRadius: BorderRadius.circular(AppSize.radiusMD8),
    ),
  );
}
