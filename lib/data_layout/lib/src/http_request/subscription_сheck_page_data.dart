import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;

class ServicesSubscriptionCheckPage {
  ///Роут проверяет соответствие документа (file_1) и подписи (file_2)
  Future<Map<String, SignatureVerificationModel?>?> verifySignatureData({
    required Uint8List document,
    required String nameDocument,
    required Uint8List signature,
    required String nameSignature,
  }) async {
    try {
      Uri url = Uri.https('sberslovo.ru', 'api/public/verify/signature');
      var request = http.MultipartRequest("POST", url)
        ..files.add(
          http.MultipartFile.fromBytes(
            "file_1",
            document,
            filename: nameDocument,
            contentType: MediaType('application', 'pdf'),
          ),
        )
        ..files.add(
          http.MultipartFile.fromBytes(
            "file_2",
            signature,
            filename: nameSignature,
            contentType: MediaType('application', 'sig'),
          ),
        );

      http.StreamedResponse response = await request.send();

      print(
          'Response status from postAttachmentsAndGetIdImageData: ${response.statusCode}');
      log('postAttachmentsAndGetIdImageData ${response.reasonPhrase}');

      if (response.statusCode == 200) {
        var responseData = await response.stream.toBytes();
        log('postAttachmentsAndGetIdImageData ${String.fromCharCodes(responseData)}');

        return {
          '${response.statusCode}': SignatureVerificationModel.fromJson(
              json.decode(String.fromCharCodes(responseData)))
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
}
