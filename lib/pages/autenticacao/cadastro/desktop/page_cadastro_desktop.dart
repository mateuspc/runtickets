import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:runtickets/routes.dart';
import 'package:runtickets/styles/app_colors.dart';
import 'package:runtickets/widgets_input/button/elevated_button_custom.dart';
import 'package:runtickets/widgets_input/dropdown_input_tipo_documento.dart';
import 'package:runtickets/widgets_input/text_input_data_nascimento.dart';
import 'package:runtickets/widgets_input/text_input_document.dart';
import 'package:runtickets/widgets_input/text_input_email.dart';
import 'package:runtickets/widgets_input/text_input_first_name.dart';
import 'package:runtickets/widgets_input/text_input_last_name.dart';
import 'package:runtickets/widgets_input/text_input_password.dart';
import 'package:runtickets/widgets_input/text_input_whatsapp.dart';
import 'package:uicons/uicons.dart';

class PageCadastroDesktop extends StatefulWidget {
  const PageCadastroDesktop({super.key});

  @override
  State<PageCadastroDesktop> createState() => _PageCadastroDesktopState();
}

class _PageCadastroDesktopState extends State<PageCadastroDesktop> with SingleTickerProviderStateMixin{
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _sobrenomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dataNascimentoController = TextEditingController();
  final TextEditingController _whatsappController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _repetirSenhaController = TextEditingController();
  final TextEditingController _documentController = TextEditingController();
  final GlobalKey<FormState> _formKeyCadastro = GlobalKey<FormState>();

  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _slideAnimation = Tween<Offset>(
      begin: const Offset(1.0, -1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        key: const Key("chave_widget_cadastro"),
        appBar: AppBar(
          leading: Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(UIcons.regularRounded.angle_left),
            ),
          ),
        ),
        body: Center(
          child: Container(
            width: 600,
            child: Form(
              key: _formKeyCadastro,
              child: SingleChildScrollView(
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Card(
                        color: Colors.white,
                        elevation: 0,
                        child: SingleChildScrollView(
                          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Cadastro",
                                  style: TextStyle(
                                      color: AppColors.colorBlack,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextInputFirstName(
                                      key: const Key('textFieldNome'),
                                      label: "Nome",
                                      controller: _nomeController,
                                      hint: 'seu nome',
                                      formKey: _formKeyCadastro,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: TextInputLastName(
                                      key: const Key('textFieldSobrenome'),
                                      label: 'Sobrenome',
                                      controller: _sobrenomeController,
                                      formKey: _formKeyCadastro, hint: 'seu sobrenome',
                                    ),
                                  ),
                                ],
                              ),
                              TextInputEmail(
                                key: const Key('textFieldEmailCadastro'),
                                label: "E-mail",
                                emailController: _emailController,
                                hint: 'exemplo@gmail.com',
                                formKey: _formKeyCadastro,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextInputDataNascimento(
                                      key: const Key('textFieldDataNascimento'),
                                      label: "Data de nascimento",
                                      controller: _dataNascimentoController,
                                      hint: '##/##/####',
                                      formKey: _formKeyCadastro,
                                    ),
                                  ),

                                ],
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: size.width < 600 ? 3 : 2,
                                    child: TextInputDropdownButtonTipoDocument(
                                      key: const Key('textFieldDocument'),
                                      label: "Tipo",
                                      controller: _documentController,
                                      hint: '',
                                      formKey: _formKeyCadastro,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: TextInputDocument(
                                      key: const Key('textFieldDocument'),
                                      label: "Documento",
                                      controller: _documentController,
                                      hint: 'seu cpf',
                                      formKey: _formKeyCadastro, initialType: TypeDocument.cpf,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextInputPassword(
                                      key: const Key('textFieldSenhaCadastro'),
                                      label: "Senha",
                                      passwordController: _senhaController,
                                      hint: 'Digite uma nova senha',
                                      formKey: _formKeyCadastro,
                                      obscureText: true,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: TextInputPassword(
                                      key: const Key('textFieldSenhaConfirmCadastro'),
                                      label: "Repetir senha",
                                      passwordController: _senhaController,
                                      hint: 'Digite a senha novamente',
                                      formKey: _formKeyCadastro,
                                      obscureText: true,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              ElevatedButtonCustom(
                                text: 'Cadastrar',
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                  _formKeyCadastro.currentState!.validate();
                                  // context.go(AppRoutes.PAGE_LOADING);
                                },),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
