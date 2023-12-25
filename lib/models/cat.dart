
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:runtickets/models/api_response.dart';

// Real class
class Cat {
  String sound() => "Meow";
  bool eatFood(String food, {bool? hungry}) => true;
  Future<void> chew() async => print("Chewing...");
  int walk(List<String> places) => 7;
  void sleep() {}
  void hunt(String place, String prey) {}
  int lives = 9;

  Future<ApiResponse<bool>> getResult() async {
    await Future.delayed(const Duration(seconds: 4));
    return ApiResponse.ok(true);
  }
}
