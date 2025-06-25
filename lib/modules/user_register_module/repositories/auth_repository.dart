import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


/* Título: Lida com quaisquer processos atrelados com autenticação.
*
* Descrição: Essa classe possui funções e variáveis que são dedicadas
* para processos de registro e acesso de contas de usuários.
*/
class AuthRepository {

  // Mensagens
  static const String authService_authError_invalidCredential = 'O email ou a senha estão incorretos.';
  static const String authService_authError_invalidEmail = 'O email inserido está mal formato.';
  static const String authService_authError_emailInUse = 'Esse email já está em uso.';
  static const String authService_authError_weakPass = 'A senha inserida é fraca! É necessário ter mais de 6 caracteres.';
  static const String authService_authError_noUserAuth = 'Nenhum usuário autenticado.';


  final FirebaseAuth auth = FirebaseAuth.instance;

  /* Título: Lida com login de usuários usando email e senha.
  *
  * Descrição: Envia os dados fornecidos pelo usuário para uma requisição
  * de login no projeto do firebase. Se o processo for executado com êxito
  * as credenciais do usuário são retornadas, caso contrário, o erro é retornado.
  *
  * @return: credencial de usuário.
  */
  Future<UserCredential> loginWithEmailPassword(String userEmail, userPassword) async{
    try{
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );
      return userCredential;
    }
    on FirebaseAuthException catch (e){
      switch(e.code){
        case 'invalid-credential':
          throw authService_authError_invalidCredential;
        case 'invalid-email':
          throw authService_authError_invalidEmail;
        default:
          throw '${e.code}: ${e.message}';
      }
    }
  }

  /* Título: Lida com login de usuários usando a autenticação do Google.
  *
  * Descrição: Permite a autenticação do usuário utilizando a conta do
  * Google do usuário. Essa função utiliza o plugin "google_sign_in" para
  * facilitar a comunicação com os recursos do Google.
  *
  * @return: credencial de usuário.
  */
  Future<UserCredential> loginWithGoogle() async{
    try {
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser?.authentication;
      final userCredential = GoogleAuthProvider.credential(
          idToken: googleAuth?.idToken,
          accessToken: googleAuth?.accessToken
      );
      return await auth.signInWithCredential(userCredential);
    }
    catch (e) {
      throw e.toString();
    }

  }

  /* Título: Lida com registro de novos usuários usando email e senha.
  *
  * Descrição: Envia os dados fornecidos pelo usuário para uma requisição
  * de criação de usuários no projeto do firebase. Se o processo for executado
  * com êxito as novas credenciais do usuário são retornadas, caso contrário, o
  * erro é retornado.
  *
  * @return: credencial de usuário.
  */
  Future<UserCredential> signUpWithEmailPassword(String userEmail, userPassword) async{
    try{
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );
      return userCredential;
    }
    on FirebaseAuthException catch (e) {
      switch(e.code){
        case 'email-already-in-use':
          throw authService_authError_emailInUse;
        case 'weak-password':
          throw authService_authError_weakPass;
        default:
          throw '${e.code}: ${e.message}';
      }
    }
  }


  /* Título: Desconecta as credenciais conectadas.
  *
  * Descrição: Desconecta a conta conectada com o sistema.
  */
  Future<void> signOut() async {
    return await auth.signOut();
  }

  /* Título: Excluir permanentemente uma conta do servidor do aplicativo.
  *
  * Descrição: Essa função exclui, se possível, uma conta que foi cadastrada
  * no aplicativo.
  */
  Future<bool> deleteAccount() async {
    try {
      if (auth.currentUser != null) {
        await auth.currentUser!.delete();
        return true;
      }
      else {
        throw authService_authError_noUserAuth;
      }
    }
    on FirebaseAuthException catch (e) {
      throw '${e.code}: ${e.message}';
    }
  }

}
