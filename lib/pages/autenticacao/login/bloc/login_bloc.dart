
import 'package:runtickets/models/api_response.dart';
import 'package:runtickets/pages/autenticacao/login/models/login_request_model.dart';
import 'package:runtickets/pages/autenticacao/repository/page_login_repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;

class LoginBloc {
  final _isLoading = BehaviorSubject<bool>.seeded(true);
  Stream<bool> get streamLoading => _isLoading.stream;
  Sink<bool> get sinkLoading => _isLoading.sink;

  final _response = BehaviorSubject<ApiResponse>();
  Stream<ApiResponse> get streamResponse => _response.stream;
  Sink<ApiResponse> get sinkResponse => _response.sink;

  bool get isClosed => _response.isClosed;

  Future<ApiResponse> login(http.Client client, LoginRequest loginRequest) async {
    ApiResponse res = await LoginRepository().login(client, loginRequest);
    _response.add(res);
    _isLoading.add(false);
    return res;
  }

  void dispose(){
    _response.close();
    _isLoading.close();
  }

}