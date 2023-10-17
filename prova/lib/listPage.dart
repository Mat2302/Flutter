import 'package:flutter/material.dart';

class MyList extends StatefulWidget {
  const MyList({super.key});

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  String taskDois = "";
  List listTask = [];
  TextEditingController campoTask = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lista de Tarefas"),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              SizedBox(height: 15),
              Form(
                key: key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: campoTask,
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                          labelText: 'Tarefa',
                          border: InputBorder.none,
                          filled: false),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("O campo deve ser preenchido!");
                        }
                      },
                    ),
                    SizedBox(height: 12),
                    ElevatedButton(
                        onPressed: () {
                          if (key.currentState!.validate()) {
                            taskDois = campoTask.text;
                            listTask.add(campoTask.text);

                            /* for (var taskTres in listTask) {
                              print(listTask);
                            } */
                            setState(() {
                              campoTask.clear();
                            });
                          }
                        },
                        child: Text("Adicionar"))
                  ],
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(thickness: 2),
                  itemCount: listTask.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(Icons.dashboard_customize),
                      title: Text(listTask[index]),
                      trailing: Icon(Icons.check_box_outline_blank),
                    );
                  },
                ),
              ),
              SizedBox(height: 200),
              ElevatedButton(
                  onPressed: () {
                    listTask.clear();
                    setState(() {});
                  },
                  child: Text("Limpar lista"))
            ]),
          ),
        ));
  }
}
