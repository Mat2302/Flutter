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
  List<Aluno> listaBusca = [];
  String nomeBusca = "";

  @override
  void initState() {
    listaBusca = List.from(list);
    super.initState();
  }

  void atualizaLista(String nome) {
    listaBusca = List.from(list);
    setState(() {
      listaBusca = list
          .where((element) =>
              (element.nome.toLowerCase().contains(nome.toLowerCase())))
          .toList();
    });
  }

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
              SizedBox(width: 20),
              TextField(
                style: TextStyle(fontSize: 15),
                decoration: InputDecoration(
                    labelText: 'Nome',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search)),
                onChanged: (String nome) {
                  nomeBusca = nome;
                  atualizaLista(nomeBusca);
                },
              ),
              SizedBox(height: 20),
              ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => Divider(thickness: 2),
                itemCount: listaBusca.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      leading: CircleAvatar(
                        child: Text(listaBusca[index].nome[0]),
                      ),
                      title: Text(listaBusca[index].nome),
                      subtitle: Text(listaBusca[index].ra.toString()),
                      trailing: SizedBox(
                        width: 70,
                        child: Row(
                          children: [
                            Expanded(
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return MyAltera(
                                            listaBusca[index], index);
                                      }));
                                    },
                                    icon: Icon(Icons.edit))),
                            Expanded(
                                child: IconButton(
                                    onPressed: () {
                                      Aluno al = listaBusca[index];
                                      AlunoRepository.remover(al);
                                      atualizaLista(nomeBusca);
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
              SizedBox(height: 10),
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
