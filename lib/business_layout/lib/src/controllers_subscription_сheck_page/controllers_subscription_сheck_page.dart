import 'package:get/get.dart';

class ImplementControllerSubscriptionCheckPage extends GetxController {
  static final ImplementControllerSubscriptionCheckPage instance =
      Get.find<ImplementControllerSubscriptionCheckPage>();

  ///индекс для навигации между окнами
  int indexBodyWidgetInListBody = 0;

  void changeIndexBodyWidgetInListBody({int goIndexBody = 0}) {
    indexBodyWidgetInListBody = goIndexBody;
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
  void submitDocAndSignature() {
    if (isSignatureUploaded && isDocumentLoaded) {
      indexBodyWidgetInListBody = 1;
      update();
    } else {
      Get.snackbar('', 'Не все данные прикреплены');
    }
  }
}
