
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:runtickets/styles/app_colors.dart';
import 'package:runtickets/widgets/button/elevated_button_custom.dart';

void main(){

  testWidgets('Verifica se o ElevatedButtonCustom exibe o texto fornecido', (tester) async {

    await tester.pumpWidget(
      MaterialApp(
        home: ElevatedButtonCustom(
          text: 'Entrar',
          onPressed: () {  },
        ),
      )
    );

    expect(find.text('Entrar'), findsOneWidget);
  });

  testWidgets('Verifica se o ElevatedButtonCustom chama o onPressed qunado pressionado', (tester) async {

    bool onPressedChamado = false;

    await tester.pumpWidget(
        MaterialApp(
          home: ElevatedButtonCustom(
            text: 'Entrar',
            onPressed: (){
              onPressedChamado = true;
            },
          ),
        )
    );

    await tester.tap(find.text('Entrar'));
    await tester.pump();
    expect(onPressedChamado, true);
  });

  testWidgets('ElevatedButtonCustom tem estilo de fundo correto', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ElevatedButtonCustom(
          text: 'Entrar',
          onPressed: () {},
        ),
      ),
    );

    final backgroundColor = tester.widget<ElevatedButton>(find.byType(ElevatedButton))
        .style!.backgroundColor!.resolve({});

    expect(backgroundColor, AppColors.colorPrimary);
  });

  testWidgets('ElevatedButtonCustom tem overlayColor correto ao ser pressionado', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ElevatedButtonCustom(
          text: 'Entrar',
          onPressed: () {},
        ),
      ),
    );

    final overlayColor = tester.widget<ElevatedButton>(find.byType(ElevatedButton)).style!.overlayColor!.resolve({MaterialState.pressed});

    expect(overlayColor, Colors.grey.withOpacity(0.5));
  });



}