
import 'package:flutter/cupertino.dart';
import 'package:runtickets/models/api_response.dart';

class LoginProvider extends ChangeNotifier{

  bool modeTest = false;
  ApiResponse? testLogin;
  LoginProvider(this.modeTest, {ApiResponse? testLogin});

  loginMode(){
     modeTest = true;
  }
}