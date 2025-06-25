import 'package:flutter/material.dart';
import 'package:poo_project/core/services/validator_service.dart';

import '../../../../core/baseViewModel.dart';
import '../../constants/URM_AppTexts.dart';
import '../../repositories/auth_repository.dart';


class ForgotPasswordViewModel extends BaseViewModel{

  final _auth = AuthRepository();

  /* Título: Solicita o envio de um email para alteração de senha.
  *
  * Descrição: Essa função possui a finalidade de solicitar ao módulo
  * do Firebase o envio de um email automático com um link para a
  * alteração de uma senha em uma conta do tipo email já existente.
  *
  * @return:
  *   - true: email para resetar a senha foi enviado.
  *   - false: algum tipo de erro ocorreu no processo.
  */
  Future<bool> passwordReset(TextEditingController userEmailCon) async{

    FieldsValidator fieldsValidator = FieldsValidator();
    if(!fieldsValidator.emailField(field: userEmailCon)){
      setMessage(data: fieldsValidator.errorInfo!);
      return false;
    }

    bool hasSent = false;
    await tryCatchWrapper(() async {
      await _auth.auth.sendPasswordResetEmail(email: userEmailCon.text);
      setMessage(
        data: {
          'icon': Icons.check_circle_outline,
          'content': URM_AppTexts.forgotPass_FPscreen_sendEmailSucess_message,
          'error': false,
        },
      );
      hasSent = true;
    });

    return hasSent;
  }

}