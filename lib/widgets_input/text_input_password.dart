import 'package:flutter/material.dart';
import 'package:runtickets/styles/app_colors.dart';
import 'package:runtickets/widgets_input/utils/input_colors.dart';
import 'package:runtickets/widgets_input/utils/input_fontsize.dart';
import 'package:runtickets/widgets_input/utils/input_utils.dart';

import 'enums/input_text_state_enum.dart';


class TextInputPassword extends StatefulWidget {
  final TextEditingController passwordController;
  final String label;
  final String? hint;
  final bool enabled;
  final GlobalKey<FormState> formKey;

  const TextInputPassword(
      {super.key,
        required this.passwordController,
        required this.label,
        this.hint = "∗ ∗ ∗ ∗ ∗ ∗",
        required this.formKey,
        this.enabled = true});

  @override
  State<TextInputPassword> createState() => _TextInputPasswordState();
}

class _TextInputPasswordState extends State<TextInputPassword> {
  TypeTextFieldState statusTextField = TypeTextFieldState.valided;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.label,
            style: TextStyle(
                fontSize: InputTextFontSize.fontSizeLabel),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          child: TextFormField(
            key: const Key('textFieldPassword'),
            controller: widget.passwordController,
            keyboardType: TextInputType.visiblePassword,
            enabled: widget.enabled,
            obscureText: true,
            autocorrect: false,
            obscuringCharacter: "∗",
            style: const TextStyle(
                fontSize: InputTextFontSize.fontSizeText),
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
      ],
    );
  }
}