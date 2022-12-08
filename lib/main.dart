import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sber/ui_layout/pages/subscription_check_page/subscription_check_page.dart';
import 'package:business_layout/business_layout.dart';
import 'ui_layout/style_app/theme_app/material_theme/light_custom_theme_material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

//flutter build web
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //for future
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyGetAppSubscription());
}

class MyGetAppSubscription extends StatelessWidget {
  const MyGetAppSubscription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: SubscriptionCheckPage.id,
      debugShowCheckedModeBanner: false,
      initialBinding: BindingSubscriptionCheckPage(),
      theme: themeLight,
      home: SubscriptionCheckPage(),
      // getPages: [
      //   GetPage(
      //     name: SubscriptionCheckPage.id,
      //     page: () => SubscriptionCheckPage(),
      //   ),
      // ],
    );
  }
}
