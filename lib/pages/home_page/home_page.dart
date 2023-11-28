import 'package:flutter/material.dart';
import 'package:tdd_flutter/data/task_data.dart';

import '../../model/task_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<TaskModel>  tasks = TaskData.listTasks;
  TextEditingController taskNameController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text(tasks[index].name,style: TextStyle(color: Colors.black),),
                  );
                }),
          ),
          Form(
            key: _key,
            child: TextFormField(
              controller: taskNameController,
              validator: (value){
                if(value?.isEmpty ?? true){
                  return "Esse carmpo precisa ser preenchido";
                }
              },
            ),
          ),
          ElevatedButton(onPressed: (){
            if(!_key.currentState!.validate()){
              return;
            }
            setState(() {
              tasks.add(TaskModel(name: taskNameController.text, check: false));
            });
            var snackBar = SnackBar(content: Text('Sua Tarefa ${taskNameController.text} foi criada com sucesso'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            taskNameController.clear();
          }, child: Text("Criar Tarefa"))
        ],
      ),
    );
  }
}
