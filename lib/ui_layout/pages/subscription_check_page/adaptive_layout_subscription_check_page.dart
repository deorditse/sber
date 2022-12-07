import 'package:flutter/material.dart';
import 'package:sber/ui_layout/widgets_for_all_pages/adaptive_response/adaptive_widget.dart';

import 'adaptive_layout_subscription_check_page/narrow_layout_subscription_check_page/narrow_layout_subscription_check_page.dart';
import 'adaptive_layout_subscription_check_page/wide_layout_subscription_check_page/wide_layout_subscription_check_page.dart';

class AdaptiveLayoutSubscriptionCheckPage extends StatelessWidget {
  static const String id = '/AdaptiveLayoutSubscriptionCheckPage';

  const AdaptiveLayoutSubscriptionCheckPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveWidget(
      wide: WideLayoutSubscriptionCheckPage(),
      narrow: NarrowLayoutSubscriptionCheckPage(),
    );
  }
}
//Heading/H5 | SB Sans Display 16px SB
