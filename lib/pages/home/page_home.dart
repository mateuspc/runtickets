import 'package:flutter/material.dart';
import 'package:runtickets/responsive/responsive_container.dart';
import 'package:runtickets/styles/app_colors.dart';

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    return  ResponsiveContainer(mobile: Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/logo/logo_horizontal_azul.png"),
      ),
    ),
      desktop: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.colorPrimary,
          toolbarHeight: 80,
          title: SizedBox(
              height: 50,
              child: Image.asset("assets/logo/logo.png")
          ),
        ),
      ),

    );
  }
}
