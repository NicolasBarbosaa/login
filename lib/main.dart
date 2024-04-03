import 'package:flutter/material.dart';
import 'package:login_cadastro/ui/pages/HomePage.dart';
import 'package:login_cadastro/ui/pages/login.dart';
void  main() => runApp(MyApp());

class MyApp extends MaterialApp{
   MyApp({super.key}) : super(home: Login(), debugShowCheckedModeBanner: false );
}