import 'package:projectx/src/features/auth/presentation/pages/forgot_password_screen.dart';
import 'package:projectx/src/features/auth/presentation/pages/login_screen.dart';
import 'package:projectx/src/features/auth/presentation/pages/signup_screen.dart';
import 'package:projectx/src/features/splash_screen/presentation/pages/splash_screen.dart';

import '/src/router/route_names.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    routerNeglect: true,
    routes: [
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
    ]);
