import 'package:flutter/material.dart';
import 'package:login_cadastro/Study/controller/StudyController.dart';
import 'package:login_cadastro/Study/database/Study_database.dart';
import 'package:login_cadastro/Study/model/StudyModel.dart';
import 'package:login_cadastro/User/controller/user_controller.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final valor = TextEditingController();
  final isValidade = GlobalKey<FormState>();

  StudyController studyController = StudyController();
  StudyDatabase studyDatabase = StudyDatabase();
  String novoItem = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lista de Estudos',
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Form(
                  key: isValidade,
                  child: TextFormField(
                    controller: valor,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Não pode estar vazio';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Digite um item',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 30,
                  margin: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () {
                      if (isValidade.currentState!.validate()) {
                        setState(() {
                          studyController.addStudy(valor);

                        });
                      }
                    },
                    child: const Text('Adicionar Item'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: StudyDatabase.studies.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text(
                            StudyDatabase.studies[index].topic,
                            style: StudyDatabase.checkboxStates[index]
                                ? const TextStyle(
                                    decoration: TextDecoration.lineThrough)
                                : null,
                          ),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Edição de item'),
                                content: TextFormField(
                                  initialValue: StudyDatabase.studies[index].topic,
                                  decoration: const InputDecoration(
                                    labelText: 'Novo item',
                                  ),
                                  onChanged: (value) {
                                    novoItem = value; // Atualiza o novo item quando o texto é alterado
                                  },
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        studyController.editStudy(index, novoItem);
                                      });
                                    },
                                    child: Text('Salvar'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(); // Fecha o diálogo sem salvar
                                    },
                                    child: Text('Cancelar'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                      const Spacer(),
                      Checkbox(
                          value: StudyDatabase.checkboxStates[index], // Usa o estado correto
                          onChanged: (bool? newValue) {
                            setState(() {
                              StudyDatabase.checkboxStates[index] = newValue!; // Atualiza o estado do checkbox
                            });
                          }),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.delete_outlined),
                        onPressed: () {
                          setState(() {
                            studyController.removeStudy(index);
                          });
                        },
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
