import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:runtickets/models/api_response.dart';
import 'package:runtickets/pages/autenticacao/login/bloc/login_bloc.dart';
import 'package:runtickets/pages/autenticacao/login/models/login_request_model.dart';
import 'package:runtickets/pages/autenticacao/login/page_login.dart';
import 'package:http/http.dart' as http;
import 'package:runtickets/pages/autenticacao/provider/login_provider.dart';

import 'data/login_request_fake.dart';
import 'login_widgets_test.mocks.dart';

@GenerateMocks([http.Client, LoginBloc])
void main(){
  group("Page login tests widget", (){
    testWidgets("Teste na chamada a API de login, e o retorna sucesso no login", (tester) async {
      MockLoginBloc mockLoginBloc = MockLoginBloc();
      MockClient mockClient = MockClient();

      when(mockLoginBloc.login(mockClient, loginRequestFake)).thenAnswer((_) async => ApiResponse.ok(true));
      ApiResponse apiResponse = await mockLoginBloc.login(mockClient, loginRequestFake);
      await tester.pumpWidget(MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LoginProvider(true, testLogin: apiResponse),)
        ],
        child: const MaterialApp(
          home: PageLogin(),
        ),
      ));

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      verify(mockLoginBloc.login(mockClient, loginRequestFake)).called(1);
      expect(apiResponse.ok, true);
      expect(find.byType(AlertDialog), findsOneWidget);
      // expect(find.text('Atenção'), findsOneWidget);
    });

    testWidgets("Se o campo login e senha forem vazios retorne um AlerDialog com a mensagem O campo senha e email são obrigatórios", (tester) async {

      await tester.pumpWidget(const MaterialApp(
        home: PageLogin(),
      ));

      Finder textFieldLogin = find.byKey(const Key('textFieldLogin'));
      Finder textFieldSenha = find.byKey(const Key('textFieldSenha'));

      await tester.enterText(textFieldLogin, "");
      await tester.enterText(textFieldSenha, "");

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOneWidget);
      expect(find.text("O campo senha e email são obrigatórios"), findsOneWidget);
    });

  });


}