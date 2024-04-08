import 'package:flutter/material.dart';
import 'package:login_cadastro/User/controller/user_controller.dart';
import 'package:login_cadastro/ui/pages/cadastro.dart';
import 'package:login_cadastro/ui/widgets/myAppBar.dart';

import '../../User/model/user_model.dart';

class Login extends StatefulWidget {
  final UserModel? newUser;

  Login({Key? key, this.newUser}) : super(key: key);

  @override
  _LoginState createState() => _LoginState(newUser: newUser);
}

class _LoginState extends State<Login> {
  final UserModel? newUser;
  UserController userController = UserController();
  final nomeController = TextEditingController();
  final senhaController = TextEditingController();

  _LoginState({this.newUser});

  @override
  void initState() {
    super.initState();
    if (newUser != null) {
      nomeController.text = newUser!.name;
      senhaController.text = newUser!.password;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(texto: 'Login'),
      body: Column(
        children: [
          TextFormField(
            controller: nomeController,
            decoration: const InputDecoration(
                hintText: 'Usuario', border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            controller: senhaController,
            obscureText: true,
            decoration: const InputDecoration(
                hintText: 'Senha', border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  userController.login(
                      context, nomeController.text, senhaController.text);
                },
                child: const Text('Login  '),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => Cadastro()),
                  );
                },
                child: const Text('Cadastro  '),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
