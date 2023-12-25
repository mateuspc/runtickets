import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:runtickets/models/api_response.dart';
import 'package:runtickets/pages/autenticacao/bloc/login_bloc.dart';
import 'package:runtickets/pages/autenticacao/login/models/login_request_model.dart';
import 'package:runtickets/pages/autenticacao/provider/login_provider.dart';
import 'package:runtickets/routes.dart';

class PageLogin extends StatefulWidget {
  const PageLogin({super.key});

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {

  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final LoginBloc _loginBloc = LoginBloc();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      key: const Key("chave_widget_login"),
      body:  Center(
        child: Container(
          width: 400,
          child: Column(
            children: [
              SizedBox(
                child: TextField(
                  key: const Key('textFieldLogin'),
                  controller: _loginController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text("Login")
                  ),
                ),
              ),
              TextField(
                key: const Key('textFieldSenha'),
                controller: _senhaController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    label: Text("Senha")
                ),
              ),
              SizedBox(height: 40,),
              ElevatedButton(onPressed: () async {

                Future.delayed(const Duration(seconds: 0), (){
                  context.go(AppRoutes.PAGE_HOME);
                });
                  LoginRequest loginRequest = LoginRequest(
                    "Mateus",
                    "1234"
                  );
                  var loginProvider = Provider.of<LoginProvider>(context, listen: false);

                  ApiResponse result =  loginProvider.modeTest ? loginProvider.testLogin! : await
                  _loginBloc.login(Client(), loginRequest);

                  print(result.ok);
                   if(result.ok){

                     // showDialog(context: context,
                     //     builder: (context){
                     //       return AlertDialog(
                     //         key: const Key('dialog_sucesso_key'),
                     //         title: Text('Sucesso login!'),
                     //       );
                     //     });
                   }


                  // loginProvider.modeTest
              },
                child: Text('Entrar'),

              )
            ],
          ),
        ),
      ),
    );
  }
}
