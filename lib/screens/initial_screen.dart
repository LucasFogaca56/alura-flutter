import 'package:curso/components/task.dart';
import 'package:curso/data/task_inherited.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacity = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text(
          'Tarefas',
        ),
      ),
      body: ListView(
          children: TaskInherited.of(context).taskList,
        ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.of(context).pushNamed('/form');
          },
          child: const Icon(
              Icons.add
          )
      ),
    );
  }
}