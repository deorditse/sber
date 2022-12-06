import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sber/style_app/lib/style_app.dart';
import 'package:sber/ui_layout/widgets_for_all_pages/my_container_alert_constraints/my_container_alert_constraints.dart';

class WideLayoutSubscriptionCheckPage extends StatelessWidget {
  const WideLayoutSubscriptionCheckPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: Container(
          color: Theme.of(context).cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'online subscript',
                  style: myTextStyleFontS8Sans(context: context),
                ),
                Row(
                  children: [
                    Icon(Icons.ac_unit),
                    Text(
                      '12',
                      style: myTextStyleFontS8Sans(context: context),
                    ),
                    Text(
                      'Елизавета Киселева',
                      style: myTextStyleFontS8Sans(context: context),
                    ),
                    Icon(Icons.account_balance),
                    Icon(Icons.add_circle),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: MyContainerAlertWidget(
        childBody: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'WideLayoutSubscriptionCheckPage',
              style: myTextStyleFontS8Sans(context: context),
            ),
            mySizedHeightBetweenContainer,
            ElevatedButton(
              onPressed: () {},
              child: Text('Проверить подпись'),
            ),
          ],
        ),
        title: 'Проверка электронной подписи',
      ),
    );
  }
}
