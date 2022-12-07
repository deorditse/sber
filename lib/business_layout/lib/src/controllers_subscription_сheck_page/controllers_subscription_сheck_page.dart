import 'package:get/get.dart';
import 'package:models/models.dart';

class ImplementControllerSubscriptionCheckPage extends GetxController {
  static final ImplementControllerSubscriptionCheckPage instance =
      Get.find<ImplementControllerSubscriptionCheckPage>();

  ///индекс для навигации между окнами
  Rx<int> indexBodyWidgetInListBody = 0.obs;

  void changeIndexBodyWidgetInListBody({int goIndexBody = 0}) {
    indexBodyWidgetInListBody.value = goIndexBody;
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

  String? responseStatus;
  SignatureVerificationModel? signatureVerification;

  //delete
  changeResponseStatusAndDataSignatureVerificationFORTEST({
    required String? newResponseStatus,
    required SignatureVerificationModel? newSignatureVerification,
  }) {
    Future.delayed(Duration(seconds: 5)).whenComplete(() {
      responseStatus = newResponseStatus;
      signatureVerification = newSignatureVerification;
      update();
    });
  }

  Future<void> sendDocumentAndSignatureForVerification() async {
    responseStatus = null;
    signatureVerification = null;
    update();
    if (isSignatureUploaded && isDocumentLoaded) {
      indexBodyWidgetInListBody.value = 1;
    } else {
      Get.snackbar('', 'Не все данные прикреплены');
    }
  }
}
