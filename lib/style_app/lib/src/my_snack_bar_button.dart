import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_app/style_app.dart';

mySnackBarButton({
  BuildContext? context,
  required String title,
  required String message,
}) {
  Get.snackbar(
    "",
    "",
    backgroundColor: context != null ? Theme.of(context).cardColor : null,
    messageText: Text(
      message,
      textAlign: TextAlign.center,
      style: context != null ? Theme.of(context).textTheme.headline2 : null,
    ),
    titleText: Text(
      title,
      textAlign: TextAlign.center,
      style: context != null ? Theme.of(context).textTheme.headline1 : null,
    ),
    // messageText: null,
    snackPosition: SnackPosition.BOTTOM,
  );
}
