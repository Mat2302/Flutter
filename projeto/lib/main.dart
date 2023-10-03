import 'package:flutter/material.dart';
import 'package:projeto/cadastroPage.dart';
import 'package:projeto/consultaPage.dart';
import 'package:projeto/startPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      routes: {
        '/':(context) => MyStart(),
        '/cadastro':(context) => MyCadastro(),
        '/consulta':(context) => MyConsulta()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}