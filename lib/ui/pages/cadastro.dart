import 'package:flutter/material.dart';
import 'package:login_cadastro/controller/user_controller.dart';

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

            TextFormField(
              controller: nomeController,
              decoration: const InputDecoration(
                  hintText: 'Usuario', border: OutlineInputBorder()),
            ),

            const SizedBox(height: 8),
            TextFormField(
              controller: senhaController,
              obscureText: true,
              decoration: const InputDecoration(
                  hintText: 'Senha', border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed:() {
                if (nomeController.text.isNotEmpty && senhaController.text.isNotEmpty) {
                  userController.cadastrar(context, nomeController.text, senhaController.text);
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content:Text("Preencha todos os campos"),)
                  );
                }
              }, child: Text('Cadastrar'),)
            
          ],
        )
        );
  }
}
