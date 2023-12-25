
import 'package:flutter/material.dart';
import 'package:runtickets/responsive/app_dimens.dart';

class ResponsiveContainer extends StatelessWidget {

  final Widget mobile;
  final Widget desktop;

  const ResponsiveContainer({required this.mobile,required  this.desktop});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (AppDimens.isPhone(context)) {
          // Código para dispositivos móveis
          return mobile;
        } else if (AppDimens.isWeb(context)) {
          // Código para web
          return desktop;

        }
       return desktop;
      },
    );
  }
}