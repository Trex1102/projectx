import 'package:projectx/src/features/auth/presentation/pages/login_screen.dart';
import 'package:projectx/src/features/splash_screen/presentation/pages/splash_screen.dart';

import '/src/router/route_names.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/splash_screen',
    routerNeglect: true,
    routes: [
      GoRoute(
          // this is the initial page
          name: 'splash screen',
          path: '/splash_screen',
          builder: (context, state) => const SplashScreen()),
      GoRoute(
          // this is the initial page
          name: 'login screen',
          path: '/login_screen',
          builder: (context, state) => const LoginScreen()),
    ]);
