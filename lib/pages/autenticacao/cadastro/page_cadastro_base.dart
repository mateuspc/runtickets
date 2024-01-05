import 'package:flutter/material.dart';
import 'package:runtickets/pages/autenticacao/cadastro/desktop/page_cadastro_desktop.dart';
import 'package:runtickets/pages/autenticacao/cadastro/mobile/page_cadastro_mobile.dart';
import 'package:runtickets/responsive/responsive_container.dart';

class PageCadastroBase extends StatefulWidget {
  const PageCadastroBase({super.key});

  @override
  State<PageCadastroBase> createState() => _PageCadastroBaseState();
}

class _PageCadastroBaseState extends State<PageCadastroBase> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveContainer(
        mobile: PageCadastroMobile(),
        desktop: PageCadastroDesktop(),
      ),
    );
  }
}
