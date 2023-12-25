import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:runtickets/pages/autenticacao/provider/login_provider.dart';
import 'package:runtickets/pages/splash/page_splash.dart';
import 'package:runtickets/routes.dart';
import 'package:runtickets/styles/app_colors.dart';

void main() {
  runApp(const RunTickets());
}

class RunTickets extends StatelessWidget {
  const RunTickets({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider(false),)
      ],
      child: MaterialApp.router(
        title: 'Run Tickets',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.colorPrimary),
          useMaterial3: true,
        ),
        routerConfig: AppRoutes.router,
      ),
    );
  }
}



