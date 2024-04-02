import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:login_cadastro/controller/user_controller.dart';
import 'package:login_cadastro/database/user_database.dart';
import 'package:login_cadastro/model/user_model.dart';
import 'package:login_cadastro/ui/pages/login.dart';

class Cadastro extends StatelessWidget {
  Cadastro({super.key});

  UserController userController = UserController();
  final nomeController = TextEditingController();
  final senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
        appBar: AppBar(title: Text('Cadastro')),
        body: Column(
          children: [
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: nomeController,
                decoration: const InputDecoration(
                    hintText: 'Usuario', border: OutlineInputBorder()),
              ),
              
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: senhaController,
                obscureText: true,
                decoration: const InputDecoration(
                    hintText: 'Senha', border: OutlineInputBorder()),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () {
                if (nomeController.text.isNotEmpty && senhaController.text.isNotEmpty) {

                  if (UserDataBase.users.any((user) => user.name == nomeController.text)) {

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Nome de usuário já está em uso'),
                      ),
                    );
                  } else {
                    UserModel userModel = UserModel(
                        name: nomeController.text,
                        password: senhaController.text);
                    UserDataBase.addUser(userModel);

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (_) => Login(
                              newUser: UserModel(
                                  name: nomeController.text,
                                  password: senhaController.text))),
                      (route) => false,
                    );
                    
                    // Mostrar mensagem de sucesso
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.green,
                        content: Text('Cadastro realizado com sucesso'),
                      ),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.red,
                    content: Text("Preencha todos os campos"),
                  ));
                }
              },
              child: Text('Cadastrar'),
            )
          ],
        ));
  }
}
