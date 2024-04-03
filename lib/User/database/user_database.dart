import 'package:login_cadastro/User/model/user_model.dart';

class UserDataBase {
  static List<UserModel> users = [
    UserModel(name: 'Kaian', password: 'Senai'),
    UserModel(name: 'Nicolas', password: 'Nick')
  ];

  static addUser(UserModel user) async {
    users.add(user);
  }

}
