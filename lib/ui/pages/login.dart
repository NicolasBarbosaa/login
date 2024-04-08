import 'package:flutter/material.dart';
import 'package:login_cadastro/User/controller/user_controller.dart';
import 'package:login_cadastro/User/model/user_model.dart';
import 'package:login_cadastro/ui/pages/cadastro.dart';
import 'package:login_cadastro/ui/widgets/myAppBar.dart';


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
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
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
                hintText: 'Usuário',
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
            SizedBox(
              width: 1000,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  userController.login(
                      context, nomeController.text, senhaController.text);
                },
                 style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 103, 1),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ) 
                ),
                
                child: const Text('Login', style: TextStyle(fontWeight: FontWeight.bold),),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 1000,
              height: 50,
              child: ElevatedButton(
                
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => Cadastro()),
                          
                  );
                },
                style: ElevatedButton.styleFrom(
                  
                  backgroundColor: Colors.white,
                  foregroundColor: Color.fromARGB(255, 255, 103, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(width: 1.0, color: Color.fromARGB(255, 255, 103, 1))
                  )
                ),
                  
                child: const Text('Cadastro', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    );
  }
}