import 'package:get/get.dart';
import 'package:models/models.dart';

class ImplementControllerSubscriptionCheckPage extends GetxController {
  static final ImplementControllerSubscriptionCheckPage instance =
      Get.find<ImplementControllerSubscriptionCheckPage>();

  ///индекс для навигации между окнами
  int indexBodyWidgetInListBody = 0;

  void changeIndexBodyWidgetInListBody({int goIndexBody = 0}) {
    indexBodyWidgetInListBody = goIndexBody;
    responseStatusAndDataSignatureVerification = {};
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

  ///проверка подписи отправка данных на сервер
  //responseStatus и модель с полученными данными
  Map<String?, SignatureVerificationModel?>
      responseStatusAndDataSignatureVerification = {};

  Future<void> sendDocumentAndSignatureForVerification() async {
    if (isSignatureUploaded && isDocumentLoaded) {
      indexBodyWidgetInListBody = 1;
      update();

      await Future.delayed(Duration(seconds: 5)).whenComplete(
        () {
          // responseStatusAndDataSignatureVerification = {'200': 'test'};
          update();
        },
      );
    } else {
      Get.snackbar('', 'Не все данные прикреплены');
    }
  }
}
