
import 'package:flutter/material.dart';
import 'package:runtickets/widgets_input/text_input_document.dart';

class TypeDocumentCadastroProvider extends ChangeNotifier {

  TypeDocument typeDocument = TypeDocument.cpf;

  void changeTypeDocument(TypeDocument typeDocument){
    this.typeDocument = typeDocument;
    notifyListeners();
  }
}