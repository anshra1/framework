import 'package:flutter/material.dart';
import 'package:framework/src/features/bottom_navigation_bar/provider/bottom_bar_visibilty_provider.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  const CustomAppBar({
    required this.title, super.key,
    this.showToggleBottomBarButton = true,
  });
  final String title; // Locally passed title
  final bool showToggleBottomBarButton;

  @override
  Widget build(BuildContext context) {
    final visibilityProvider = Provider.of<BottomBarVisibilityProvider>(context);

    return AppBar(
      title: Align(
        alignment: Alignment.centerLeft,
        child: Text(title),
      ), // Use the locally passed title
      actions: showToggleBottomBarButton
          ? [
              IconButton(
                icon: Icon(visibilityProvider.isBottomBarVisible
                    ? Icons.visibility_off
                    : Icons.visibility,),
                onPressed: visibilityProvider.toggleVisibility,
              ),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
