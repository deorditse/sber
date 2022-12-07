import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sber/ui_layout/pages/subscription_check_page/adaptive_layout_subscription_check_page.dart';
import 'package:business_layout/business_layout.dart';
import 'package:sber/ui_layout/pages/subscription_check_page/adaptive_layout_subscription_check_page/narrow_layout_subscription_check_page/narrow_layout_subscription_check_page.dart';
import 'ui_layout/pages/subscription_check_page/adaptive_layout_subscription_check_page/wide_layout_subscription_check_page/wide_layout_subscription_check_page.dart';
import 'ui_layout/style_app/theme_app/material_theme/light_custom_theme_material.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyGetAppSubscription());
}

class MyGetAppSubscription extends StatelessWidget {
  const MyGetAppSubscription({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      key: key,
      initialRoute: AdaptiveLayoutSubscriptionCheckPage.id,
      debugShowCheckedModeBanner: false,
      theme: themeLight,
      getPages: [
        GetPage(
          name: AdaptiveLayoutSubscriptionCheckPage.id,
          page: () => AdaptiveLayoutSubscriptionCheckPage(),
          // binding: BindingSubscriptionCheckPage(),
        ),
      ],
    );
  }
}
