import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sber/ui_layout/pages/subscription_check_page/all_implementation_container_alert/checking_an_e-subscription/checking_an_e-subscription_body.dart';
import 'package:sber/ui_layout/widgets_for_all_pages/adaptive_response/adaptive_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sber/ui_layout/style_app/consts_app.dart';
import 'package:sber/ui_layout/style_app/style_buttons.dart';
import 'package:sber/ui_layout/style_app/text_style.dart';
import 'package:sber/ui_layout/widgets_for_all_pages/app_bar.dart';
import 'package:sber/ui_layout/widgets_for_all_pages/my_container_alert_constraints/my_container_alert_constraints.dart';
import 'package:business_layout/business_layout.dart';

import 'all_implementation_container_alert/electronic_signature_verification_protocol/electronic_signature_verification_protocol.dart';

List<Widget> _listWithBodyContainerAlert = [
  // контейнер Проверка электронной подписи
  const CheckingAnESubscriptionBody(),
  // Протокол проверки электронной подписи
  const ElectronicSignatureVerificationProtocol(),
];

class SubscriptionCheckPage extends StatelessWidget {
  static const String id = '/';

  const SubscriptionCheckPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0),
        child: AdaptiveWidget(
          ///адаптивность в зависимости от рзмеров окна
          wide: myAppBar(context: context),
          narrow: myAppBar(context: context, deleteFIO: true),
        ),
      ),
      body: Obx(
        () => _listWithBodyContainerAlert[
            ImplementControllerSubscriptionCheckPage
                .instance.indexBodyWidgetInListBody.value],
      ),
    );
  }
}
