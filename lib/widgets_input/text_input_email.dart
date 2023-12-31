import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Importe o pacote para usar o TextInputFormatter
import 'package:runtickets/styles/app_colors.dart';
import 'package:runtickets/styles/app_fontSize.dart';
import 'package:runtickets/widgets_input/utils/input_utils.dart';
import 'package:validators/validators.dart';

import 'enums/input_text_state_enum.dart';
import 'header/header_textfield.dart';
import 'text_style/style_text_field.dart';
import 'utils/input_fontsize.dart';

class TextInputEmail extends StatefulWidget {
  final TextEditingController emailController;
  final String label;
  final String hint;
  final bool enabled;
  final GlobalKey<FormState> formKey;

  const TextInputEmail({
    Key? key,
    required this.emailController,
    required this.label,
    required this.hint,
    required this.formKey,
    this.enabled = true,
  }) : super(key: key);

  @override
  State<TextInputEmail> createState() => _TextInputEmailState();
}

class _TextInputEmailState extends State<TextInputEmail> {
  TypeTextFieldState statusTextField = TypeTextFieldState.valided;

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
              if (widget.emailController.text.isEmpty) {
                setState(() {
                  statusTextField = TypeTextFieldState.valided;
                });
              }
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: TextFormField(
                key: const Key('textFieldLogin'),
                controller: widget.emailController,
                keyboardType: TextInputType.emailAddress,
                enabled: true,
                style: styleTextFieldTextTyped(),
                inputFormatters: [
                  // Adicione o TextInputFormatter para remover espaços
                  FilteringTextInputFormatter.deny(RegExp(r'\s')),
                ],
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
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 10,
                  ),
                  border: InputBorder.none,
                ),
                validator: (String? value) {
                  if (isEmail(value!)) {
                    setState(() {
                      statusTextField = TypeTextFieldState.valided;
                    });
                  }
                  if (value.isEmpty && FocusScope.of(context).hasFocus) {
                    setState(() {
                      statusTextField = TypeTextFieldState.valided;
                    });
                  }
                  if (value.isEmpty && !FocusScope.of(context).hasFocus) {
                    setState(() {
                      statusTextField = TypeTextFieldState.errorFieldRequired;
                    });
                  }

                  if (value.isNotEmpty && !isEmail(value)) {
                    setState(() {
                      statusTextField = TypeTextFieldState.emailIsInvalid;
                    });
                  }
                  return null;
                },
                onChanged: (value) {
                  widget.formKey.currentState?.validate();
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 15,)
      ],
    );
  }

}
