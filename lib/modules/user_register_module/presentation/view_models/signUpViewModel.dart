import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/baseViewModel.dart';
import '../../../../core/services/validator_service.dart';
import '../../models/user_model.dart';
import '../../repositories/auth_repository.dart';
import '../../constants/URM_AppTexts.dart';

class SignUpViewModel extends BaseViewModel{

  final _auth = AuthService();

  /* Título: Verifica se os campos obrigatórios foram preenchidos.
  *
  * Descrição: Essa função possui a finalidade de verificar se os campos
  * de texto obrigatórios foram preenchidos.
  *
  * @return:
  *   - true: os campos de texto não estão vazios.
  *   - false: pelo menos algum dos campos de texto estão vazios.
  */
  bool verifyFields({required List<TextEditingController> textFields}){
    final FieldsValidator fieldsValidator = FieldsValidator();
    bool status = !fieldsValidator.fieldsAreEmpty(textFields);
    if(fieldsValidator.errorInfo != null){
      setMessage(data: fieldsValidator.errorInfo!);
    }
    return status;
  }

  /* Título: Valida e envia os dados para registro.
  *
  * Descrição: Essa função possui a finalidade de iniciar o protocolo de cadastro
  * de novos usuários. Por meio dela, os dados inseridos nos campos são
  * validados e posteriormente passados como parâmetro para a função
  * responsável por realizar a comunicação com os sistemas de registro
  * do Firebase.
  */
  Future<bool> register({
    required BuildContext context,
    required TextEditingController emailCon,
    required TextEditingController passCon,
    required TextEditingController confirmPassCon
  }) async {
    bool status = false;
    if(verifyFields(textFields: [emailCon, passCon, confirmPassCon])){
      if(passCon.text == confirmPassCon.text){
        await tryCatchWrapper(() async{
          await _auth.signUpWithEmailPassword(emailCon.text, passCon.text);
          final userModel = Provider.of<UserModel>(context, listen: false);
          userModel.updateEmail(emailCon.text);
          status = true;
        });
      }
      else{
        setMessage(
          data: {
            'icon': Icons.password,
            'content': URM_AppTexts.signUp_SUscreen_passwordError_message,
            'error': true,
          },
        );
      }
    }
    return status;
  }

}