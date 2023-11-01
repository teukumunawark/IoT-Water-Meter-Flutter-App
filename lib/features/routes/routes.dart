import 'package:go_router/go_router.dart';

import '../presentation/pages/input_id_page.dart';
import '../presentation/pages/home_page.dart';
import '../presentation/pages/login_page.dart';
import '../presentation/pages/register_page.dart';
import '../presentation/pages/splash_page.dart';
import 'goroute_widget.dart';

final router = GoRouter(
  routes: [
    goRoute(
      name: 'register',
      path: '/register',
      child: const RegisterPage(),
    ),
    goRoute(
      name: 'login',
      path: '/login',
      child: const LoginPage(),
    ),
    goRoute(
      name: 'splash',
      path: '/',
      child: const SplashPage(),
    ),
    goRoute(
      name: 'inputId',
      path: '/inputId',
      child: const InputIDPage(),
    ),
    goRoute(
      name: 'home',
      path: '/home',
      child: const HomePage(),
    ),
  ],
  initialLocation: '/',
  debugLogDiagnostics: true,
  routerNeglect: true,
);
