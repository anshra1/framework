// Package imports:
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:framework/src/core/routes/names.dart';
import 'package:framework/src/features/bottom_navigation_bar/provider/bottom_bar_visibilty_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AppBottomNavigation extends HookWidget {
  const AppBottomNavigation(this.child, {super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final visibilityProvider = Provider.of<BottomBarVisibilityProvider>(context);
    // final width = BabyResponsiveToken.mobileL > ScreenUtil().screenWidth.toInt()
    //     ? double.infinity
    //     : 600;

    // Remove the outer Scaffold and just return a Stack
    return Stack(
      children: [
        // Child (your Dashboard) takes full space
        child,

        // Bottom Navigation positioned at bottom
        Visibility(
          visible: visibilityProvider.isBottomBarVisible,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavigationBar(
              items: _navigationItem,
              currentIndex: _calculateSelectedIndex(context),
              onTap: (index) => _onTap(context, index),
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
  const BottomNavigationBarItem(
    icon: Icon(Icons.home, color: Colors.black),
    label: 'Dashboard',
    // selectedColor: Colors.purple,
  ),

  /// Likes
  const BottomNavigationBarItem(
    // ignore: deprecated_member_use
    icon: Icon(
      FontAwesomeIcons.tasks,
      //  color: Colors.white,
      //  color: Colors.black,
    ),
    label: 'Framework', backgroundColor: Colors.blue,
    // selectedColor: Colors.purple,
  ),

  const BottomNavigationBarItem(
    icon: Icon(Icons.book), label: 'Workspace',
    //  selectedColor: Colors.purple,
  ),

  const BottomNavigationBarItem(
    icon: Icon(FontAwesomeIcons.user),
    label: 'Notes',
    backgroundColor: Colors.blue,
    //   selectedColor: Colors.pink,
  ),

  const BottomNavigationBarItem(
    icon: Icon(FontAwesomeIcons.user),
    label: 'Setting',
    // selectedColor: Colors.pink,
  ),
];
