import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:sber/ui_layout/style_app/consts_app.dart';
import 'package:sber/ui_layout/style_app/style_buttons.dart';
import 'package:sber/ui_layout/style_app/text_style.dart';
import 'package:sber/ui_layout/widgets_for_all_pages/my_container_alert_constraints/my_container_alert_constraints.dart';
import 'package:business_layout/business_layout.dart';

import 'widgets/main_info_if_response_200.dart';
import 'widgets/signature_verificatio_container.dart';

class ElectronicSignatureVerificationProtocol extends StatelessWidget {
  const ElectronicSignatureVerificationProtocol({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImplementControllerSubscriptionCheckPage>(
      builder: (controllerSubsCheckPage) {
        String? _responseStatus = controllerSubsCheckPage
            .responseStatusAndDataSignatureVerification.keys.first;
        if (_responseStatus == null || _responseStatus == '200') {
          {
            return MyContainerAlertWidget(
              title: 'Протокол проверки\nэлектронной подписи',
              backCallback: () {
                ImplementControllerSubscriptionCheckPage.instance
                    .changeIndexBodyWidgetInListBody();
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
          }
        } else {
          return MyContainerAlertWidget(
            isErrorResponseStatus: true,
            title: _responseStatus,
            childBody: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: Column(
                    children: [
                      if (_responseStatus == '404')
                        Column(
                          children: [
                            Text(
                              'Страница не найдена',
                              style: myTextStyleFontS8Sans(
                                context: context,
                                textColor: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .color!,
                              ),
                            ),
                            mySizedHeightBetweenContainer,
                            Text(
                              'Мы не смогли найти данную страницу. ',
                              style: myTextStyleFontS8Sans(
                                context: context,
                                textColor: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .color!,
                              ),
                            ),
                          ],
                        )
                      else
                        Text(
                          'Что-то пошло не так',
                          style: myTextStyleFontS8Sans(
                            context: context,
                            textColor:
                                Theme.of(context).textTheme.bodyLarge!.color!,
                          ),
                        ),
                    ],
                  ),
                ),
                MyButton(
                  verticalPadding: 20,
                  onTap: () =>
                      controllerSubsCheckPage.changeIndexBodyWidgetInListBody(),
                  customBackgroundColor: myColorIsActive,
                  child: Text(
                    'Вернуться на главную',
                    style: myTextStyleFontS8Sans(
                      context: context,
                      textColor: Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
