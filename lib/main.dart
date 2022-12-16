import 'package:curso/data/task_inherited.dart';
import 'package:curso/screens/form_screen.dart';
import 'package:flutter/material.dart';

import 'screens/initial_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/form': (taskFormContext) => FormScreen(taskContext: context),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaskInherited(child: const InitialScreen()),
    );
  }
}
// Widget getStars(difficulty) {
//   int i = 1;
//   List list = [];
//   while (i <= 5) {
//     list[i] =
//         new Icon(
//             Icons.star,
//             color: (i <= difficulty ? Colors.blue : Colors.blue[100])
//         )
//     ;
//     i++;
//   }
//   return new Row(children: list);
// }


