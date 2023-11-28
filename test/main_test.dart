import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_flutter/main.dart';
import 'package:tdd_flutter/pages/home_page/home_page.dart';

void main() {

  group("Testes com o Material Principal", (){

    testWidgets('Parâmetros do Material App', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      MaterialApp appWidget = tester.widget(find.byType(MaterialApp));
      expect(appWidget.debugShowCheckedModeBanner, false);
      expect(appWidget.title, "FastList");

    });
  });

}