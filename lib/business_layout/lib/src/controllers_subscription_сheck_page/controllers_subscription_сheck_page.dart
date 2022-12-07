import 'package:get/get.dart';

class ImplementControllerSubscriptionCheckPage extends GetxController {
  static final ImplementControllerSubscriptionCheckPage instance =
      Get.find<ImplementControllerSubscriptionCheckPage>();
  bool isDocumentLoaded = false;
  bool isSignatureUploaded = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void uploadDocument() {
    isDocumentLoaded = !isDocumentLoaded;
    update();
  }

  void uploadSignature() {
    isSignatureUploaded = !isSignatureUploaded;
    update();
  }
}
