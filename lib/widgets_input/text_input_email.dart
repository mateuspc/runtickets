import 'package:flutter/material.dart';
import 'package:runtickets/styles/app_colors.dart';
import 'package:runtickets/widgets_input/utils/input_utils.dart';

import 'enums/input_text_state_enum.dart';
import 'utils/input_fontsize.dart';


class TextInputEmail extends StatefulWidget {
  final TextEditingController emailController;
  final String label;
  final String hint;
  final bool enabled;
  final GlobalKey<FormState> formKey;
  const TextInputEmail(
      {super.key,
      required this.emailController,
      required this.label,
      required this.hint,
      required this.formKey,
      this.enabled = true});

  @override
  State<TextInputEmail> createState() => _TextInputEmailState();
}

class _TextInputEmailState extends State<TextInputEmail> {
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
              if (widget.emailController.text.isEmpty) {
                setState(() {
                  statusTextField = TypeTextFieldState.valided;
                });
              }
            },
            child: TextFormField(
              key: const Key('textFieldLogin'),
              controller: widget.emailController,
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
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              validator: (value) {
                if (value!.isEmpty && !FocusScope.of(context).hasFocus) {
                  setState(() {
                    statusTextField = TypeTextFieldState.errorFieldRequired;
                  });
                  return InputUtils.getTextMessageError(statusTextField);
                }
                return null;
              },
              onChanged: (value) {
                widget.formKey.currentState?.validate();
              },

            ),
          ),
        ),
      ],
    );
  }
}
