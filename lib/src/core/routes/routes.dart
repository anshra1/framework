part of 'import.dart';

class AppRoutes {
  static final mainMenuRoutes = <RouteBase>[
    GoRoute(
      path: RoutesName.dashboard,
      name: RoutesName.dashboard,
      pageBuilder: (_, state) {
        return _buildTransition(
          child: const DashboardPage(),
          state: state,
        );
      },
    ),
    GoRoute(
      path: RoutesName.framework,
      name: RoutesName.framework,
      pageBuilder: (_, state) {
        return _buildTransition(
          child: const FrameWorkPage(),
          state: state,
        );
      },
    ),
    GoRoute(
      path: RoutesName.workspace,
      name: RoutesName.workspace,
      pageBuilder: (_, state) {
        return _buildTransition(
          child: const WorkspacePage(),
          state: state,
        );
      },
    ),
    GoRoute(
      path: RoutesName.notes,
      name: RoutesName.notes,
      pageBuilder: (_, state) {
        return _buildTransition(
          child: const NotesPage(),
          state: state,
        );
      },
    ),
    GoRoute(
      path: RoutesName.settings,
      name: RoutesName.settings,
      pageBuilder: (_, state) {
        return _buildTransition(
          child: const SettingPage(),
          state: state,
        );
      },
    ),
  ];
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
      transitionDuration: const Duration(milliseconds: 200),
      reverseTransitionDuration: kThemeAnimationDuration,
    );
  }
}
