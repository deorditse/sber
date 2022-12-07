import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:sber/ui_layout/style_app/consts_app.dart';
import 'package:sber/ui_layout/style_app/style_buttons.dart';
import 'package:sber/ui_layout/style_app/text_style.dart';
import 'package:sber/ui_layout/widgets_for_all_pages/my_container_alert_constraints/my_container_alert_constraints.dart';
import 'package:business_layout/business_layout.dart';

class MainInfoIfResponse200 extends StatelessWidget {
  const MainInfoIfResponse200({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GetBuilder<ImplementControllerSubscriptionCheckPage>(
        builder: (controllerSubsCheckPage) {
          SignatureVerificationModel? signatureVerification =
              controllerSubsCheckPage
                  .responseStatusAndDataSignatureVerification.values.first;
          if (signatureVerification != null && !signatureVerification.success) {
            return Column(
              children: [
                Text(
                  'Возможные причины ошибки:',
                  style: myTextStyleFontS8Sans(
                    context: context,
                    fontSize: 16,
                    textColor: Theme.of(context).textTheme.titleLarge!.color,
                  ),
                ),
                mySizedHeightBetweenContainer,
                Text(
                  '1. Документ был изменен;\n2. Электронная подпись была создана для другого документа;\n3. Электронная подпись была изменена;\n4 Электронная подпись была создана в другом сервисе.',
                  style: myTextStyleFontS8Sans(
                      context: context, newFontWeight: FontWeight.w400),
                ),
              ],
            );
          } else {
            _modelTitleAndSubscription(
                {required String title, required String? subtitle}) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(title),
                    Text(
                      subtitle ?? '...',
                      style: myTextStyleFontS8Sans(
                        context: context,
                        newFontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Основная информация',
                  style: myTextStyleFontS8Sans(
                    context: context,
                    textColor: Theme.of(context).textTheme.titleLarge!.color,
                    fontSize: 16,
                  ),
                ),
                mySizedHeightBetweenContainer,
                _modelTitleAndSubscription(
                  title: 'ФИО подписанта',
                  subtitle: 'Киселева Елизавета Андреевна',
                ),
                _modelTitleAndSubscription(
                  title: 'ИНН Подписанта',
                  subtitle: '12888499200883',
                ),
                _modelTitleAndSubscription(
                  title: 'Дата подписания',
                  subtitle: '29 мая 2022, 15:37:41 мск',
                ),
                _modelTitleAndSubscription(
                  title: 'ID Подписи',
                  subtitle: '2ff4095d1500db80ec111d51ce373f14',
                ),
                _modelTitleAndSubscription(
                  title: 'ID Документа',
                  subtitle: '2ff4095d1500db80ec111d51ce373f14',
                ),
                _modelTitleAndSubscription(
                  title: 'D Ключа',
                  subtitle: '2ff4095d1500db80ec111d51ce373f14',
                ),
                mySizedHeightBetweenContainer,
                Text(
                  'Владелец подписи',
                  style: myTextStyleFontS8Sans(
                    context: context,
                    fontSize: 16,
                    textColor: Theme.of(context).textTheme.titleLarge!.color,
                  ),
                ),
                mySizedHeightBetweenContainer,
                Text(
                  'Киселева Елизавета Андреевна\nKiseleva.ea@phystech.edu',
                  style: myTextStyleFontS8Sans(
                      context: context, newFontWeight: FontWeight.w400),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}