import 'package:get/get.dart';

class ImplementControllerSubscriptionCheckPage extends GetxController {
  static final ImplementControllerSubscriptionCheckPage instance =
      Get.find<ImplementControllerSubscriptionCheckPage>();

  ///индекс для навигации между окнами
  int indexBodyWidgetInListBody = 0;

  void changeIndexBodyWidgetInListBody({int goIndexBody = 0}) {
    indexBodyWidgetInListBody = goIndexBody;
    isValidateSignature = false;
    update();
  }

  bool isDocumentLoaded = false;
  bool isSignatureUploaded = false;

  void uploadDocument() {
    isDocumentLoaded = !isDocumentLoaded;
    update();
  }

  void uploadSignature() {
    isSignatureUploaded = !isSignatureUploaded;
    update();
  }

  ///отправка данных на сервер
  Future<void> submitDocAndSignature() async {
    if (isSignatureUploaded && isDocumentLoaded) {
      indexBodyWidgetInListBody = 1;
      update();

      await Future.delayed(Duration(seconds: 3)).then((value) {
        isValidateSignature = true;
        update();
      });
    } else {
      Get.snackbar('', 'Не все данные прикреплены');
    }
  }

  ///проверка подписи
  bool isValidateSignature = false;

}
