import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sber/ui_layout/pages/subscription_check_page/adaptive_layout_subscription_check_page.dart';

import 'package:style_app/style_app.dart';

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
      defaultGlobalState: false,
      initialRoute: AdaptiveLayoutSubscriptionCheckPage.id,
      onInit: () async {
        // ImplementAuthController.instance.initMainDataApp();
      },
      getPages: [
        GetPage(
          name: AdaptiveLayoutSubscriptionCheckPage.id,
          page: () => AdaptiveLayoutSubscriptionCheckPage(),
          // binding: AuthBinding(),
        ),
      ],
    );
  }
}
