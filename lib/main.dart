import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:runtickets/pages/autenticacao/provider/login_provider.dart';
import 'package:runtickets/pages/splash/page_splash.dart';
import 'package:runtickets/routes.dart';
import 'package:runtickets/styles/app_colors.dart';
import 'package:runtickets/styles/app_fonts.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((value) {
    runApp(const RunTickets());
  });
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
          scaffoldBackgroundColor: AppColors.scaffoldBackground,
          fontFamily: FontsApp.montserratBold,
          navigationBarTheme: NavigationBarThemeData(
            labelTextStyle: MaterialStateProperty.resolveWith((state) {
              if (state.contains(MaterialState.selected)) {
                return const TextStyle(color: Colors.white);
              }
              return const TextStyle(color: Colors.grey);
            }),
            iconTheme: MaterialStateProperty.resolveWith((state){
              if(state.contains(MaterialState.pressed)){
                return const IconThemeData(
                  color: Colors.white
                );
              }
              return const IconThemeData(
                  color: Colors.grey
              );
            })
          ),

        ),
        routerConfig: AppRoutes.router,
      ),
    );
  }
}



