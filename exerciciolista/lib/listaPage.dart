import 'package:exerciciolista/alteraPage.dart';
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
        appBar: AppBar(
          actions: [],
          title: Text("Lista de Alunos"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => Divider(thickness: 2),
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      leading: CircleAvatar(
                        child: Text(list[index].nome[0]),
                      ),
                      title: Text(list[index].nome),
                      subtitle: Text(list[index].ra.toString()),
                      trailing: SizedBox(
                        width: 70,
                        child: Row(
                          children: [
                            Expanded(
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                        return MyAltera(list[index], index);
                                      })
                                      );
                                    }, icon: Icon(Icons.edit))),
                            Expanded(
                                child: IconButton(
                                    onPressed: () {
                                      Aluno al = list[index];
                                      AlunoRepository.remover(al);
                                      setState(() {});
                                    },
                                    icon: Icon(Icons.delete))),
                          ],
                        ),
                      ));
                },
                padding: EdgeInsets.all(7),
              ),
              Divider(thickness: 2),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: Text("Voltar"),
              )
            ],
          ),
        ));
  }
}
