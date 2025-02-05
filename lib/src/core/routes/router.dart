part of 'import.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  static final GlobalKey<NavigatorState> mainMenuNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'main_menu');

  static final GoRouter router = GoRouter(
    errorPageBuilder: (context, state) =>
        MaterialPage(key: state.pageKey, child: const PageNotFoundScreen()),
    navigatorKey: _rootNavigatorKey,
    initialLocation: RoutesName.initial,
    routes: [
      // GoRoute(
      //   path: ErrorBoundaryTestPage.routeName,
      //   name: ErrorBoundaryTestPage.routeName,
      //   pageBuilder: (_, state) {
      //     return _buildTransition(
      //       child: const ErrorBoundaryTestPage(),
      //       state: state,
      //     );
      //   },
      // ),

      GoRoute(
        path: RoutesName.pageNotFound,
        name: RoutesName.pageNotFound,
        pageBuilder: (_, state) {
          return _buildTransition(
            child: const PageNotFoundScreen(),
            state: state,
          );
        },
      ),

      ShellRoute(
        navigatorKey: mainMenuNavigatorKey,
        builder: (context, state, child) {
          return AppBottomNavigation(child);
        },
        routes: AppRoutes.mainMenuRoutes,
      ),
    ],
  );

  static Page<void> _buildTransition({
    required Widget child,
    required GoRouterState state,
  }) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
      transitionDuration: kThemeAnimationDuration,
      reverseTransitionDuration: kThemeAnimationDuration,
    );
  }
}
