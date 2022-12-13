// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'package:get/get.dart';
import 'package:business_layout/business_layout.dart';

//проявляют взаимодействие между двумя или более модулями кода
//можно проверить взаимодействие с апи или базами данных
//следующий шаг после юнить тестов
//для подключения интеграционных зависимостей нужно добавить в pubsbeg зависимости
//затем нужно создать отдельную папку

//для запуска интеграционного теста команда
// flutter drive --target=test_driver/app.dart
void main() {
  Get.put(ImplementControllerSubscriptionCheckPage());

  ///CheckingAnESubscriptionBody form tests
  group('CheckingAnESubscriptionBody form tests', () {
    late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() {
      driver.close();
    });

    ///для контейнера Проверка электронной подписи

    final fieldFinderDocument = find.text('Загрузите документ');
    final fieldFinderSubscription = find.text('Загрузите подпись');
    final fieldFinderInput = find.text('Проверить подпись');

    test('Test name Document', () async {
      await driver.tap(fieldFinderDocument);
      await driver.waitFor(find.text(''));
      await driver.getText(find.text('test.pdf'));
      await driver.waitFor(find.text('test.pdf'));
    });

    test('Test name Subscription', () async {
      await driver.tap(fieldFinderSubscription);
      await driver.waitFor(find.text(''));
      await driver.getText(find.text('test.sig'));
      await driver.waitFor(find.text('test.sig'));
    });

    test('Проверить подпись', () async {
      await driver.tap(fieldFinderInput);
    });
  });
}
