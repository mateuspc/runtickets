import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:runtickets/pages/autenticacao/login/page_login.dart';
import 'package:runtickets/routes.dart';
import 'package:runtickets/styles/app_colors.dart';

class PageSplash extends StatefulWidget {
  const PageSplash({super.key});

  @override
  State<PageSplash> createState() => _PageSplashState();
}

class _PageSplashState extends State<PageSplash> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(const Duration(seconds: 5), (){
      context.go(AppRoutes.PAGE_LOGIN);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: AppColors.colorPrimary,
       body: Center(
         key: const Key("chave_widget_image"),
         child: SizedBox(
             width: 110,
             child: Image.asset("assets/loading/white_animation_splash.gif")
         ),
       ),
    );
  }
}
