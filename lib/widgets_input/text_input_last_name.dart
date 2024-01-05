import 'package:flutter/material.dart';
import 'package:runtickets/styles/app_colors.dart';
import 'package:runtickets/widgets_input/utils/input_utils.dart';
import 'enums/input_text_state_enum.dart';
import 'utils/input_fontsize.dart';

class TextInputLastName extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final bool enabled;
  final GlobalKey<FormState> formKey;
  const TextInputLastName(
      {super.key,
        required this.controller,
        required this.label,
        required this.hint,
        required this.formKey,
        this.enabled = true});

  @override
  State<TextInputLastName> createState() => _TextInputLastNameState();
}

class _TextInputLastNameState extends State<TextInputLastName> {
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
              child: TextFormField(
                key: const Key('textFieldLastName'),
                controller: widget.controller,
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
        if(statusTextField != TypeTextFieldState.valided)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(InputUtils.getTextMessageError(statusTextField), style: const TextStyle(
                  color: AppColors.colorError,
                  fontWeight: FontWeight.bold,
                  fontSize: InputTextFontSize.fontSizeErrorTextField
              ),),
            ),
          )else
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text("", style: TextStyle(
                  color: AppColors.colorError,
                  fontWeight: FontWeight.bold,
                  fontSize: InputTextFontSize.fontSizeErrorTextField
              ),),
            ),
          )
      ],
    );
  }
}
