import 'package:flutter/material.dart';
import 'package:sber/ui_layout/style_app/text_style.dart';

class NarrowLayoutSubscriptionCheckPage extends StatelessWidget {
  const NarrowLayoutSubscriptionCheckPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        'NarrowLayoutSubscriptionCheckPage',
        style: myTextStyleFontS8Sans(context: context),
      ),
    );
  }
}
