import 'package:login_cadastro/model/user_model.dart';

class UserDataBase {
  List<UserModel> users = [
    UserModel(name: 'Kaian', password: 'Senai'),
    UserModel(name: 'Nicolas', password: 'Nick')
  ];

  void addUser(UserModel user) async {
    users.add(user);
  }

}
