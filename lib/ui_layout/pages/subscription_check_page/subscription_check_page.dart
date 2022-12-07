import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sber/ui_layout/widgets_for_all_pages/adaptive_response/adaptive_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sber/ui_layout/style_app/consts_app.dart';
import 'package:sber/ui_layout/style_app/style_buttons.dart';
import 'package:sber/ui_layout/style_app/text_style.dart';
import 'package:sber/ui_layout/widgets_for_all_pages/app_bar.dart';
import 'package:sber/ui_layout/widgets_for_all_pages/my_container_alert_constraints/list_tile/list_tile.dart';
import 'package:sber/ui_layout/widgets_for_all_pages/my_container_alert_constraints/my_container_alert_constraints.dart';
import 'package:business_layout/business_layout.dart';

class AdaptiveLayoutSubscriptionCheckPage extends StatelessWidget {
  static const String id = '/SubscriptionCheck';

  const AdaptiveLayoutSubscriptionCheckPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0),
        child: AdaptiveWidget(
          ///адаптивность в зависимости от рзмеров окна
          wide: myAppBar(context: context),
          narrow: myAppBar(context: context, deleteFIO: true),
        ),
      ),
      body: MyContainerAlertWidget(
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
                SizedBox(
                  width: double.infinity,
                  child: MyButton(
                    verticalPadding: 20,
                    onTap: () {},
                    customBackgroundColor: myColorButton1,
                    child: Text(
                      'Проверить подпись',
                      style: myTextStyleFontS8Sans(
                        context: context,
                        textColor:
                            Theme.of(context).textTheme.bodyMedium!.color!,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
