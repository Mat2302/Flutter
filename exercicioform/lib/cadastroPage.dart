import 'package:exercicioform/model/aluno_repository.dart';
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
  String senha = '';
  AlunoRepository alRepo = AlunoRepository();
  TextEditingController campoRa = TextEditingController();
  TextEditingController campoSenha = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(40)),
            SizedBox(child: Image.asset('img/cadeado.png'), height: 200),
            Padding(padding: EdgeInsets.all(10)),
            Text(
              'Login',
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
                    controller: campoSenha,
                    obscureText: true,
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                        labelText: 'Senha',
                        border: OutlineInputBorder(),
                        filled: false),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("O campo deve ser preenchido!");
                      } else if (campoSenha.text.length < 3) {
                        return ("A senha deve possuir mais de 3 caracteres");
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
                  senha = campoSenha.text;
                  alRepo.verificaAluno(ra, senha);
                  setState(() {});
                }
              },
              child: Text("Entrar"),
            )
          ],
        ),
      ),
    );
  }
}
