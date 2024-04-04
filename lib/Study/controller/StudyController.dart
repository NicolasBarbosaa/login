// import 'package:flutter/material.dart';
// import 'package:login_cadastro/Study/database/Study_database.dart';
// import 'package:login_cadastro/Study/model/StudyModel.dart';


// class StudyController{
//   StudyDatabase studyDatabase = StudyDatabase();
//   StudyModel studyModel = StudyModel();

//    static void removeItem(value) => {
//         setState(() {
//           studyDatabase.Study.removeAt(value);
//         })
//       };

//   static void addItem(value) {
//     setState(() {
//       studyDatabase.Study.add({"topic": value, "isDone": false});
//       studyDatabase.checkboxStates.add(false); // Adiciona o estado do checkbox
//       valor.clear(); // Limpa o que foi digitado
//     });
//   }

//   static void editItem(int index, String name){
//     setState(() {
//     studyDatabase.Study.setAll(index, [
//       {
//         "name": name
//       }
//     ]);   
//     });
//   }

// }

//chat

import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:login_cadastro/Study/database/Study_database.dart';
import 'package:login_cadastro/Study/model/StudyModel.dart';

 // Importa o modelo de objeto

class StudyController {
  StudyDatabase studyDatabase = StudyDatabase();
  // Funções de manipulação dos estudos

  void addStudy(TextEditingController topicController) {
    StudyDatabase.studies.add(StudyModel(topic: topicController.text, isDone: false));
    StudyDatabase.checkboxStates.add(false);
    topicController.clear();
  }

  void removeStudy(int index) {
    StudyDatabase.studies.removeAt(index);
  }

  void editStudy(int index, String newTopic) {
    StudyDatabase.studies[index].topic = newTopic;
  }
}