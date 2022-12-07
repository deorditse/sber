import 'package:flutter/material.dart';
import 'package:sber/ui_layout/style_app/text_style.dart';

import '../../consts_app.dart';
import '../../style_buttons.dart';

///Theme Material Light__________________________________________________________________________________________________________________________________________

//for Light theme

const Color _myCardColorLight = Colors.white;
const Color _myColorText1 = Colors.black;
const Color _myColorText2 = Color.fromRGBO(51, 63, 72, 1);
const Color _myColorText3 = Color.fromRGBO(133, 140, 145, 1);

ThemeData _themeLight = ThemeData.light();
ThemeData themeLight = _themeLight.copyWith(
  //будут использоватьчя базовые темы и перезаписаны только те части которые нам необходимы
  primaryColor: myColorIsActive,
  cardColor: _myCardColorLight,
  scaffoldBackgroundColor: Color.fromRGBO(245, 248, 255, 1),
  appBarTheme: AppBarTheme(
    titleTextStyle: myTextStyleFontS8Sans(fontSize: 20, context: null),
    toolbarHeight: 40,
    elevation: 0,
    color: Colors.transparent,
    iconTheme: IconThemeData(size: 20),
  ),

  textButtonTheme: TextButtonThemeData(
    style: const ButtonStyle().copyWith(
      // tapTargetSize: MaterialTapTargetSize.shrinkWrap,

      // backgroundColor: MaterialStatePropertyAll(Colors.green),
      foregroundColor: MaterialStateProperty.all(myColorIsActive),
      textStyle: MaterialStateProperty.all(
        myTextStyleFontS8Sans(
            fontSize: 12, context: null, newFontWeight: FontWeight.w500),
      ),
      padding:
          const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 10)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),

      shadowColor: const MaterialStatePropertyAll(myColorIsActive),
      overlayColor: MaterialStatePropertyAll(myColorIsActive.withOpacity(0.1)),
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: const ButtonStyle().copyWith(
      elevation: MaterialStateProperty.all(0),
      padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(horizontal: 20, vertical: 0)),
      backgroundColor: const MaterialStatePropertyAll(myColorIsActive),

      // foregroundColor: const MaterialStatePropertyAll(_myCardColorLight),
      textStyle: MaterialStatePropertyAll(
        myTextStyleFontS8Sans(
          textColor: _myColorText2,
          fontSize: 18,
          context: null,
          newFontWeight: FontWeight.w500,
        ),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    ),
  ),

  textTheme: _textLight(_themeLight.textTheme),
  //_themeLight.textTheme - какую базу будем перезаписывать
);

TextTheme _textLight(TextTheme baseTextThemeLight) {
//base - нащ базовый стиль
  return baseTextThemeLight.copyWith(
    titleLarge: baseTextThemeLight.titleLarge?.copyWith(
      color: _myColorText1,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontFamily: 'S8Sans',
    ),
    titleMedium: baseTextThemeLight.titleMedium?.copyWith(
      color: _myColorText2,
      fontSize: 15,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontFamily: 'S8Sans',
    ),
    titleSmall: baseTextThemeLight.titleSmall?.copyWith(
      color: _myColorText3,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontFamily: 'S8Sans',
    ),
  );
}
