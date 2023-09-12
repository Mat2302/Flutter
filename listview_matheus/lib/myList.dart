import 'package:flutter/material.dart';

class myList extends StatefulWidget {
  const myList({super.key});

  @override
  State<myList> createState() => _myListState();
}

class _myListState extends State<myList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exemplo Listview")),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (BuildContext context, index) => Divider(thickness: 4),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("Vôlei"),
            subtitle: Text("Rosamaria Montibeller"),
            leading: Icon(Icons.sports_volleyball),
            trailing: Text("+"),
          );
        },
      ),
    );
  }
}
