import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sber/ui_layout/style_app/consts_app.dart';
import 'package:sber/ui_layout/style_app/style_buttons.dart';
import 'package:sber/ui_layout/style_app/text_style.dart';
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
                SvgPicture.asset(
                  'assets/icons/logo.svg',
                  semanticsLabel: 'logo',
                  fit: BoxFit.contain,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      myButton(
                        onTap: () {},
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/edit.svg',
                              semanticsLabel: 'edit',
                              fit: BoxFit.contain,
                            ),
                            SizedBox(width: withBetweenContent),
                            Text(
                              '12',
                              style: myTextStyleFontS8Sans(context: context),
                            ),
                          ],
                        ),
                        context: context,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: withBetweenContent),
                        child: VerticalDivider(),
                      ),
                      Text(
                        'Елизавета Киселева',
                        style: myTextStyleFontS8Sans(context: context),
                      ),
                      SizedBox(width: withBetweenContent),
                      SvgPicture.asset(
                        'assets/icons/user.svg',
                        semanticsLabel: 'user',
                        fit: BoxFit.contain,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.keyboard_arrow_down_outlined,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: MyContainerAlertWidget(
        backCallback: () {
          print('test');
        },
        childBody: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: myColorIsActive,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(200),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 10,
                      child: Text(
                        '1',
                        style: myTextStyleFontS8Sans(context: context),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: withBetweenContent),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Загрузите документ',
                        style: myTextStyleFontS8Sans(
                          context: context,
                          fontSize: 12,
                        ),
                      ),
                      mySizedHeightBetweenContainer,
                      Text(
                        'Загрузите документ без штампа в формате .pdf',
                        style: myTextStyleFontS8Sans(
                            context: context,
                            fontSize: 12,
                            newFontWeight: FontWeight.w300),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: mySizedHeightBetweenContainer.height! / 2,
                        ),
                        child: myButton(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/save.svg',
                                semanticsLabel: 'save',
                                fit: BoxFit.contain,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Загрузить документ',
                                style: myTextStyleFontS8Sans(
                                  context: context,
                                  textColor: myColorTextBlue,
                                ),
                              ),
                            ],
                          ),
                          onTap: () {},
                          context: context,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            mySizedHeightBetweenContainer,
            SizedBox(
              width: double.infinity,
              child: myButton(
                verticalPadding: 20,
                child: Text(
                  'Проверить подпись',
                  style: myTextStyleFontS8Sans(
                    context: context,
                    textColor: myColorTextButtonLight,
                  ),
                ),
                onTap: () {},
                context: context,
                customBackgroundColor: myColorButtonMedium,
              ),
            ),
          ],
        ),
        title: 'Проверка электронной подписи',
      ),
    );
  }
}
