import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyCadastro extends StatefulWidget {
  const MyCadastro({super.key});

  @override
  State<MyCadastro> createState() => _MyCadastroState();
}

class _MyCadastroState extends State<MyCadastro> {
  int ra = 0;
  String nome = "";
  TextEditingController campoRA = TextEditingController();
  TextEditingController campoNome = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 200),
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: campoRA,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                      labelText: 'RA',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 174, 208, 236),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("O RA não pode ser vazio");
                      } else if (int.parse(campoRA.text) < 10) {
                        return ("O RA deve ser maior que 10");
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 25),
                  TextFormField(
                      controller: campoNome,
                      style: TextStyle(fontSize: 15),
                      decoration: InputDecoration(
                          labelText: 'Nome',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Color.fromARGB(255, 174, 208, 236)),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("O nome não pode ser vazio");
                        } else if (campoNome.text.length < 5) {
                          return ("O nome precisa ter mais que 5 caracteres");
                        }
                        return null;
                      })
                ],
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  ra = int.parse(campoRA.text);
                  nome = campoNome.text;
                  mostrarMsg();
                  setState(() {});
                }
              },
              child: Text("Cadastrar"),
            ),
          ],
        ),
      ),
    );
  }

  void mostrarMsg() {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Aluno cadastrado com sucesso')));
  }
}
