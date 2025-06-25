import 'package:poo_project/core/baseViewModel.dart';

// Modelo que lida com o usuário.
class UserModel extends BaseViewModel{
  String? _email;

  String get email => _email ?? "";

  UserModel({String? userEmail}){
    _email = userEmail;
  }

  void updateEmail(String newEmail) {
    _email = newEmail;
    notifyListeners();
  }
}