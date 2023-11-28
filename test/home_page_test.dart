import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_flutter/data/task_data.dart';
import 'package:tdd_flutter/pages/home_page/home_page.dart';

void main() {
  testWidgets('HomePage UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: HomePage(),
    ));

    // Verifique se o título está sendo exibido corretamente na AppBar.
    expect(find.text('Lista de Tarefas'), findsOneWidget);

    // Verifique se a lista de tarefas está sendo exibida corretamente.
    expect(find.byType(ListTile), findsNWidgets( TaskData.listTasks.length));

    // Digite texto no campo de texto.
    await tester.enterText(find.byType(TextFormField), 'Nova Tarefa');



    // Pressione o botão e aguarde a reconstrução do widget.
    await tester.tap(find.text('Criar Tarefa'));
    await tester.pump();


    // Verifique se a nova tarefa foi adicionada à lista.
    expect(find.text('Nova Tarefa'), findsOneWidget);

    expect(find.text('Sua Tarefa Nova Tarefa foi criada com sucesso'), findsOneWidget);

  });
}