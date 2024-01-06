
import 'package:flutter/material.dart';
import 'package:runtickets/styles/app_colors.dart';
import 'package:runtickets/widgets_input/utils/input_utils.dart';
import 'enums/input_text_state_enum.dart';
import 'header/header_textfield.dart';
import 'text_style/style_text_field.dart';
import 'utils/input_fontsize.dart';

class TextInputFirstName extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final bool enabled;
  final GlobalKey<FormState> formKey;
  const TextInputFirstName(
      {super.key,
        required this.controller,
        required this.label,
        required this.hint,
        required this.formKey,
        this.enabled = true});

  @override
  State<TextInputFirstName> createState() => _TextInputFirstNameState();
}

class _TextInputFirstNameState extends State<TextInputFirstName> {
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
            onFocusChange: (hasFocus){
              if (widget.controller.text.isEmpty) {
                setState(() {
                  statusTextField = TypeTextFieldState.valided;
                });
              }
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: TextFormField(
                key: const Key('textFieldFirstName'),
                controller: widget.controller,
                style: styleTextFieldTextTyped(),
                keyboardType: TextInputType.emailAddress,
                enabled: true,
                decoration: InputDecoration(
                    hintText: widget.hint,
                    fillColor: AppColors.background,
                    filled: true,
                    hintStyle: const TextStyle(color: Colors.grey,
                        fontSize: InputTextFontSize.fontSizeHint),
                    labelStyle: const TextStyle(color: Colors.grey,
                        fontSize: InputTextFontSize.fontSizeHint),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    contentPadding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                    border: InputBorder.none),
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

              ),
            ),
          ),
        ),
        const SizedBox(height: 15,)

      ],
    );
  }
}
