import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:sber/ui_layout/style_app/consts_app.dart';
import 'package:sber/ui_layout/style_app/text_style.dart';
import 'package:business_layout/business_layout.dart';

class MainInfoIfResponse200 extends StatelessWidget {
  const MainInfoIfResponse200({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GetBuilder<ImplementControllerSubscriptionCheckPage>(
        builder: (controllerSubsCheckPage) {
          SignatureVerificationModel? signatureVerification =
              controllerSubsCheckPage.signatureVerification;
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
                  subtitle: signatureVerification?.signer_full_name,
                ),
                _modelTitleAndSubscription(
                  title: 'ИНН Подписанта',
                  subtitle: signatureVerification?.signer_inn,
                ),
                _modelTitleAndSubscription(
                  title: 'Дата подписания',
                  subtitle: signatureVerification?.signature_time_msk,
                ),
                _modelTitleAndSubscription(
                  title: 'ID Подписи',
                  subtitle: signatureVerification?.signature_guid,
                ),
                _modelTitleAndSubscription(
                  title: 'ID Документа',
                  subtitle: signatureVerification?.document_origin_guid,
                ),
                _modelTitleAndSubscription(
                  title: 'ID Ключа',
                  subtitle: signatureVerification?.key_guid,
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
                  '${signatureVerification?.signer_full_name ?? '...'}\nKiseleva.ea@phystech.edu',
                  style: myTextStyleFontS8Sans(
                    context: context,
                    newFontWeight: FontWeight.w400,
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
