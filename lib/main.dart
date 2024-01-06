import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:runtickets/pages/autenticacao/provider/login_provider.dart';
import 'package:runtickets/pages/splash/page_splash.dart';
import 'package:runtickets/routes.dart';
import 'package:runtickets/styles/app_colors.dart';
import 'package:runtickets/styles/app_fonts.dart';
import 'package:runtickets/widgets_input/providers/type_document_cadastro_provider.dart';

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
        ChangeNotifierProvider(create: (_) => LoginProvider(false),),
        ChangeNotifierProvider(create: (_) => TypeDocumentCadastroProvider(),)
      ],
      child: MaterialApp.router(
        title: 'Run Tickets',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.colorPrimary),
          useMaterial3: true,
          scaffoldBackgroundColor: AppColors.scaffoldBackground,
          fontFamily: FontsApp.montserratBold,
          visualDensity: VisualDensity.adaptivePlatformDensity,

          appBarTheme: const AppBarTheme( 
            backgroundColor: Colors.transparent,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white, // Defina a cor desejada da barra de status
              statusBarIconBrightness: Brightness.dark, // Defina a cor desejada dos ícones da barra de status
            ),
          ),
          navigationBarTheme: NavigationBarThemeData(
            labelTextStyle: MaterialStateProperty.resolveWith((state) {
              if (state.contains(MaterialState.selected)) {
                return const TextStyle(color: Colors.white);
              }
              return const TextStyle(color: Colors.white);
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



