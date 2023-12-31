import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:runtickets/routes.dart';
import 'package:runtickets/styles/app_colors.dart';
import 'package:runtickets/widgets_input/button/elevated_button_custom.dart';
import 'package:runtickets/widgets_input/text_input_email.dart';
import 'package:runtickets/widgets_input/text_input_password.dart';
import 'package:uicons/uicons.dart';
import '../bloc/login_bloc.dart';

class PageLoginDesktop extends StatefulWidget {
  const PageLoginDesktop({super.key});

  @override
  State<PageLoginDesktop> createState() => _PageLoginDesktopState();
}

class _PageLoginDesktopState extends State<PageLoginDesktop> with SingleTickerProviderStateMixin{
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final LoginBloc _loginBloc = LoginBloc();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _slideAnimation = Tween<Offset>(
      begin: const Offset(1.0, -1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        key: const Key("chave_widget_login"),
        appBar: AppBar(
          leading: Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: (){
                context.go(AppRoutes.PAGE_DASHBOARD);
              },
              icon: Icon(UIcons.regularRounded.angle_left),
            ),
          ),
        ),
        body: Center(
          child: Container(
            width: 400,
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Card(
                        color: Colors.white,
                        elevation: 0,
                        child: SingleChildScrollView(
                          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Login desk",
                                  style: TextStyle(
                                      color: AppColors.colorBlack,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextInputEmail(
                                key: const Key('textFieldLogin'),
                                label: "E-mail",
                                emailController: _emailController,
                                hint: 'exemplo@gmail.com',
                                formKey: _formKey,
                              ),
                              TextInputPassword(
                                key: const Key('textFieldSenha'),
                                label: "Senha",
                                passwordController: _senhaController,
                                formKey: _formKey, obscureText: true,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              ElevatedButtonCustom(
                                text: 'Entrar',
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                  _formKey.currentState!.validate();
                                  // context.go(AppRoutes.PAGE_LOADING);
                                },),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                height: 1,
                                color: Colors.grey[200],
                                width: size.width,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Text("Não possui um conta?"),
                                  Spacer(),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.resolveWith<Color?>(
                                            (Set<MaterialState> states) {
                                          return Colors.white; // Cor de fundo padrão
                                        },
                                      ),
                                      elevation: MaterialStateProperty.all(0),
                                      overlayColor:
                                      MaterialStateProperty.resolveWith<Color?>(
                                            (Set<MaterialState> states) {
                                          if (states.contains(MaterialState.pressed)) {
                                            return Colors.grey.withOpacity(
                                                0.5); // Sua cor de sobreposição ao clicar
                                          }
                                          return null; // Nenhuma sobreposição quando não estiver pressionado
                                        },
                                      ),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          side: BorderSide(
                                              color: Colors.black), // Cor da borda
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      // Adicione a lógica de pressionar o botão aqui
                                      // Navigator.pushNamed(context, AppRoutes.PAGE_CADASTRO);
                                      context.push(AppRoutes.PAGE_CADASTRO);
                                    },
                                    child: Text('Cadastre-se', style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.colorPrimary
                                    ),),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      // ElevatedButton(onPressed: () async {
                      //
                      //   Future.delayed(const Duration(seconds: 0), (){
                      //     context.go(AppRoutes.PAGE_HOME);
                      //   });
                      //     LoginRequest loginRequest = LoginRequest(
                      //       "Mateus",
                      //       "1234"
                      //     );
                      //     var loginProvider = Provider.of<LoginProvider>(context, listen: false);
                      //
                      //     ApiResponse result =  loginProvider.modeTest ? loginProvider.testLogin! : await
                      //     _loginBloc.login(Client(), loginRequest);
                      //
                      //     print(result.ok);
                      //      if(result.ok){
                      //
                      //        // showDialog(context: context,
                      //        //     builder: (context){
                      //        //       return AlertDialog(
                      //        //         key: const Key('dialog_sucesso_key'),
                      //        //         title: Text('Sucesso login!'),
                      //        //       );
                      //        //     });
                      //      }
                      //
                      //
                      //     // loginProvider.modeTest
                      // },
                      //   child: Text('Entrar'),
                      //
                      // )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

