import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sber/ui_layout/widgets_for_all_pages/adaptive_response/adaptive_widget.dart';
import 'adaptive_layout_subscription_check_page/narrow_layout_subscription_check_page/narrow_layout_subscription_check_page.dart';
import 'adaptive_layout_subscription_check_page/wide_layout_subscription_check_page/wide_layout_subscription_check_page.dart';

class AdaptiveLayoutSubscriptionCheckPage extends StatelessWidget {
  static const String id = '/SubscriptionCheck';

  const AdaptiveLayoutSubscriptionCheckPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///адаптивность в зависимости от рзмеров окна
    return const AdaptiveWidget(
      wide: WideLayoutSubscriptionCheckPage(),
      narrow: NarrowLayoutSubscriptionCheckPage(),
    );
  }
}
