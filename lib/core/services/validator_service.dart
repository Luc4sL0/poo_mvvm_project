import 'package:flutter/material.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';

class Validator{
  static bool isNumeric(String value) {
    return num.tryParse(value) != null;
  }

  static bool isValidEmail(String email) {
    final emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegex.hasMatch(email);
  }

  static bool isValidPhoneNumber(String phoneNumber) {
    try {
      final parsedPhoneNumber = PhoneNumber.parse(phoneNumber);
      return parsedPhoneNumber.isValid();
    }
    catch (e) {
      return false;
    }
  }
}

class FieldsValidator{

  static const String invalidFields_images = 'Faça o upload das imagens obrigatórias para continuar';
  static const String invalidFields_textFields = 'Preencha os campos de textos obrigatórios (*)!';
  static const String invalidFields_textFields_numeric = 'O contéudo desse campo deve ser obrigatoriamente numérico.';
  static const String invalidFields_emailField = 'O email inserido é inválido ou está mal formatado!';
  static const String invalidFields_phoneField = 'O número de telefone é inválido ou está mal formatado!';


  Map<String, dynamic>? _errorInfo;
  Map<String, dynamic>? get errorInfo => _errorInfo;

  void setError(Map<String, dynamic>? message) {
    _errorInfo = message;
  }

  bool fieldsAreEmpty(List<TextEditingController> fields){
    for(TextEditingController field in fields){
      if(field.text.isEmpty){
        setError({
          'icon': Icons.text_fields,
          'content': invalidFields_textFields,
          'error': true,
        });
        return true;
      }
    }
    return false;
  }

  bool fieldIsEmpty(TextEditingController field){
    if(field.text.isEmpty){
      setError({
        'icon': Icons.text_fields,
        'content': invalidFields_textFields,
        'error': true,
      });
      return true;
    }
    return false;
  }

  bool numericField({
    required TextEditingController field,
    required bool isObrigatory,
  }){
    if(isObrigatory){
      bool isEmpty = fieldIsEmpty(field);
      if(isEmpty) return false;
    }
    if(field.text.isNotEmpty && !Validator.isNumeric(field.text)){
      setError({
        'icon': Icons.numbers,
        'content': '${field.text} : ${invalidFields_textFields_numeric}',
        'error': true,
      });
      return false;
    }
    return true;
  }

  bool emailField({required TextEditingController field}){
    if(fieldIsEmpty(field)) return false;
    bool status = Validator.isValidEmail(field.text);
    if(!status){
      setError({
        'icon': Icons.email,
        'content': '${field.text} : ${invalidFields_emailField}',
        'error': true,
      });
    }
    return status;
  }

  bool phoneField({required TextEditingController field}){
    bool status = Validator.isValidPhoneNumber(field.text);
    if(!status){
      setError({
        'icon': Icons.phone,
        'content': '${field.text} : ${invalidFields_phoneField}',
        'error': true,
      });
    }
    return status;
  }
}