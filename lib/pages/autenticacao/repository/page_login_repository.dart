

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:runtickets/models/api_response.dart';
import 'package:runtickets/pages/autenticacao/login/models/login_request_model.dart';

class LoginRepository {

  Future<ApiResponse> login(http.Client client, LoginRequest loginRequest) async {

     try{
       Response response = await client.get(Uri.parse("https://jsonplaceholder.typicode.com/albums/1"),
           headers: {
             "Content-Type": "application/json"
           });

       if(response.statusCode == 200){
         var res = json.decode(utf8.decode(response.bodyBytes));
         return ApiResponse.ok(true, codeEnum: TypeResponseLogin.SUCCESS);
       }
       return ApiResponse.error(false, codeEnum: TypeResponseLogin.FAIL);
     }
     on SocketException catch(e){
       return ApiResponse.error(false, codeEnum: TypeResponseLogin.SOCKET_EXCEPTION);

     } on TimeoutException catch(e){
       return ApiResponse.error(false, codeEnum: TypeResponseLogin.TIMEOUT_EXCEPTION);
     }
     catch(e){
       return ApiResponse.error(false, codeEnum: TypeResponseLogin.FAIL);
     }
  }
}

enum TypeResponseLogin {
  SUCCESS,
  FAIL,
  SOCKET_EXCEPTION,
  TIMEOUT_EXCEPTION
}

