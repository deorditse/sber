import 'package:flutter/material.dart';
import 'package:sber/ui_layout/style_app/text_style.dart';

import 'consts_app.dart';

Color myColorButtonMedium = Color.fromRGBO(236, 237, 240, 1);
Color myColorButtonLight = Color.fromRGBO(247, 247, 248, 1);
Color myColorTextButtonLight = Color.fromRGBO(51, 63, 72, 1);

ElevatedButton myButton({
  required child,
  required VoidCallback onTap,
  Color? customBackgroundColor,
  double? verticalPadding,
  double? horizontalPadding,
  Color? customTextColor,
  bool isCircular = false,
  required BuildContext context,
}) {
  return ElevatedButton(
    style: _styleButton(
      horizontalPadding: horizontalPadding,
      verticalPadding: verticalPadding,
      context: context,
      backgroundColor: customBackgroundColor,
      textColor: customTextColor,
      isCircular: isCircular,
    ),
    onPressed: onTap,
    child: child,
  );
}

ButtonStyle _styleButton({
  required Color? backgroundColor,
  required Color? textColor,
  required bool isCircular,
  required double? verticalPadding,
  required double? horizontalPadding,
  required BuildContext context,
}) {
  return ButtonStyle().copyWith(
    elevation: MaterialStateProperty.all(0),
    padding: MaterialStateProperty.all(
      EdgeInsets.symmetric(
        horizontal: horizontalPadding ?? 10,
        vertical: verticalPadding ?? 0,
      ),
    ),
    overlayColor: MaterialStatePropertyAll(myColorIsActive.withOpacity(0.1)),

    backgroundColor:
        MaterialStatePropertyAll(backgroundColor ?? myColorButtonLight),

    // foregroundColor: const MaterialStatePropertyAll(_myCardColorLight),
    textStyle: MaterialStatePropertyAll(
      myTextStyleFontS8Sans(
        textColor: textColor ?? myColorTextButtonLight,
        context: context,
        newFontWeight: FontWeight.w400,
      ),
    ),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(isCircular ? 200 : 24),
      ),
    ),
  );
}
