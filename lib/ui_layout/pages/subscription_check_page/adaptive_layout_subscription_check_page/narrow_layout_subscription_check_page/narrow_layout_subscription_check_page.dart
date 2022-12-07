import 'package:flutter/material.dart';
import 'package:sber/ui_layout/style_app/text_style.dart';
import 'package:sber/ui_layout/widgets_for_all_pages/app_bar.dart';

class NarrowLayoutSubscriptionCheckPage extends StatelessWidget {
  const NarrowLayoutSubscriptionCheckPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(
        context: context,
        deleteFIO: true,
      ),
      body: Text(
        'NarrowLayoutSubscriptionCheckPage',
        style: myTextStyleFontS8Sans(context: context),
      ),
    );
  }
}
