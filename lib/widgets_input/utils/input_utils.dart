
import '../enums/input_text_state_enum.dart';
import '../text_input_email.dart';

class InputUtils {

  static String getTextMessageError(TypeTextFieldState textFieldStatus) {
    switch (textFieldStatus) {
      case TypeTextFieldState.stateDef:
        return '';
      case TypeTextFieldState.valided:
        return '';
      case TypeTextFieldState.desabilitado:
        return '';
      case TypeTextFieldState.errorFieldRequired:
        return 'Campo obrigatório!';
      case TypeTextFieldState.error:
        return 'Entrada inválida';
      case TypeTextFieldState.nameAndSobrename:
        return 'Digite o nome completo';
      case TypeTextFieldState.cpfIsInvalid:
        return 'CPF inválido';
      case TypeTextFieldState.nameIsEmpty:
        return 'Nome está vazio';
      case TypeTextFieldState.cpfIsEmpty:
        return 'CPF está vazio';
      case TypeTextFieldState.dataNascimentoIsInvalid:
        return 'Data inválida';
      case TypeTextFieldState.emailIsInvalid:
        return 'Email inválido';
      case TypeTextFieldState.celularIsInvalid:
        return 'Celular inválido';
      case TypeTextFieldState.cnpjIsInvalid:
        return 'CNPJ inválido';
      case TypeTextFieldState.peloMenosTresDigitos:
        return 'Digite pelo menos 3 dígitos';
    }
  }

}