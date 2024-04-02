import 'package:flutter/material.dart';
import 'package:login_cadastro/controller/user_controller.dart';
import 'package:login_cadastro/ui/pages/cadastro.dart';
import 'package:login_cadastro/ui/widgets/myAppBar.dart';

import '../../model/user_model.dart';

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
      backgroundColor: Color.fromARGB(50, 252, 236, 221),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            Container(
              width: 300,
              height: 300,
              child: Image.asset('assets/NikoStudie.png'),
            ),
           
            TextFormField(
              controller: nomeController,
              decoration: const InputDecoration(
                hintText: 'Usuario',
                border: OutlineInputBorder(
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: senhaController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Senha',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    userController.login(
                        context, nomeController.text, senhaController.text);
                  },
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 103, 1),
                  foregroundColor: Color.fromARGB(255, 43, 43, 43),
                  ),
                  
                  child: const Text('Login'),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => Cadastro()),

                      );
                    },
                     style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 255, 103, 1),
                        foregroundColor: Color.fromARGB(255, 43, 43, 43),
                      ),
                    child: const Text('Cadastro'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
