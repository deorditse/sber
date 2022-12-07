import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sber/ui_layout/style_app/consts_app.dart';
import 'package:sber/ui_layout/style_app/text_style.dart';
import 'package:sber/ui_layout/widgets_for_all_pages/my_container_alert_constraints/my_container_alert_constraints.dart';
import 'package:business_layout/business_layout.dart';

class ElectronicSignatureVerificationProtocol extends StatelessWidget {
  const ElectronicSignatureVerificationProtocol({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyContainerAlertWidget(
      title: 'Протокол проверки\nэлектронной подписи',
      backCallback: () {
        ImplementControllerSubscriptionCheckPage.instance
            .changeIndexBodyWidgetInListBody();
      },
      childBody: GetBuilder<ImplementControllerSubscriptionCheckPage>(
        builder: (controllerSubsCheckPage) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              mySizedHeightBetweenContainer,
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(243, 255, 246, 1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    width: 1,
                    color: Color.fromRGBO(20, 143, 43, 1),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/check.svg',
                        semanticsLabel: 'check',
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        width: myWithBetweenContent,
                      ),
                      Text('Подпись принадлежит документу'),
                    ],
                  ),
                ),
              ),
              mySizedHeightBetweenContainer,
              _MainInfoText(),
            ],
          );
        },
      ),
    );
  }
}

class _MainInfoText extends StatelessWidget {
  const _MainInfoText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _titleAndSubscription({required title, required subtitle}) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // mySizedHeightBetweenContainer,
            Text(title),
            // mySizedHeightBetweenContainer,
            Text(
              subtitle,
              style: myTextStyleFontS8Sans(
                  context: context, newFontWeight: FontWeight.w400),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(
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
          _titleAndSubscription(
            title: 'ФИО подписанта',
            subtitle: 'Киселева Елизавета Андреевна',
          ),
          _titleAndSubscription(
            title: 'ИНН Подписанта',
            subtitle: '12888499200883',
          ),
          _titleAndSubscription(
            title: 'Дата подписания',
            subtitle: '29 мая 2022, 15:37:41 мск',
          ),
          _titleAndSubscription(
            title: 'ID Подписи',
            subtitle: '2ff4095d1500db80ec111d51ce373f14',
          ),
          _titleAndSubscription(
            title: 'ID Документа',
            subtitle: '2ff4095d1500db80ec111d51ce373f14',
          ),
          _titleAndSubscription(
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
      ),
    );
  }
}
