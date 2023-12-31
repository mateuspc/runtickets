import 'package:flutter/material.dart';
import 'package:runtickets/styles/app_colors.dart';

class ElevatedButtonCustom extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;

  const ElevatedButtonCustom({
    super.key,
    required this.text,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: 45,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<
              RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  10.0), // Ajuste o raio conforme necessário
            ),
          ),
          overlayColor:
          MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.grey.withOpacity(
                    0.5); // Sua cor de sobreposição ao clicar
              }
              return null; // Nenhuma sobreposição quando não estiver pressionado
            },
          ),
          backgroundColor: MaterialStateProperty.all(
              AppColors.colorPrimary),
          foregroundColor:
          MaterialStateProperty.all(AppColors.colorWhite),
        ),
        child: Text("Entrar"),
      ),
    );
  }
}
