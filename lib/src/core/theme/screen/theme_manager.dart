
import 'package:flutter/material.dart';
import 'package:framework/src/core/theme/provider/theme_provider.dart';
import 'package:framework/src/core/theme/theme_type/dark_theme.dart';
import 'package:framework/src/core/theme/theme_type/light_theme.dart';
import 'package:framework/src/core/theme/theme_type/seed_theme.dart';
import 'package:framework/src/core/theme/widgets/theme_switcher.dart';
import 'package:provider/provider.dart';

class ThemeManager extends StatelessWidget {
  const ThemeManager({
    required this.child,
    this.animationDuration = const Duration(milliseconds: 300),
    super.key,
  });

  final Widget child;
  final Duration animationDuration;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: _ThemedApp(
        animationDuration: animationDuration,
        child: child,
      ),
    );
  }
}

class _ThemedApp extends StatelessWidget {
  const _ThemedApp({
    required this.child,
    required this.animationDuration,
  });

  final Widget child;
  final Duration animationDuration;

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    final theme = themeProvider.useSeedColors
        ? themeProvider.isDarkMode
            ? SeedTheme.darkTheme
            : SeedTheme.lightTheme
        : themeProvider.isDarkMode
            ? DarkTheme.theme
            : LightTheme.theme;

    return AnimatedThemeSwitcher(
      duration: animationDuration,
      child: Theme(
        data: theme,
        child: child,
      ),
    );
  }
}
