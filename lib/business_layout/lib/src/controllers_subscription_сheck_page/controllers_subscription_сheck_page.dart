import 'package:get/get.dart';

class ImplementControllerSubscriptionCheckPage extends GetxController {
  final ImplementControllerSubscriptionCheckPage instance = Get.find();
  bool isDocumentLoaded = false;
  bool isSignatureUploaded = false;

  void uploadDocument() {
    isDocumentLoaded = true;
    update();
  }

  void uploadSignature() {
    isSignatureUploaded = true;
    update();
  }
}
