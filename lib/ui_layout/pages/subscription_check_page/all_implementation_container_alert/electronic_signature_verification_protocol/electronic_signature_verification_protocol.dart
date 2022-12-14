import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sber/ui_layout/style_app/consts_app.dart';
import 'package:sber/ui_layout/style_app/style_buttons.dart';
import 'package:sber/ui_layout/style_app/text_style.dart';
import 'package:sber/ui_layout/widgets_for_all_pages/my_container_alert_constraints/my_container_alert_constraints.dart';
import 'package:business_layout/business_layout.dart';
import 'widgets/container_if_response_error.dart';
import 'widgets/main_info_if_response_200.dart';
import 'widgets/signature_verification_container.dart';

class ElectronicSignatureVerificationProtocol extends StatelessWidget {
  const ElectronicSignatureVerificationProtocol({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImplementControllerSubscriptionCheckPage>(
      builder: (controllerSubsCheckPage) {
        final String? _responseStatus = controllerSubsCheckPage.responseStatus;
        if ((_responseStatus == null) || (_responseStatus == '200')) {
          return MyContainerAlertWidget(
            title: 'Протокол проверки\nэлектронной подписи',
            backCallback: () {
              controllerSubsCheckPage.changeIndexBodyWidgetInListBody();
            },
            childBody: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                mySizedHeightBetweenContainer,
                SignatureVerificationContainer(),
                mySizedHeightBetweenContainer,
                MainInfoIfResponse200(),
              ],
            ),
          );
        } else {
          return IfErrorResponse(responseStatus: _responseStatus);
        }
      },
    );
  }
}
