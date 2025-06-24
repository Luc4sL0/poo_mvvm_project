/* Título: Organiza as propriedades de texto do módulo user_register_module.
*
* Descrição: Essa classe possui variáveis destinadas ao armazenamento
* de textos utilizados nos mais diversos widgets desse módulo.
*/
class URM_AppTexts{

  static const String fields_name = 'Nome Completo';
  static const String fields_telephone = 'Telefone';
  static const String fields_email = 'Email';

  // login screen

  static const String loginTitle = 'Bem vindo de volta!';
  static const String loginDescription = 'Preencha os campos abaixo para efetuar seu login no sistema do aplicativo.';
  static const String login_LIscreen_fields_password = 'Senha';
  static const String login_LIscreen_button_forgotPass = 'Esqueceu sua senha?';
  static const String login_LIscreen_button_loginWGoogle = 'Login com Google';
  static const String login_LIscreen_button_continue = 'Continuar';
  static const String login_LIscreen_button_noAccount = 'Não tem uma conta? Clique aqui!';

  // forgot password screen

  static const String forgotPassPageTitle = 'Alterando a senha';
  static const String forgotPassTitle = 'Deseja alterar sua senha?';
  static const String forgotPassDescription = 'Insira seu email abaixo para que possamos te enviar um link para a alteração da sua senha.';
  static const String forgotPass_FPscreen_button_send = 'Enviar';
  static const String forgotPass_FPscreen_sendEmailSucess_message = 'O email para resetar sua senha foi enviado!';


  // signup screen

  static const String signUpTitle = 'Criar conta';
  static const String signUpDescription = 'Preencha os campos abaixo para efetuar seu cadastro no sistema do aplicativo.';
  static const String signUp_SUscreen_fields_createPassword = 'Crie uma senha';
  static const String signUp_SUscreen_fields_confirmPassword = 'Confirme sua senha';
  static const String signUp_SUscreen_button_create = 'Criar';
  static const String signUp_SUscreen_button_hasAccount = 'Já tem uma conta? Clique aqui!';
  static const String signUp_SUscreen_passwordError_message = 'A senha presente nos dois campos são distintas!';

  // user account card screen

  static const String userAccountCardTitle = 'Bem vindo novamente!';

  // user account screen

  static const String accountTitle = 'Sua conta';

  static const String account_UAscreen_section_actTitle = 'Atividade';

  static const String account_UAscreen_section_securityTitle = 'Segurança';

  static const String account_UAscreen_drawer_changePassTitle = 'Alterar senha';
  static const String account_UAscreen_drawer_changePassDescription= 'Clique aqui para requisitar a alteração de senha.';

  static const String account_UAscreen_button_logout = 'Desconectar conta';
  static const String account_UAscreen_button_deleteAccount = 'Excluir conta';

  // delete account screen

  static const String deleteAccount_DAdialog_title = 'Exclusão de conta';
  static const String deleteAccount_DAdialog_message = 'Você tem certeza que deseja excluir permanentemente sua conta de usuário do aplicativo? Todos os seus dados serão perdidos.';
  static const String deleteAccount_DAdialog_subscriptionError = 'Não é possível excluir uma conta com assinaturas ativas!';

}