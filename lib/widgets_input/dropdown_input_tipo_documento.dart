import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:runtickets/styles/app_colors.dart';
import 'package:runtickets/widgets_input/utils/input_utils.dart';
import 'enums/input_text_state_enum.dart';
import 'providers/type_document_cadastro_provider.dart';
import 'text_input_document.dart';
import 'text_style/style_text_field.dart';
import 'utils/input_fontsize.dart';


class TextInputDropdownButtonTipoDocument extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final bool enabled;
  final GlobalKey<FormState> formKey;
  const TextInputDropdownButtonTipoDocument(
      {super.key,
        required this.controller,
        required this.label,
        required this.hint,
        required this.formKey,
        this.enabled = true});

  @override
  State<TextInputDropdownButtonTipoDocument> createState() => _TextInputDropdownButtonTipoDocumentState();
}

class _TextInputDropdownButtonTipoDocumentState extends State<TextInputDropdownButtonTipoDocument> {
  TypeTextFieldState statusTextField = TypeTextFieldState.valided;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.label,
            style: const TextStyle(fontSize: 12),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          child: Focus(
            onFocusChange: (hasFocus){
              if (widget.controller.text.isEmpty) {
                setState(() {
                  statusTextField = TypeTextFieldState.valided;
                });
              }
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: DropdownButtonFormField(
                key: const Key('textFieldDocument'),
                borderRadius: BorderRadius.circular(15),
                decoration: InputDecoration(
                  hintText: widget.hint,
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
                alignment: AlignmentDirectional.centerStart,
                dropdownColor: AppColors.colorWhite, // Altere para a cor desejada
                onChanged: (value) {
                  widget.controller.text = "";
                  TypeDocumentCadastroProvider type =
                  Provider.of<TypeDocumentCadastroProvider>(context, listen: false);
                  type.changeTypeDocument(getTypeDocumentFromString(value!));
                },
                style: styleTextFieldTextTyped(),
                value: 'CPF', // Set 'CPF' as the default value
                items: ['CPF', 'CNPJ', 'Estrangeiro(RNE)', 'Estrangeiro(Passaporte)']
                    .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item, style: const TextStyle(
                    fontSize: InputTextFontSize.fontSizeLabel
                  ),),
                ))
                    .toList(),

                // Configurando a posição da janela
                // Neste exemplo, estou movendo a janela para baixo adicionando 80 pixels à posição vertical
                menuMaxHeight: 200, // Defina a altura máxima do menu conforme necessário
                elevation: 8, // Ajuste a elevação conforme necessário
                selectedItemBuilder: (BuildContext context) {
                  return ['CPF', 'CNPJ', 'Estrangeiro(RNE)', 'Estrangeiro(Passaporte)']
                      .map<Widget>((String item) {
                    return Container(
                      alignment: Alignment.center,
                      child: Text(item),
                    );
                  }).toList();
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 15,)
      ],
    );
  }
  TypeDocument getTypeDocumentFromString(String documentType) {
    switch (documentType) {
      case 'CPF':
        return TypeDocument.cpf;
      case 'CNPJ':
        return TypeDocument.cnpj;
      case 'Estrangeiro(RNE)':
        return TypeDocument.estrangeiro_rne;
      case 'Estrangeiro(Passaporte)':
        return TypeDocument.estrangeiro_passaporte;
      default:
        throw ArgumentError('Tipo de documento desconhecido: $documentType');
    }
  }

  }
