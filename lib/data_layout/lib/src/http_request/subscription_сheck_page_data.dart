import 'dart:convert';
import 'dart:developer';
import 'package:data_layout/configuration_file.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;

class ServicesSubscriptionCheckPage {
  ///Роут проверяет соответствие документа (file_1) и подписи (file_2)
  Future<Map<String, dynamic>?> verifySignatureData({
    required Uint8List document,
    required String nameDocument,
    required Uint8List signature,
    required String nameSignature,
  }) async {
    const String nameMethod = 'postAttachmentsAndGetIdImageData';

    try {
      Uri url = Uri.https(urlMainApiUrl, 'api/public/verify/signature');
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

      if (response.statusCode == 200) {
        return ifTheRequestPassed<SignatureVerificationModel>(
          responseData: await response.stream.bytesToString(),
          responseStatus: response.statusCode,
          nameMethod: nameMethod,
        );
      } else {
        return theRequestFailed(
          nameMethod: nameMethod,
          responseStatus: response.statusCode,
          data: await response.stream.bytesToString(),
        );
      }
    } catch (error) {
      return errorRequest(
        error: error,
        nameMethod: nameMethod,
      );
    }
  }
}
