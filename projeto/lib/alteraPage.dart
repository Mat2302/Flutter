import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:projeto/model/jogadora.dart';
import 'package:projeto/model/jogadora_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyAltera extends StatefulWidget {
  Jogadora jogadora;
  int indice;
  MyAltera(this.jogadora, this.indice, {super.key});

  @override
  State<MyAltera> createState() => _MyAlteraState();
}

class _MyAlteraState extends State<MyAltera> {
  TextEditingController campoCod = TextEditingController();
  TextEditingController campoNome = TextEditingController();
  TextEditingController campoPosicao = TextEditingController();
  List list = JogadoraRepository.get;
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    inicializa();
    return Scaffold(
        appBar: AppBar(
          title: Text("Altera"),
          leading: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/consulta');
              },
              icon: Icon(Icons.arrow_back)),
          automaticallyImplyLeading: false,
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
                          blurRadius: 5,
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Minas Tênis Clube - Alteração",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 15),
                        Form(
                          key: key,
                          child: Column(
                            children: [
                              SizedBox(height: 10),
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
                                  filled: false,
                                ),
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
                                  filled: false,
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return ("O campo deve ser preenchido!");
                                  } else if (campoNome.text.length < 3) {
                                    return ("O campo deve possuir mais de 3 caracteres");
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 12),
                              TextFormField(
                                controller: campoPosicao,
                                style: TextStyle(fontSize: 15),
                                decoration: InputDecoration(
                                  labelText: 'Posição',
                                  border: InputBorder.none,
                                  filled: false,
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return ("O campo deve ser preenchido!");
                                  } else if (campoPosicao.text.length < 3) {
                                    return ("O campo deve possuir mais de 3 caracteres");
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 20),
                              ElevatedButton(
                                  onPressed: () {
                                    if (key.currentState!.validate()) {
                                      int cod = int.parse(campoCod.text);
                                      String nome = campoNome.text;
                                      String posicao = campoPosicao.text;
                                      Jogadora jgr =
                                          new Jogadora(cod, nome, posicao);
                                      list[widget.indice] = jgr;
                                    }
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color(0xFFDDE3ED)),
                                      overlayColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.grey)),
                                  child: Text("Alterar"))
                            ],
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ));
  }

  void inicializa() {
    campoCod.text = widget.jogadora.cod.toString();
    campoNome.text = widget.jogadora.nome;
    campoPosicao.text = widget.jogadora.posicao;
  }
}
