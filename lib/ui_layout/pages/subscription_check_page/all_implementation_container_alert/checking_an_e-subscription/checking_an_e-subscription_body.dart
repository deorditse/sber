import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sber/ui_layout/style_app/consts_app.dart';
import 'package:sber/ui_layout/style_app/style_buttons.dart';
import 'package:sber/ui_layout/style_app/text_style.dart';
import 'package:sber/ui_layout/widgets_for_all_pages/my_container_alert_constraints/my_container_alert_constraints.dart';
import 'package:business_layout/business_layout.dart';

import 'widgets/list_tile/list_tile.dart';

class CheckingAnESubscriptionBody extends StatelessWidget {
  const CheckingAnESubscriptionBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyContainerAlertWidget(
      title: 'Проверка электронной подписи',
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
              MyListTile(
                onTap: () {
                  // if (!controllerSubsCheckPage.isDocumentLoaded) {
                  controllerSubsCheckPage.uploadDocument();
                  // }
                },
                isUpload: controllerSubsCheckPage.isDocumentLoaded,
                title: 'Загрузите документ',
                number: '1',
                subtitle: 'Загрузите документ без штампа в формате .pdf',
              ),
              MyListTile(
                onTap: () {
                  // if (!controllerSubsCheckPage.isSignatureUploaded) {
                  controllerSubsCheckPage.uploadSignature();
                  // }
                },
                isUpload: controllerSubsCheckPage.isSignatureUploaded,
                title: 'Загрузите подпись',
                number: '2',
                subtitle: 'Файл подписи обычно имеет формат формат .sig',
              ),
              mySizedHeightBetweenContainer,
              mySizedHeightBetweenContainer,
              SizedBox(
                width: double.infinity,
                child: MyButton(
                  verticalPadding: 20,
                  onTap: () => controllerSubsCheckPage
                      .sendDocumentAndSignatureForVerification(),
                  customBackgroundColor:
                      (controllerSubsCheckPage.isDocumentLoaded &&
                              controllerSubsCheckPage.isSignatureUploaded)
                          ? myColorIsActive
                          : myColorButton1,
                  child: Text(
                    'Проверить подпись',
                    style: myTextStyleFontS8Sans(
                      context: context,
                      textColor: (controllerSubsCheckPage.isDocumentLoaded &&
                              controllerSubsCheckPage.isSignatureUploaded)
                          ? Theme.of(context).cardColor
                          : Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
