import 'package:flutter/material.dart';

class PageCadastro extends StatefulWidget {
  const PageCadastro({super.key});

  @override
  State<PageCadastro> createState() => _PageCadastroState();
}

class _PageCadastroState extends State<PageCadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Cadastro'),
      ),
      body: Center(
        child: Text('Pagina Cadastro'),
      ),
    );
  }
}
