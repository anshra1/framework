// Package imports:
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:framework/src/core/extension/responsive_context.dart';
import 'package:framework/src/core/routes/names.dart';
import 'package:framework/src/core/widgets/bottom_navigation_bar.dart';
import 'package:framework/src/features/bottom_navigation_bar/provider/bottom_bar_visibilty_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AppBottomNavigation extends HookWidget {
  const AppBottomNavigation(this.child, {super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final visibilityProvider = Provider.of<BottomBarVisibilityProvider>(context);
    final width = BabyResponsiveToken.mobileL > ScreenUtil().screenWidth.toInt()
        ? double.infinity
        : 600;

    // Remove the outer Scaffold and just return a Stack
    return Stack(
      children: [
        // Child (your Dashboard) takes full space
        child,

        // Bottom Navigation positioned at bottom
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: AnimatedOpacity(
            opacity: visibilityProvider.isBottomBarVisible ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 16,
                left: 8,
                right: 8,
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: Container(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    constraints: BoxConstraints(
                      maxWidth: width.toDouble(),
                      minHeight: 60.h,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 181, 217, 247),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          // ignore: deprecated_member_use
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, -5),
                        ),
                      ],
                    ),
                    child: AdvancedSalomonBottomBar(
                      margin: EdgeInsets.zero,
                      items: _navigationItem,
                      currentIndex: _calculateSelectedIndex(context),
                      onTap: (index) => _onTap(context, index),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

int _calculateSelectedIndex(BuildContext context) {
  final location = GoRouterState.of(context).uri.toString();

  if (location.startsWith(RoutesName.dashboard)) {
    return 0;
  }

  if (location.startsWith(RoutesName.framework)) {
    return 1;
  }
  if (location.startsWith(RoutesName.workspace)) {
    return 2;
  }
  if (location.startsWith(RoutesName.notes)) {
    return 3;
  }
  if (location.startsWith(RoutesName.pageNotFound)) {
    return 4;
  }
  return 0;
}

void _onTap(
  BuildContext context,
  int index,
) {
  switch (index) {
    case 0:
      context.go(RoutesName.dashboard);
    case 1:
      context.go(RoutesName.framework);
    case 2:
      context.go(RoutesName.workspace);
    case 3:
      context.go(RoutesName.notes);
    case 4:
      context.go(RoutesName.settings);
    default:
      break;
  }
}

var _navigationItem = [
  AdvancedSalomonBottomBarItem(
    icon: const Icon(Icons.home),
    title: const Text('Dashboard'),
    selectedColor: Colors.purple,
  ),

  /// Likes
  AdvancedSalomonBottomBarItem(
    // ignore: deprecated_member_use
    icon: const Icon(FontAwesomeIcons.tasks),
    title: const Text('Framework'),
    selectedColor: Colors.purple,
  ),

  AdvancedSalomonBottomBarItem(
    icon: const Icon(Icons.book),
    title: const Text('Workspace'),
    selectedColor: Colors.purple,
  ),

  AdvancedSalomonBottomBarItem(
    icon: const Icon(FontAwesomeIcons.user),
    title: const Text('Notes'),
    selectedColor: Colors.pink,
  ),

  AdvancedSalomonBottomBarItem(
    icon: const Icon(FontAwesomeIcons.user),
    title: const Text('Setting'),
    selectedColor: Colors.pink,
  ),
];
