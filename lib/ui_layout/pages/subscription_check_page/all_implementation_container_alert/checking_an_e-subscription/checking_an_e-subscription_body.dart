import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:sber/data_layout/lib/data_layout.dart';
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
      childBody: GetBuilder<ImplementControllerSubscriptionCheckPage>(
        builder: (controllerSubsCheckPage) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              mySizedHeightBetweenContainer,
              MyListTile(
                onTap: () {
                  controllerSubsCheckPage.uploadDocument();
                },
                title: 'Загрузите документ',
                number: '1',
                subtitle: 'Загрузите документ без штампа в формате .pdf',
                uploadFileName: controllerSubsCheckPage.document?.name,
                uploadFileDateTimeCreate: null,
              ),
              MyListTile(
                onTap: () async {
                  controllerSubsCheckPage.uploadSignature();
                },
                title: 'Загрузите подпись',
                number: '2',
                subtitle: 'Файл подписи обычно имеет формат формат .sig',
                uploadFileName: controllerSubsCheckPage.signature?.name,
                uploadFileDateTimeCreate: null,
              ),
              mySizedHeightBetweenContainer,
              mySizedHeightBetweenContainer,
              SizedBox(
                width: double.infinity,
                child: MyButton(
                  verticalPadding: 20,
                  onTap: () {
                    controllerSubsCheckPage
                        .sendDocumentAndSignatureForVerification();
                  },
                  customBackgroundColor:
                      (controllerSubsCheckPage.document != null &&
                              controllerSubsCheckPage.signature != null)
                          ? myColorIsActive
                          : myColorButton1,
                  child: Text(
                    'Проверить подпись',
                    style: myTextStyleFontS8Sans(
                      context: context,
                      textColor: (controllerSubsCheckPage.document != null &&
                              controllerSubsCheckPage.signature != null)
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
