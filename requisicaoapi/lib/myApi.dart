// ignore_for_file: unused_field, file_names, avoid_print, unnecessary_this, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyApi extends StatefulWidget {
  const MyApi({super.key});

  @override
  State<MyApi> createState() => _MyApiState();
}

class Task {
  int _userId = 0;
  int _taskId = 0;
  String _title = "";
  bool _completed = false;

  get userId => this._userId;

  set userId(value) => this._userId = value;

  get taskId => this._taskId;

  set taskId(value) => this._taskId = value;

  get title => this._title;

  set title(value) => this._title = value;

  get completed => this._completed;

  set completed(value) => this._completed = value;

  Task();

  Task.fromJson(Map<String, dynamic> json)
      : _userId = json['userId'],
        _taskId = json['id'],
        _title = json['title'],
        _completed = json['completed'];
}

class TaskRepository {
  List<Task> _listTask = [];

  TaskRepository();

  List<Task> get listTask => this._listTask;

  set listTask(List<Task> value) => this._listTask = value;
}

class _MyApiState extends State<MyApi> {
  int userId = 0;
  int taskId = 0;
  String title = "";
  bool completed = false;
  Task myTask = Task();
  TaskRepository taskRepository = TaskRepository();

  Future<void> obtainAllTasks() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/todos');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // API Requisitada com sucesso
      final data = response.body;
      List listTask = jsonDecode(data) as List;
      taskRepository.listTask =
          listTask.map((listTask) => Task.fromJson(listTask)).toList();
      for (var element in taskRepository.listTask) {
        print(element.title);
      }
      setState(() {});
    } else {
      // API Requisitada com falha
      print('Requisição interrompida por erro: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Requisição API"),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 16),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  obtainAllTasks();
                },
                child: Text("Search all tasks")),
            SizedBox(height: 30),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => Divider(thickness: 2),
                itemCount: taskRepository.listTask.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading:
                        Text(taskRepository.listTask[index].taskId.toString()),
                    title: Text(taskRepository.listTask[index].title),
                    subtitle: Text(taskRepository.listTask[index].userId.toString()),
                    trailing: Text(
                        taskRepository.listTask[index].completed.toString()),
                  );
                },
                padding: EdgeInsets.all(7),
              ),
            )
          ],
        ),
      ),
    );
  }
}
