import 'package:get/get.dart';

class ImplementControllerSubscriptionCheckPage extends GetxController {
  static final ImplementControllerSubscriptionCheckPage instance =
      Get.find<ImplementControllerSubscriptionCheckPage>();

  int indexBodyWidgetInListBody = 0;

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

  void _submitDocAndSignature() {
    if (isSignatureUploaded && isDocumentLoaded) {
      indexBodyWidgetInListBody = 1;
      update();
    }
  }
}
