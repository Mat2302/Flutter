import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:projeto/alteraPage.dart';
import 'package:projeto/model/jogadora_repository.dart';
import 'package:projeto/model/jogadora.dart';

class MyConsulta extends StatefulWidget {
  const MyConsulta({super.key});

  @override
  State<MyConsulta> createState() => _MyConsultaState();
}

class _MyConsultaState extends State<MyConsulta> {
  List<Jogadora> list = JogadoraRepository.get;
  List<Jogadora> listaBusca = [];
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
        title: Text("Consulta"),
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            icon: Icon(Icons.arrow_back)),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 5),
          TextField(
            style: TextStyle(fontSize: 15),
            decoration: InputDecoration(
                labelText: 'Nome',
                border: InputBorder.none,
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
                title: Text(listaBusca[index].cod.toString()),
                subtitle: Text(
                    '${listaBusca[index].nome} - ${listaBusca[index].posicao} - ${listaBusca[index].idade} anos'),
                trailing: SizedBox(
                  width: 70,
                  child: Row(
                    children: [
                      Expanded(
                          child: IconButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return MyAltera(listaBusca[index], index);
                                }));
                              },
                              icon: Icon(Icons.edit))),
                      Expanded(
                          child: IconButton(
                              onPressed: () {
                                Jogadora jgr = listaBusca[index];
                                JogadoraRepository.remover(jgr);
                                atualizaLista(nomeBusca);
                                setState(() {});
                              },
                              icon: Icon(Icons.delete))),
                    ],
                  ),
                ),
              );
            },
            padding: EdgeInsets.all(7),
          ),
          Divider(thickness: 2),
        ]),
      ),
    );
  }
}
