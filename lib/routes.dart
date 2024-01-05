
import 'package:go_router/go_router.dart';
import 'package:runtickets/pages/autenticacao/cadastro/page_cadastro_base.dart';
import 'package:runtickets/pages/autenticacao/login/page_login_base.dart';
import 'package:runtickets/pages/dashboard/page_dashboard_base.dart';
import 'package:runtickets/pages/home/page_home_base.dart';
import 'package:runtickets/pages/loading/page_loading.dart';

class AppRoutes {
  static const PAGE_HOME = "/home";
  static const PAGE_DASHBOARD = "/";
  static const PAGE_SPLASH = "/";
  static const PAGE_LOGIN = "/login";
  static const PAGE_LOADING = "/loading";
  static const PAGE_CADASTRO = "/cadastro";

  // GoRouter configuration
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: PAGE_DASHBOARD,
        builder: (context, state) => const PageDashboardBase(),
      ),
      GoRoute(
        path: PAGE_LOGIN,
        builder: (context, state) => const PageLoginBase(),
      ),
      GoRoute(
        path: PAGE_CADASTRO,
        builder: (context, state) => const PageCadastroBase(),
      ),
      GoRoute(
        path: PAGE_HOME,
        builder: (context, state) => const PageHome(),
      ),
      GoRoute(
        path: PAGE_LOADING,
        builder: (context, state) => const PageLoading(),
      ),

    ],
  );
}