import 'package:exerciciolista/model/aluno_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'model/aluno.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  int ra = 0;
  String nome = '';
  AlunoRepository alRepo = AlunoRepository();
  TextEditingController campoRa = TextEditingController();
  TextEditingController campoNome = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/list');
            },
            icon: Icon(Icons.list),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(40)),
            SizedBox(child: Image.asset('img/cadeado.png'), height: 200),
            Padding(padding: EdgeInsets.all(10)),
            Text(
              'Cadastro',
              style: TextStyle(
                color: Colors.black,
                fontSize: 26,
              ),
            ),
            SizedBox(height: 50),
            Form(
              key: key,
              child: Column(
                children: [
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
                  )
                ],
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                if (key.currentState!.validate()) {
                  ra = int.parse(campoRa.text);
                  nome = campoNome.text;
                  Aluno al = Aluno(ra, nome);
                  alRepo.adc(al);
                  alRepo.imp();
                  setState(() {});
                }
              },
              child: Text("Cadastrar"),
            )
          ],
        ),
      ),
    );
  }
}
