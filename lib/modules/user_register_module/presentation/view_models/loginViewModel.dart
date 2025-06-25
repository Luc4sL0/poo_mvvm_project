import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/baseViewModel.dart';
import '../../../../core/services/validator_service.dart';
import '../../models/user_model.dart';
import '../../repositories/auth_repository.dart';

class LoginViewModel extends BaseViewModel{

  final _auth = AuthRepository();

  /* Título: Verifica se os campos obrigatórios foram preenchidos.
  *
  * Descrição: Essa função possui a finalidade de verificar se os campos
  * de texto obrigatórios foram preenchidos.
  *
  * @return:
  *   - true: os campos de texto não estão vazios.
  *   - false: pelo menos algum dos campos de texto estão vazios.
  */
  bool _verifyFields({required List<TextEditingController> textFields}){
    final fieldsValidator = FieldsValidator();
    bool isValid = !fieldsValidator.fieldsAreEmpty(textFields);
    if(!isValid) setMessage(data: fieldsValidator.errorInfo!);
    return isValid;
  }

  /* Título: Valida e envia os dados para login.
  *
  * Descrição: Essa função possui a finalidade de iniciar o protocolo de
  * login de usuários. Por meio dela, os dados inseridos nos campos são
  * passados como parâmetro para a função responsável por realizar a
  * comunicação com os sistemas de login do Firebase.
  */
  Future<void> loginDefault({
    required BuildContext context,
    required TextEditingController emailCon,
    required TextEditingController passwordCon
  }) async {
    if (_verifyFields(textFields: [emailCon,passwordCon])){
      await tryCatchWrapper(() async {
        await _auth.loginWithEmailPassword(emailCon.text, passwordCon.text);
        final userModel = Provider.of<UserModel>(context, listen: false);
        userModel.updateEmail(emailCon.text);
      });
    }
  }

  /* Título: Requisita o login com Google.
  *
  * Descrição: Essa função possui a finalidade de iniciar o protocolo de
  * login de usuários usando sua conta no Google. Por meio dela, a função
  * "loginWithGoogle" é executada e fornece comunicação entre os recursos
  * da biblioteca "google_sign_in" e o Firebase.
  */
  Future<void> loginGoogle({required BuildContext context}) async {
    tryCatchWrapper(() async {
      UserCredential data = await _auth.loginWithGoogle();
      if(data.user != null && data.user!.email != null){
        final userModel = Provider.of<UserModel>(context, listen: false);
        userModel.updateEmail(data.user!.email!);
      }
    });
  }
}