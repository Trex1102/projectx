import 'package:flutter/material.dart';
import 'package:projectx/src/features/add_expense/presentation/pages/add_expense_screen.dart';
import 'package:projectx/src/features/auth/presentation/pages/forgot_password_screen.dart';
import 'package:projectx/src/features/auth/presentation/pages/login_screen.dart';
import 'package:projectx/src/features/auth/presentation/pages/signup_screen.dart';
import 'package:projectx/src/features/comparison/presentation/pages/comparison_view.dart';
import 'package:projectx/src/features/edit_profile/presentation/pages/edit_profile_view.dart';
import 'package:projectx/src/features/home/presentation/pages/home_view.dart';
import 'package:projectx/src/features/settings/presentation/pages/settings_view.dart';
import 'package:projectx/src/features/splash_screen/presentation/pages/splash_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:projectx/src/features/statistics/presentation/pages/statistics_view.dart';
import 'package:projectx/src/features/wrapper/main_wrapper.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHome = GlobalKey<NavigatorState>(debugLabel: 'shellHome');
final _shellNavigatorSettings =
    GlobalKey<NavigatorState>(debugLabel: 'shellSettings');
final _shellNavigatorStatistics =
    GlobalKey<NavigatorState>(debugLabel: 'shellStatistics');

final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    routerNeglect: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainWrapper(
            navigationShell: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[
          /// Brach Home
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHome,
            routes: <RouteBase>[
              GoRoute(
                  path: "/home",
                  name: "Home",
                  builder: (BuildContext context, GoRouterState state) =>
                      const HomeView()),
            ],
          ),

          /// Brach Setting
          StatefulShellBranch(
            navigatorKey: _shellNavigatorStatistics,
            routes: <RouteBase>[
              GoRoute(
                path: "/statistics",
                name: "statistics",
                builder: (BuildContext context, GoRouterState state) =>
                    const StatisticsView(),
                routes: [
                  GoRoute(
                    path: "comparison",
                    name: "comparison",
                    pageBuilder: (context, state) {
                      return CustomTransitionPage<void>(
                        key: state.pageKey,
                        child: const ComparisonView(),
                        transitionsBuilder: (
                          context,
                          animation,
                          secondaryAnimation,
                          child,
                        ) =>
                            FadeTransition(opacity: animation, child: child),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),

          StatefulShellBranch(
            navigatorKey: _shellNavigatorSettings,
            routes: <RouteBase>[
              GoRoute(
                path: "/settings",
                name: "Settings",
                builder: (BuildContext context, GoRouterState state) =>
                    const SettingsView(),
                routes: [
                  GoRoute(
                    path: "editProfile",
                    name: "editProfile",
                    pageBuilder: (context, state) {
                      return CustomTransitionPage<void>(
                        key: state.pageKey,
                        child: const EditProfileView(),
                        transitionsBuilder: (
                          context,
                          animation,
                          secondaryAnimation,
                          child,
                        ) =>
                            FadeTransition(opacity: animation, child: child),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      GoRoute(
          // this is the initial page
          name: 'splash screen',
          path: '/',
          builder: (context, state) => SplashScreen()),
      GoRoute(
          name: 'login screen',
          path: '/login_screen',
          builder: (context, state) => const LoginScreen()),
      GoRoute(
          name: 'signup screen',
          path: '/signup_screen',
          builder: (context, state) => const SignUpScreen()),
      GoRoute(
          name: 'forgot password screen',
          path: '/forgot_password_screen',
          builder: (context, state) => const ForgotPasswordScreen()),
      GoRoute(
          // this is the initial page
          name: 'add expense screen',
          path: '/add_expense_screen',
          builder: (context, state) => AddExpenseScreen()),
    ]);
