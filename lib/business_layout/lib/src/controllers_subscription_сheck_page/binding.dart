import 'package:business_layout/business_layout.dart';
import 'package:get/get.dart';

class BindingSubscriptionCheckPage extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ImplementControllerSubscriptionCheckPage(), fenix: true);
  }
}
