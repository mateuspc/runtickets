
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:runtickets/pages/splash/page_splash.dart';

void main(){
  testWidgets('Quando o app iniciar deve abrir a Splash screen com um logo centralizado, aguardar 5 segundos e navegar para tela de login', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: PageSplash(),
    ));  // Substitua pelo nome da sua classe principal

    expect(find.byType(Image), findsOneWidget);
    expect(find.byKey(const Key('chave_widget_image')), findsOneWidget);  // Substitua pela chave do seu widget Image

    // Aguarde 5 segundos
    await tester.pump(const Duration(seconds: 5));
    await tester.pumpAndSettle();

    // Verifique se a tela de login foi aberta após 5 segundos
    expect(find.byType(Scaffold), findsOneWidget);  // Substitua pela chave do seu widget de login
    expect(find.text('Login'), findsOneWidget);
  });
}