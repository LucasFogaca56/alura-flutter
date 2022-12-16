import 'package:curso/data/task_inherited.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key, required this.taskContext}) : super(key: key);

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value){
    if (value != null && value.isEmpty){
      return true;
    }
    return false;
  }

  bool difficultyValidator(String? value){
    if (value != null && value.isEmpty && (int.parse(value) < 0 || int.parse(value) > 5)){
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Nova Tarefa')
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Container(
                height: 650,
                width: 375,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 3)
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (String? value){
                          if (valueValidator(value)){
                            return 'Insira o nome da tarefa';
                          }

                          return null;
                        },
                        controller: nameController,
                        decoration: InputDecoration(
                          label: Text('Nome da tarefa'),
                          border: OutlineInputBorder(),
                          fillColor: Colors.white70,
                          filled: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value){
                          if (difficultyValidator(value)){
                            return 'Insira uma dificuldade entre 1 e 5';
                          }

                          return null;
                        },
                        controller: difficultyController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text('Dificuldade'),
                          border: OutlineInputBorder(),
                          fillColor: Colors.white70,
                          filled: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onChanged: (text){
                          setState(() {

                          });
                        },
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Insira um URL de imagem';
                          }
                          return null;
                        },
                        controller: imageController,
                        decoration: InputDecoration(
                          label: Text('Imagem'),
                          border: OutlineInputBorder(),
                          fillColor: Colors.white70,
                          filled: true,
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 72,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 2,
                          color: Colors.blue
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          imageController.text,
                          errorBuilder: (
                              BuildContext context,
                              Object exception,
                              StackTrace? stackTrace
                          ){
                            return Image.asset(
                                'assets/images/nophoto.png',
                              );
                          },
                          fit: BoxFit.cover,
                        )
                      ),
                    ),
                    ElevatedButton(
                        onPressed: (){
                          if (_formKey.currentState!.validate()){
                            TaskInherited.of(widget.taskContext).newTask(
                                nameController.text,
                                imageController.text,
                                int.parse(difficultyController.text)
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Tarefa criada com sucesso!')
                                )
                            );
                            Navigator.of(widget.taskContext).pushReplacementNamed('/');
                          }
                        },
                        child: Text('Adicionar'))
                  ],
                )
              ),
            ),
          ),
        ),
      ),
    );
  }
}
