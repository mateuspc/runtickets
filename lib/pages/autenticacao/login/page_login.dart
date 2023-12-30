import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:runtickets/routes.dart';
import 'package:runtickets/styles/app_colors.dart';
import 'package:runtickets/widgets/text_input_email.dart';
import 'package:runtickets/widgets/text_input_password.dart';

import 'bloc/login_bloc.dart';

class PageLogin extends StatefulWidget {
  const PageLogin({super.key});

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final LoginBloc _loginBloc = LoginBloc();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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
        body: Center(
          child: Container(
            width: 400,
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
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
                                "Login",
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
                            const SizedBox(
                              height: 15,
                            ),
                            TextInputPassword(
                              key: const Key('textFieldSenha'),
                              label: "Senha",
                              passwordController: _senhaController,
                              formKey: _formKey,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              width: size.width,
                              height: 45,
                              child: ElevatedButton(
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                  _formKey.currentState!.validate();
                                  // context.go(AppRoutes.PAGE_LOADING);
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          10.0), // Ajuste o raio conforme necessário
                                    ),
                                  ),
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
                                  backgroundColor: MaterialStateProperty.all(
                                      AppColors.colorPrimary),
                                  foregroundColor:
                                      MaterialStateProperty.all(AppColors.colorWhite),
                                ),
                                child: Text("Entrar"),
                              ),
                            ),
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
    );
  }
}
