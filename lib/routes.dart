
import 'package:go_router/go_router.dart';
import 'package:runtickets/pages/autenticacao/login/page_login.dart';
import 'package:runtickets/pages/home/page_home.dart';
import 'package:runtickets/pages/splash/page_splash.dart';

class AppRoutes {
  static const PAGE_HOME = "/home";
  static const PAGE_DASHBOARD = "/dashboard";
  static const PAGE_SPLASH = "/";
  static const PAGE_LOGIN = "/login";

  // GoRouter configuration
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const PageSplash(),
      ),
      GoRoute(
        path: PAGE_LOGIN,
        builder: (context, state) => const PageLogin(),
      ),
      GoRoute(
        path: PAGE_HOME,
        builder: (context, state) => const PageHome(),
      ),
    ],
  );
}