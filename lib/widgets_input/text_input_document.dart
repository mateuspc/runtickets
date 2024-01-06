

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:runtickets/styles/app_colors.dart';
import 'package:runtickets/widgets_input/providers/type_document_cadastro_provider.dart';
import 'package:runtickets/widgets_input/utils/input_utils.dart';
import 'enums/input_text_state_enum.dart';
import 'header/header_textfield.dart';
import 'text_style/style_text_field.dart';
import 'utils/input_fontsize.dart';

enum TypeDocument {
  cpf,
  cnpj,
  estrangeiro_rne,
  estrangeiro_passaporte,
}

class TextInputDocument extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final bool enabled;
  final GlobalKey<FormState> formKey;
  final TypeDocument initialType;

  const TextInputDocument({
    Key? key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.formKey,
    this.enabled = true,
    required this.initialType,
  }) : super(key: key);

  @override
  State<TextInputDocument> createState() => _TextInputDocumentState();
}

class _TextInputDocumentState extends State<TextInputDocument> {
  TypeTextFieldState statusTextField = TypeTextFieldState.valided;

  MaskTextInputFormatter _getMaskFormatter(TypeDocument type) {
    // Lógica para obter o formatador de máscara com base no tipo do documento
    // Você pode adicionar mais lógica conforme necessário para outros tipos
    switch (type) {
      case TypeDocument.cpf:
        return MaskTextInputFormatter(mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});
      case TypeDocument.cnpj:
        return MaskTextInputFormatter(mask: '##.###.###/####-##', filter: {"#": RegExp(r'[0-9]')});
      default:
        return MaskTextInputFormatter();
    }
  }
  TextInputType _getTextInputTypeKeyboard(TypeDocument type) {
    // Lógica para obter o formatador de máscara com base no tipo do documento
    // Você pode adicionar mais lógica conforme necessário para outros tipos
    switch (type) {
      case TypeDocument.cpf:
      case TypeDocument.cnpj:
      return TextInputType.number;
      default:
        return TextInputType.text;
    }
  }

  String _getHintFromTypeDocument(TypeDocument type) {
    switch (type) {
      case TypeDocument.cpf:
        return 'Digite o CPF';
      case TypeDocument.cnpj:
        return 'Digite o CNPJ';
      case TypeDocument.estrangeiro_rne:
        return 'Digite o número do RNE';
      case TypeDocument.estrangeiro_passaporte:
        return 'Digite o número do Passaporte';
      default:
        throw ArgumentError('Tipo de documento desconhecido: $type');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        labelTopAndErrorTextField(label: widget.label, statusTextField: statusTextField),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          child: Focus(
            onFocusChange: (hasFocus) {
              if (widget.controller.text.isEmpty) {
                setState(() {
                  statusTextField = TypeTextFieldState.valided;
                });
              }
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Consumer<TypeDocumentCadastroProvider>(
                builder: (context, value, child) {
                  return TextFormField(
                    key: const Key('textFieldDocument'),
                    controller: widget.controller,
                    keyboardType: _getTextInputTypeKeyboard(value.typeDocument),
                    enabled: true,
                    inputFormatters: [
                      _getMaskFormatter(value.typeDocument)
                    ],
                    style: styleTextFieldTextTyped(),
                    decoration: InputDecoration(
                      hintText: _getHintFromTypeDocument(value.typeDocument),
                      fillColor: AppColors.background,
                      filled: true,
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: InputTextFontSize.fontSizeHint,
                      ),
                      labelStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: InputTextFontSize.fontSizeHint,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      contentPadding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value!.isEmpty && !FocusScope.of(context).hasFocus) {
                        setState(() {
                          statusTextField = TypeTextFieldState.errorFieldRequired;
                        });
                      }
                      return null;
                    },
                    onChanged: (value) {
                      widget.formKey.currentState?.validate();
                    },
                  );
                }
              ),
            ),
          ),
        ),
        const SizedBox(height: 15,)
      ],
    );
  }


}
