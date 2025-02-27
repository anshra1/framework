part of 'import.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  static final GlobalKey<NavigatorState> mainMenuNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'main_menu');

  static final GoRouter router = GoRouter(
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: const PageNotFoundScreen(),
    ),
    navigatorKey: _rootNavigatorKey,
    initialLocation: RoutesName.initial,
    routes: [
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
      GoRoute(
        path: RoutesName.initial,
        name: RoutesName.initial,
        pageBuilder: (_, state) {
          return _buildTransition(
            child: const InitialPage(),
            state: state,
          );
        },
      ),
      GoRoute(
        path: RoutesName.login,
        name: RoutesName.login,
        pageBuilder: (_, state) {
          return _buildTransition(
            child: BlocProvider<AuthCubit>(
              create: (_) => sl<AuthCubit>(),
              child: const LoginPage(),
            ),
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

Future<String> intialRoute() async {
  final value =
      await const FlutterSecureStorage().read(key: AppConstants.secureStorageKey);
  if (value == null) {
    return RoutesName.login;
  }
  return RoutesName.dashboard;
}
