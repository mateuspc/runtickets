import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:runtickets/responsive/mixins.dart';
import 'package:runtickets/styles/app_colors.dart';
import 'package:runtickets/styles/app_fontSize.dart';
import 'package:uicons/uicons.dart';

class PageProfilePageOptions extends StatefulWidget {
  const PageProfilePageOptions({Key? key}) : super(key: key);

  @override
  State<PageProfilePageOptions> createState() => _PageProfilePageOptionsState();
}

class _PageProfilePageOptionsState extends State<PageProfilePageOptions>
    with Responsive, SingleTickerProviderStateMixin{

  late AnimationController _animationController;

  late Animation<double> _animationOpacidadeEditarPerfil;
  late Animation<double> _animationOpacidadeAreaAdm;
  late Animation<double> _animationOpacidadeSuporte;
  late Animation<double> _animationOpacidadePoliticaPrivacidade;
  late Animation<double> _animationOpacidadeSair;

  late Animation<double> _animationBotaoEditarPerfilSlide;
  late Animation<double> _animationBotaoAreaAdminSlide;
  late Animation<double> _animationBotaoSuporteSlide;
  late Animation<double> _animationBotaoPoliticaPrivacidadeSlide;
  late Animation<double> _animationBotaoSairSlide;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(
        milliseconds: 2000
    ));

    // Opacidade anim
    _animationOpacidadeEditarPerfil = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController, curve: const Interval(0, 0.3))
    );

    _animationOpacidadeAreaAdm = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController, curve: const Interval(0.1, 0.5))
    );

    _animationOpacidadeSuporte = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController, curve: const Interval(0.4, 0.8))
    );

    _animationOpacidadePoliticaPrivacidade = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController, curve: const Interval(0.5, 0.9))
    );

    _animationOpacidadeSair = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController, curve: const Interval(0.6, 1.0))
    );
    // Slide anim
    _animationBotaoEditarPerfilSlide =
        Tween(begin: 400.0, end: 0.0).animate(CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.0, 0.3, curve: Curves.elasticInOut))
        );

    _animationBotaoAreaAdminSlide =
        Tween(begin: 400.0, end: 0.0).animate(CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.1, 0.5, curve: Curves.elasticInOut))
        );

    _animationBotaoSuporteSlide =
        Tween(begin: 400.0, end: 0.0).animate(CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.2, 0.6, curve: Curves.elasticInOut))
        );

    _animationBotaoPoliticaPrivacidadeSlide =
        Tween(begin: 400.0, end: 0.0).animate(CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.3, 0.7, curve: Curves.elasticInOut))
        );

    _animationBotaoSairSlide =
        Tween(begin: 400.0, end: 0.0).animate(CurvedAnimation(
            parent: _animationController,
            curve: const Interval(0.4, 0.8, curve: Curves.elasticInOut))
        );

    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: widthScreen * 0.05),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Meu perfil",
                style: TextStyle(
                  fontSize: AppFontsSize.titleFontSize,
                  color: AppColors.colorPrimary
                ),
                key: Key("title_options"),),
            ),
            SizedBox(height: 20,),
            Builder(
                builder: (context) {
                  return AnimatedBuilder(
                    animation: _animationBotaoEditarPerfilSlide,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(
                            _animationBotaoEditarPerfilSlide.value,
                            0.0
                        ),
                        child: child,
                      );
                    },
                    child: AnimatedBuilder(
                      builder: (context, child) {
                        return Opacity(
                            opacity: _animationController.value,
                            child: child);
                      },
                      animation: _animationOpacidadeEditarPerfil,
                      child: ListTileMenuItem(pathIconLeading: "",
                        title: "Editar perfil",
                        iconData: UIcons.regularRounded.edit,
                        onClick: (){

                        }, keyWidgetText: 'item_menu_editar_perfil',),
                    ),
                  );
                }
            ),
            const SizedBox(height: 10,),
            AnimatedBuilder(
              animation: _animationBotaoSuporteSlide,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(
                      _animationBotaoSuporteSlide.value,
                      0.0
                  ),
                  child: child,
                );
              },
              child: AnimatedBuilder(
                animation: _animationOpacidadeSuporte,
                builder: (context, child) {
                  return Opacity(
                    opacity: _animationController.value,
                    child: child,
                  );
                },
                child: ListTileMenuItem(pathIconLeading: "",
                  title: "Suporte",
                  iconData: Icons.chat_bubble_outline,
                  onClick: (){

                  }, keyWidgetText: 'item_menu_suporte_whatsapp',),
              ),
            ),
            const SizedBox(height: 10,),
            AnimatedBuilder(
              animation: _animationBotaoPoliticaPrivacidadeSlide,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(
                      _animationBotaoPoliticaPrivacidadeSlide.value,
                      0.0
                  ),
                  child: child,
                );
              },
              child: AnimatedBuilder(
                animation: _animationBotaoPoliticaPrivacidadeSlide,
                builder: (context, child) {
                  return Opacity(
                    opacity: _animationController.value,
                    child: child,
                  );
                },
                child: ListTileMenuItem(pathIconLeading: "assets/icon/profile_icons/politica_de_privacidade.svg",
                  title: "Politicas de privacidade",
                  iconData: UIcons.regularRounded.shield_check,
                  onClick: (){

                  }, keyWidgetText: 'item_menu_politica_privacidade',),
              ),
            ),
            const SizedBox(height: 10,),
            AnimatedBuilder(
              animation: _animationBotaoSairSlide,
              builder: (context, child){
                return Transform.translate(
                  offset: Offset(
                      _animationBotaoSairSlide.value,
                      0.0
                  ),
                  child: child,
                );
              },
              child: AnimatedBuilder(
                animation: _animationOpacidadeSair,
                builder: (context, child) {
                  return Opacity(
                    opacity: _animationController.value,
                    child: child,
                  );
                },
                child: ListTileMenuItem(pathIconLeading: "assets/icon/profile_icons/exit.svg",
                  title: "Sair",
                  iconData: UIcons.regularRounded.exit,
                  onClick: (){

                  }, keyWidgetText: 'item_menu_exit',),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListTileMenuItem extends StatelessWidget {

  final String pathIconLeading;
  final String title;
  final Function onClick;
  final IconData? iconData;
  final String keyWidgetText;
  const ListTileMenuItem({
    super.key,
    required this.keyWidgetText,
    required this.pathIconLeading,
    required this.title,
    this.iconData,
    required this.onClick
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Material(
        color: AppColors.colorWhite,
        child: InkWell(
          splashColor: AppColors.colorPrimary.withOpacity(0.2),
          onTap: (){
            HapticFeedback.mediumImpact();
            onClick();
          },
          key: Key(keyWidgetText),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
            child: Row(
              children: [
                if(iconData != null)
                  Icon(iconData,
                    color: AppColors.colorPrimary,)
                else
                  SizedBox(
                    child: SvgPicture.asset(pathIconLeading),
                    width: 25,
                    height: 25,
                  ),
                const SizedBox(width: 10,),
                Expanded(
                  child: Text(title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: AppColors.colorPrimary
                    ),),
                ),
                Icon(UIcons.regularRounded.angle_small_right,
                  color: AppColors.colorPrimary,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
