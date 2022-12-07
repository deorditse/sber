import 'package:flutter/material.dart';
import 'package:get/get.dart';

myTextStyleFontS8Sans({
  double? fontSize,
  Color? textColor,
  FontWeight? newFontWeight,
  required BuildContext? context,
}) =>
    TextStyle(
      color: textColor ??
          (context != null
              ? Theme.of(context).textTheme.titleLarge!.color
              : Get.theme.textTheme.titleLarge!.color),
      fontFamily: 'S8Sans',
      fontStyle: FontStyle.normal,
      fontSize: fontSize ?? 12,
      fontWeight: newFontWeight ?? FontWeight.w600,
    );
