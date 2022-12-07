import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sber/ui_layout/widgets_for_all_pages/adaptive_response/adaptive_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sber/ui_layout/style_app/consts_app.dart';
import 'package:sber/ui_layout/style_app/style_buttons.dart';
import 'package:sber/ui_layout/style_app/text_style.dart';
import 'package:sber/ui_layout/widgets_for_all_pages/app_bar.dart';
import 'package:sber/ui_layout/widgets_for_all_pages/my_container_alert_constraints/my_container_alert_constraints.dart';
import 'package:business_layout/business_layout.dart';

class ElectronicSignatureVerificationProtocol extends StatelessWidget {
  const ElectronicSignatureVerificationProtocol({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyContainerAlertWidget(
      title: 'Протокол проверки\nэлектронной подписи',
      backCallback: () {
        print('test');
      },
      childBody: GetBuilder<ImplementControllerSubscriptionCheckPage>(
        builder: (controllerSubsCheckPage) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              mySizedHeightBetweenContainer,
              Text('Подпись принадлежит документу'),
            ],
          );
        },
      ),
    );
  }
}
