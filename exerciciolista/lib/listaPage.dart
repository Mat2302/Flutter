import 'package:exerciciolista/model/aluno.dart';
import 'package:exerciciolista/model/aluno_repository.dart';
import 'package:flutter/material.dart';

class MyLista extends StatefulWidget {
  const MyLista({super.key});

  @override
  State<MyLista> createState() => _MyListaState();
}

class _MyListaState extends State<MyLista> {
  List<Aluno> list = AlunoRepository.get;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: []),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text(list[index].nome[0]),
            ),
            title: Text(list[index].nome),
            subtitle: Text(list[index].ra.toString()),
          );
        },
        separatorBuilder: (_, __) => Divider(
          thickness: 2,
        ),
        itemCount: list.length,
      )
    );
  }
}