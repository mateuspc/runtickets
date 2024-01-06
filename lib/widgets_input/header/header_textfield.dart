
import 'package:flutter/material.dart';

import '../../styles/app_colors.dart';
import '../enums/input_text_state_enum.dart';
import '../utils/input_fontsize.dart';
import '../utils/input_utils.dart';

Row labelTopAndErrorTextField({required String label, required TypeTextFieldState statusTextField}) {
  return Row(
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
      ),
      const Spacer(),
      if (statusTextField != TypeTextFieldState.valided)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              InputUtils.getTextMessageError(statusTextField),
              style: const TextStyle(
                color: AppColors.colorError,
                fontWeight: FontWeight.bold,
                fontSize: InputTextFontSize.fontSizeErrorTextField,
              ),
            ),
          ),
        )
    ],
  );
}
