import 'package:flutter/material.dart';
import 'package:login_cadastro/User/database/user_database.dart';
import 'package:login_cadastro/ui/pages/HomePage.dart';
import 'package:login_cadastro/ui/pages/login.dart';

import '../model/user_model.dart';

class UserController {
  UserDataBase userDataBase = UserDataBase();

  void login(BuildContext context, String nome, String senha) {
    print('chegamos aqui');
    

    /*uso o iterador para percorrer a lista e verificar se existe o nome passado
  e armazeno o resultado desse iteração na variável resultado*/
    var resultado = UserDataBase.users.indexWhere((item) => item.name == nome);
    print(resultado);

    if (resultado == -1) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Usuário ou senha inválidos'),
        ),
      );
    }

    if (UserDataBase.users[resultado].password == senha) {
      /*o 'pushAndRemoveUtil' serve para colocar o prato de cima embaixo, pq no mobile o sistema que se usa é de empilhamento de pratos
  ent, qnd eu logo, ele volta para pagina logada se tornando a base */
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => HomePage()),
        (route) => false,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Usuário ou senha inválidos'),
        ),
      );
    }
  }

//   // Método para realizar o cadastro
//   void cadastrar(BuildContext context, String nome, String senha) {
//   // Verificar se o nome de usuário já existe
//   if (userDataBase.users.any((user) => user.name == nome)) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         backgroundColor: Colors.red,
//         content: Text('Nome de usuário já está em uso'),
//       ),
//     );
//   } else {
//     // Adicionar o novo usuário ao banco de dados
//     userDataBase.addUser(UserModel(name: nome, password: senha));

//     // Mostrar mensagem de sucesso
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         backgroundColor: Colors.green,
//         content: Text('Cadastro realizado com sucesso'),
//       ),
//     );

//     // Passar os dados do novo usuário para a tela de login
//     Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(builder: (_) => Login(newUser: UserModel(name: nome, password: senha))),
//       (route) => false,
//     );
//   }
// }



// Future<void> cadastrar(BuildContext context, String nome, String senha) async {
//   if (nome.isNotEmpty && senha.isNotEmpty) {
//     try {
//       UserModel user = UserModel(name: nome, password: senha);
//       int id = await userDataBase.addUser(user);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Usuário cadastrado com sucesso com o ID: $id'),
//         ),
//       );

//       // Após o cadastro bem-sucedido, navegue para a tela de login
//       Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(builder: (_) => Login(newUser: user)),
//         (route) => false,
//       );

//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Erro ao cadastrar usuário: $e'),
//         ),
//       );
//     }
//   } else {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Todos os campos são obrigatórios'),
//       ),
//     );
//   }
}