import 'package:file_picker/file_picker.dart';
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

  ///документ
  PlatformFile? document;

  Future<void> uploadDocument() async {
    if (document != null) {
      document = null;
      update();
      return;
    } else {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        document = result.files.first;
        update();
      }
    }
  }

  ///Подпись
  PlatformFile? signature;

  Future<void> uploadSignature() async {
    if (signature != null) {
      signature = null;
      update();
      return;
    } else {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['sig'],
      );

      if (result != null) {
        signature = result.files.first;
        update();
      }
    }
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
    if (document != null && signature != null) {
      indexBodyWidgetInListBody.value = 1;

      ///ToDo: Api
    } else {
      Get.snackbar('', 'Не все документы прикреплены');
    }
  }
}
