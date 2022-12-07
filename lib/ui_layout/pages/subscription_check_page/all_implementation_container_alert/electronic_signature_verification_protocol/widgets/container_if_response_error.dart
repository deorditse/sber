import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sber/ui_layout/style_app/consts_app.dart';
import 'package:sber/ui_layout/style_app/style_buttons.dart';
import 'package:sber/ui_layout/style_app/text_style.dart';
import 'package:sber/ui_layout/widgets_for_all_pages/my_container_alert_constraints/my_container_alert_constraints.dart';
import 'package:business_layout/business_layout.dart';

class IfErrorResponse extends StatelessWidget {
  const IfErrorResponse({Key? key, required this.responseStatus})
      : super(key: key);
  final String responseStatus;

  @override
  Widget build(BuildContext context) {
    return MyContainerAlertWidget(
      isErrorResponseStatus: true,
      title: responseStatus,
      childBody: IntrinsicWidth(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (responseStatus == '404')
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Страница не найдена',
                          style: myTextStyleFontS8Sans(
                            context: context,
                            fontSize: 19,
                            newFontWeight: FontWeight.w600,
                            textColor:
                                Theme.of(context).textTheme.bodyLarge!.color!,
                          ),
                        ),
                        mySizedHeightBetweenContainer,
                        Text(
                          'Мы не смогли найти данную страницу. ',
                          style: myTextStyleFontS8Sans(
                            context: context,
                            textColor:
                                Theme.of(context).textTheme.bodySmall!.color!,
                          ),
                        ),
                      ],
                    )
                  else
                    Text(
                      'Что-то пошло не так',
                      style: myTextStyleFontS8Sans(
                        context: context,
                        fontSize: 19,
                        newFontWeight: FontWeight.w600,
                        textColor:
                            Theme.of(context).textTheme.bodyLarge!.color!,
                      ),
                    ),
                ],
              ),
            ),
            mySizedHeightBetweenContainer,
            mySizedHeightBetweenContainer,
            mySizedHeightBetweenContainer,
            MyButton(
              verticalPadding: 20,
              onTap: () => ImplementControllerSubscriptionCheckPage.instance
                  .changeIndexBodyWidgetInListBody(),
              customBackgroundColor: myColorIsActive,
              child: Text(
                'Вернуться на главную',
                style: myTextStyleFontS8Sans(
                  context: context,
                  textColor: Theme.of(context).cardColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
