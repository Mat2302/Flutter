import 'package:exerciciolista/model/aluno.dart';
import 'package:exerciciolista/model/aluno_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class MyAltera extends StatefulWidget {
  Aluno aluno;
  int indice;
  MyAltera(this.aluno, this.indice, {super.key});

  @override
  State<MyAltera> createState() => _MyAlteraState();
}

class _MyAlteraState extends State<MyAltera> {
  TextEditingController campoRa = TextEditingController();
  TextEditingController campoNome = TextEditingController();
  List list = AlunoRepository.get;
  GlobalKey<FormState> key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    inicializa();
    return Scaffold(
        appBar: AppBar(
          title: Text("Alterar dados do aluno"),
        ),
        body: Column(
          children: [
            Form(
              key: key,
              child: Column(
                children: [
                  SizedBox(height: 10),
                  TextFormField(
                    controller: campoRa,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                      labelText: 'RA',
                      border: OutlineInputBorder(),
                      filled: false,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("O campo deve ser preenchido!");
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: campoNome,
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                        labelText: 'Nome',
                        border: OutlineInputBorder(),
                        filled: false),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("O campo deve ser preenchido!");
                      } else if (campoNome.text.length < 3) {
                        return ("O nome deve possuir mais de 3 caracteres");
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (key.currentState!.validate()) {
                        int ra = int.parse(campoRa.text);
                        String nome = campoNome.text;
                        Aluno a = new Aluno(ra, nome);
                        list[widget.indice] = a;
                      }
                    },
                    child: Text("Alterar"),
                  )
                ],
              ),
            ),
          ],
        ));
  }

  void inicializa() {
    campoRa.text = widget.aluno.ra.toString();
    campoNome.text = widget.aluno.nome;
  }
}
