
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
import 'package:uicons/uicons.dart';

class PageCadastroMobile extends StatefulWidget {
  const PageCadastroMobile({super.key});

  @override
  State<PageCadastroMobile> createState() => _PageCadastroMobileState();
}

class _PageCadastroMobileState extends State<PageCadastroMobile> {

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _sobrenomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dataNascimentoController = TextEditingController();
  final TextEditingController _whatsappController = TextEditingController();
  final TextEditingController _documentController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _repetirSenhaController = TextEditingController();

  final GlobalKey<FormState> _formKeyCadastro = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
         appBar: AppBar(
           leading: Align(
             alignment: Alignment.centerLeft,
             child: IconButton(
               onPressed: (){
                 context.go(AppRoutes.PAGE_DASHBOARD);
               },
               icon: Icon(UIcons.regularRounded.angle_left),
             ),
           ),
           title: Image.asset("assets/logo/logo_horizontal_azul.png"),
         ),
         body: PageView(
           children: [
             SingleChildScrollView(
               padding: EdgeInsets.symmetric(horizontal: 15),
               child: Card(
                 elevation: 0,
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
                               fontSize: 25),
                         ),
                       ),
                       SizedBox(
                         height: 15,
                       ),
                       TextInputFirstName(
                         key: const Key('textFieldNome'),
                         label: "Nome completo",
                         controller: _nomeController,
                         hint: 'seu nome',
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
                       Row(
                         children: [
                           Expanded(
                             flex: 2,
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
                               formKey: _formKeyCadastro,
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
             ),
           ],
         ),
      ),
    );
  }
}
