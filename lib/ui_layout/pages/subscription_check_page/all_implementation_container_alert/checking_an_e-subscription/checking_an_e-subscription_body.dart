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
                    // _onSub();
                    if (controllerSubsCheckPage.document != null &&
                        controllerSubsCheckPage.signature != null) {
                      verifySignatureData();
                    }
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

  _onSub() {
    ///имитация ответа от сервера
    ImplementControllerSubscriptionCheckPage.instance
        .changeResponseStatusAndDataSignatureVerificationFORTEST(
      newResponseStatus: '200',
      newSignatureVerification: SignatureVerificationModel(
        error_code: 0,
        error_comment: 'error_comment',
        error_details: 'error_details',
        error_trace: 'error_trace',
        success: false,
        signature_time_msk: 'signature_time_msk',
        signer_full_name: 'signer_full_name',
        signer_inn: 'signer_inn',
        signature_guid: 'signature_guid',
        document_origin_guid: 'document_origin_guid',
      ),
    );
  }
}

///Роут проверяет соответствие документа (file_1) и подписи (file_2)
Future<Map<String, SignatureVerificationModel?>?> verifySignatureData(
    // required Uint8List file_1,
// required Uint8List file_2,
// required String accessToken,

    ) async {
  try {
    Uri url = Uri.https(
      // 'sberslovo.ru',
      'pravolet.ru',
      'api/docs/public/verify/signature',
    );
    var request = http.MultipartRequest("POST", url)
      ..files.add(
        http.MultipartFile.fromBytes(
          "file_1",
          ImplementControllerSubscriptionCheckPage.instance.document!.bytes!,
          filename:
              ImplementControllerSubscriptionCheckPage.instance.document!.name,
          // contentType: MediaType('application', 'pdf'),
          contentType: MediaType('application', 'pdf'),
        ),
      )
      ..files.add(
        http.MultipartFile.fromBytes(
          "file_2",
          ImplementControllerSubscriptionCheckPage.instance.signature!.bytes!,
          filename:
              ImplementControllerSubscriptionCheckPage.instance.signature!.name,
          // contentType: MediaType('multipart', 'form-data'),
        ),
      );

    http.StreamedResponse response = await request.send();

    print(
        'Response status from postAttachmentsAndGetIdImageData: ${response.statusCode}');
    log('postAttachmentsAndGetIdImageData ${response.reasonPhrase}');

    if (response.statusCode == 200) {
      var responseData = response.reasonPhrase;
      return {
        '${response.statusCode}':
            SignatureVerificationModel.fromJson(jsonDecode(responseData!))
      };
    } else {
      Get.snackbar(
        'Exception',
        'Response status postAttachmentsAndGetIdImageData: ${response.statusCode}',
        snackPosition: SnackPosition.TOP,
      );
      return {'${response.statusCode}': null};
    }
  } catch (error) {
    Get.snackbar(
      'Exception',
      'error from postAttachmentsAndGetIdImageData:$error}',
      snackPosition: SnackPosition.TOP,
    );
    print('я в ошибке from postAttachmentsAndGetIdImageData $error');
  }
  return null;
}
