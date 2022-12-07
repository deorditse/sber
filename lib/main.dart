import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sber/ui_layout/pages/subscription_check_page/adaptive_layout_subscription_check_page.dart';

import 'business_layout/lib/business_layout.dart';
import 'ui_layout/style_app/theme_app/material_theme/light_custom_theme_material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyGetAppSubscription());
}

class MyGetAppSubscription extends StatelessWidget {
  const MyGetAppSubscription({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeLight,
      initialRoute: AdaptiveLayoutSubscriptionCheckPage.id,
      getPages: [
        GetPage(
          name: AdaptiveLayoutSubscriptionCheckPage.id,
          page: () => AdaptiveLayoutSubscriptionCheckPage(),
          binding: BindingSubscriptionCheckPage(),
        ),
      ],
    );
  }
}
