
import 'package:flutter/cupertino.dart';
import 'package:runtickets/models/api_response.dart';
import 'package:runtickets/pages/autenticacao/bloc/login_bloc.dart';

class LoginProvider extends ChangeNotifier{

  bool modeTest = false;
  ApiResponse? testLogin;
  LoginProvider(this.modeTest, {ApiResponse? testLogin});

  loginMode(){
     modeTest = true;
  }
}