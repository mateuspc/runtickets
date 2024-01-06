import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:runtickets/pages/dashboard/styles/fontSize.dart';
import 'package:runtickets/routes.dart';
import 'package:runtickets/styles/app_colors.dart';
import 'package:runtickets/widgets_input/button/elevated_button_custom.dart';
import 'package:runtickets/widgets_input/dropdown_input_tipo_documento.dart';
import 'package:runtickets/widgets_input/text_input_data_nascimento.dart';
import 'package:runtickets/widgets_input/text_input_document.dart';
import 'package:runtickets/widgets_input/text_input_email.dart';
import 'package:runtickets/widgets_input/text_input_first_name.dart';
import 'package:runtickets/widgets_input/text_input_fullname.dart';
import 'package:runtickets/widgets_input/text_input_password.dart';
import 'package:uicons/uicons.dart';

class PageCadastroMobile extends StatefulWidget {
  const PageCadastroMobile({Key? key}) : super(key: key);

  @override
  State<PageCadastroMobile> createState() => _PageCadastroMobileState();
}

class _PageCadastroMobileState extends State<PageCadastroMobile>
    with SingleTickerProviderStateMixin {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _sobrenomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dataNascimentoController =
  TextEditingController();
  final TextEditingController _whatsappController = TextEditingController();
  final TextEditingController _documentController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _repetirSenhaController = TextEditingController();

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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () {
                context.pop(context);
              },
              icon: Icon(UIcons.regularRounded.angle_left),
            ),
          ),
          title: Container(
              height: 30,
              child: Image.asset("assets/logo/logo_horizontal_azul.png")),
        ),
        body: PageView(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SlideTransition(
                position: _slideAnimation,
                child: Card(
                  elevation: 0,
                  margin: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: AppColors.colorWhite,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Cadastro",
                            style: TextStyle(
                              color: AppColors.colorBlack,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "(do participante)",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: fontSizeText,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextInputFullName(
                          key: const Key('textFieldNome'),
                          label: "Nome completo",
                          controller: _nomeController,
                          hint: 'Digite seu nome completo',
                          formKey: _formKeyCadastro,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        TextInputEmail(
                          key: const Key('textFieldEmailCadastro'),
                          label: "E-mail",
                          emailController: _emailController,
                          hint: 'exemplo@gmail.com',
                          formKey: _formKeyCadastro,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        TextInputDataNascimento(
                          key: const Key('textFieldDataNascimento'),
                          label: "Data de nascimento",
                          controller: _dataNascimentoController,
                          hint: '##/##/####',
                          formKey: _formKeyCadastro,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        TextInputDropdownButtonTipoDocument(
                          key: const Key('textFieldTypeDocument'),
                          label: "Tipo do documento",
                          controller: _documentController,
                          hint: '',
                          formKey: _formKeyCadastro,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        TextInputDocument(
                          key: const Key('textFieldDocument'),
                          label: "Documento",
                          controller: _documentController,
                          hint: 'seu cpf',
                          formKey: _formKeyCadastro,
                          initialType: TypeDocument.cpf,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        TextInputPassword(
                          key: const Key('textFieldSenhaCadastro'),
                          label: "Senha",
                          passwordController: _senhaController,
                          hint: 'Digite uma nova senha',
                          formKey: _formKeyCadastro,
                          obscureText: true,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        TextInputPassword(
                          key: const Key('textFieldSenhaConfirmCadastro'),
                          label: "Repetir senha",
                          passwordController: _senhaController,
                          hint: 'Digite a senha novamente',
                          formKey: _formKeyCadastro,
                          obscureText: true,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        ElevatedButtonCustom(
                          text: 'Cadastrar',
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            // _formKeyCadastro.currentState!.validate();
                            context.go(AppRoutes.PAGE_LOADING);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
