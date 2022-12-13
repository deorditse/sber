import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:business_layout/business_layout.dart';
import 'package:sber/ui_layout/pages/subscription_check_page/all_implementation_container_alert/checking_an_e-subscription/checking_an_e-subscription_body.dart';
import 'package:sber/ui_layout/pages/subscription_check_page/subscription_check_page.dart';

void main() {
  testWidgets('Проверка подписи', (WidgetTester tester) async {
    Get.put(ImplementControllerSubscriptionCheckPage());
    await tester.pumpWidget(
      MaterialApp(
        home: SubscriptionCheckPage(),
      ),
    );

    ///для контейнера Проверка электронной подписи
    //1 нужно убедиться что поля есть на экране
    expect(find.text('Проверка электронной подписи'), findsOneWidget);
    expect(find.text('Загрузите документ'), findsOneWidget);
    expect(find.text('Загрузите подпись'), findsOneWidget);

    await tester.tap(find.text('Загрузите документ'));
    await tester.tap(find.text('Загрузите подпись'));
    await tester.pump(); //обнавляет значение стейта
    expect(find.text('Проверить подпись'), findsOneWidget);
    await tester.pump(); //обнавляет значение стейта
  });
}
