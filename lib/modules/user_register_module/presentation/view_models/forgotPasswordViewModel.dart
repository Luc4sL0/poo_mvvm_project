import 'package:flutter/material.dart';

import '../../../../core/baseViewModel.dart';
import '../../constants/URM_AppTexts.dart';
import '../../repositories/auth_repository.dart';


class ForgotPasswordViewModel extends BaseViewModel{

  final authService = AuthService();

  /* Título: Solicita o envio de um email para alteração de senha.
  *
  * Descrição: Essa função possui a finalidade de solicitar ao módulo
  * do Firebase o envio de um email automático com um link para a
  * alteração de uma senha em uma conta do tipo email já existente.
  */
  Future<bool> passwordReset(String userEmail) async{
    bool resetSend = false;
    await tryCatchWrapper(() async {
      await authService.auth.sendPasswordResetEmail(email: userEmail);
      setMessage(
        data: {
          'icon': Icons.check_circle_outline,
          'content': URM_AppTexts.forgotPass_FPscreen_sendEmailSucess_message,
          'error': false,
        },
      );
      resetSend = true;
    });
    return resetSend;
  }

}