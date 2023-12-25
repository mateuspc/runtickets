
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:runtickets/models/api_response.dart';
import 'package:runtickets/models/cat.dart';

import 'cat_test.mocks.dart';

@GenerateMocks([Cat])
void main(){

  test("Testando a classe Cat", () async {
    var cat = MockCat();

    when(cat.getResult()).thenAnswer((value) async {
      return ApiResponse.ok(true, codeEnum: false);
    });

    var res = await cat.getResult();
    expect(res, ApiResponse.ok(true, codeEnum: false));
  });
}