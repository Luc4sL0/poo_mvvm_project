import 'package:flutter/material.dart';
import 'package:poo_project/core/baseViewModel.dart';
import 'package:provider/provider.dart';

import '../../constants/URM_AppTexts.dart';
import '../../models/user_model.dart';
import '../../repositories/auth_repository.dart';

class UserAccountViewModel extends BaseViewModel{

  final _auth = AuthRepository();
  UserModel? user;

  // Carrega o modelo do usuário logado.
  UserModel loadUserData(BuildContext context){
    user ??= Provider.of<UserModel>(context, listen: false);
    return user!;
  }

  /* Título: Desconecta a conta ativa.
  *
  * Descrição: Essa função tenta desconectar as credenciais
  * da conta atual vinculada no sistema, de modo que, o usuário
  * possa fazer novamente o login com outras credenciais.
  *
  */
  Future<void> logout() async{
    tryCatchWrapper(() async{
      await _auth.signOut();
      setMessage(
        data: {
          'icon': Icons.check_circle_outline,
          'content': URM_AppTexts.logoutAccount_message,
          'error': false,
        },
      );
    });
  }

  /* Título: Inicia o protocolo de exclusão de uma conta.
  *
  * Descrição: Essa função possui a finalidade de tentar
  * deletar uma conta de usuário por meio do AuthRepository.
  *
  */
  Future<bool> destroyAccount() async{
    bool wasDeleted = false;
    await tryCatchWrapper(() async{
      wasDeleted = await _auth.deleteAccount();
      if(wasDeleted){
        setMessage(
          data: {
            'icon': Icons.delete,
            'content': URM_AppTexts.deleteAccount_message,
            'error': false,
          },
        );
      }
    });
    return wasDeleted;
  }

}