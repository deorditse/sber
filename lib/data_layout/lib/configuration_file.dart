import 'dart:convert';

import 'package:models/models.dart';

String urlMainApiUrl = "sberslovo.ru";

/// централизованная обработка ошибок для запросов
// if responseStatus != 200

Map<String, dynamic> theRequestFailed({
  required String nameMethod,
  required int responseStatus,
  required String data,
}) {
  print('Status $responseStatus, from method $nameMethod data: $data');
  return {responseStatus.toString(): data};
}

dynamic errorRequest({required Object error, required String nameMethod}) {
  print('Error from method $nameMethod error: $error');
  //можно например что-то выводить на экран в этот момент

  return null;
}

Map<String, T> ifTheRequestPassed<T>({
  required String responseData,
  required int responseStatus,
  required String nameMethod,
}) {
  print('RequestPassed from method $nameMethod data : $responseData');
  return {
    responseStatus.toString(): Generic.fromJson<T>(jsonDecode(responseData))
  };
}


class Generic {
  /// If T is a List, K is the subtype of the list.
  static T fromJson<T>(Map<String, dynamic> json) {
    if (T == SignatureVerificationModel) {
      return SignatureVerificationModel.fromJson(json) as T;
    } else {
      throw Exception("Unknown class");
    }
  }
}
