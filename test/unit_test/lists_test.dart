import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_flutter/data/task_data.dart';
import 'package:tdd_flutter/model/task_model.dart';

void main (){
  group("Teste tarefas", () {

    /*Esse é um app de lista de tarefas, pode ser simples, tendo somente
    * o nome do item, e se foi feito o check sim ou não, aos poucos podemos
    * aumentar um pouco mais, e adicionar novas features */

    testWidgets("Criar tarefa", (widgetTester) async {
      //Cria uma nova instância de uma task
      TaskModel newTask = TaskModel(
        name: "Arrumar Cama",
        check: false,
      );

      //Adciona uma task a data de tasks
      TaskData.listTasks.add(newTask);


      //Verificações e validações
      expect(TaskData.listTasks, contains(newTask));
      expect(TaskData.listTasks[0].name, "Arrumar Cama");
      expect(TaskData.listTasks[0].check,  false);

    });

    testWidgets("Editar tarefa", (widgetTester) async {
      //Cria uma nova instância de uma task
      TaskModel newTask = TaskModel(
        name: "Arrumar Cama",
        check: false,
      );

      TaskData.listTasks[0] = TaskModel(name: TaskData.listTasks[0].name, check: true);

      //Verificações e validações
      expect(TaskData.listTasks[0].name, "Arrumar Cama");
      expect(TaskData.listTasks[0].check,  true);

    });

    testWidgets("Deletar Tarefa", (widgetTester) async {
      //Cria uma nova instância de uma task

      TaskData.listTasks.removeAt(0);

      //Lista de Tarefas

      //Verificações e validações
      expect(TaskData.listTasks.length, 0);

    });

  });
}