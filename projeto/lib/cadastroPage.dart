import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:projeto/model/jogadora.dart';
import 'package:projeto/model/jogadora_repository.dart';

class MyCadastro extends StatefulWidget {
  const MyCadastro({super.key});

  @override
  State<MyCadastro> createState() => _MyCadastroState();
}

class _MyCadastroState extends State<MyCadastro> {
  int cod = 0;
  String nome = "";
  String posicao = "";
  JogadoraRepository jgrRepo = JogadoraRepository();
  TextEditingController campoCod = TextEditingController();
  TextEditingController campoNome = TextEditingController();
  TextEditingController campoPosicao = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/consulta');
              },
              icon: Icon(Icons.list))
        ],
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            Container(
              height: 400,
              width: 300,
              padding: EdgeInsets.only(left: 12, right: 12, bottom: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 5)
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Minas Tênis Clube - Cadastro",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 15),
                  Form(
                    key: key,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: campoCod,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          style: TextStyle(fontSize: 15),
                          decoration: InputDecoration(
                              labelText: 'Código:',
                              border: InputBorder.none,
                              filled: false),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("O campo deve ser preenchido!");
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 12),
                        TextFormField(
                          controller: campoNome,
                          style: TextStyle(fontSize: 15),
                          decoration: InputDecoration(
                              labelText: 'Nome:',
                              border: InputBorder.none,
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
                        SizedBox(height: 12),
                        TextFormField(
                          controller: campoPosicao,
                          style: TextStyle(fontSize: 15),
                          decoration: InputDecoration(
                              labelText: 'Posição:',
                              border: InputBorder.none,
                              filled: false),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("O campo deve ser preenchido!");
                            } else if (campoPosicao.text.length < 3) {
                              return ("A posição deve possuir mais de 3 caracteres");
                            }
                            return null;
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                      onPressed: () {
                        if (key.currentState!.validate()) {
                          cod = int.parse(campoCod.text);
                          nome = campoNome.text;
                          posicao = campoPosicao.text;
                          Jogadora jgr = Jogadora(cod, nome, posicao);
                          jgrRepo.adiciona(jgr);
                          jgrRepo.imprimir();
                          setState(() {
                            campoCod.clear();
                            campoNome.clear();
                            campoPosicao.clear();
                          });
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Atenção"),
                                  content:
                                      Text("Cadastro efetuado com sucesso!"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Fechar"))
                                  ],
                                );
                              });
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xFFDDE3ED)),
                          overlayColor:
                              MaterialStateProperty.all<Color>(Colors.grey)),
                      child: Text("Cadastrar"))
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
