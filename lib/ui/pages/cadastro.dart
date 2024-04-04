import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:login_cadastro/User/controller/user_controller.dart';
import 'package:login_cadastro/User/database/user_database.dart';
import 'package:login_cadastro/User/model/user_model.dart';

import 'package:login_cadastro/ui/pages/login.dart';

class Cadastro extends StatelessWidget {
  Cadastro({super.key});

  UserController userController = UserController();
  final nomeController = TextEditingController();
  final senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: 300,
              height: 300,
              child: Image.asset('assets/NikoStudie.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextFormField(
                controller: nomeController,
                decoration: const InputDecoration(
                    hintText: 'Usuário', border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
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
            SizedBox(
              width: 500,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (nomeController.text.isNotEmpty &&
                      senhaController.text.isNotEmpty) {
                    if (UserDataBase.users
                        .any((user) => user.name == nomeController.text)) {
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
                          content: Text('Cadastro realizado com sucesso!'),
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
                style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 103, 1),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ) 
                    ),
                child: Text('Cadastrar'),
              ),
            )
          ],
        ),
      ),
    );
  }
}