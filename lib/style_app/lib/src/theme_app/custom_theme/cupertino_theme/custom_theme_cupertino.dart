//создадим по умолчанию
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final CupertinoThemeData _cupertinoBase = CupertinoThemeData();
//далее от нашей базовой темы унаследуем две темы светлую и темную
//тут нет из коробки светлой и темной темы поэтому надо будет полностью переопределять

///Theme Cupertino Light__________________________________________________________________________________________________________________________________________
CupertinoThemeData cupertinoThemeDataLight = _cupertinoBase.copyWith(
  scaffoldBackgroundColor: Colors.black,
  barBackgroundColor: Colors.black,
  textTheme: _textThemeLight(_cupertinoBase.textTheme),

);

CupertinoTextThemeData _textThemeLight(
    CupertinoTextThemeData _baseCupertinoTextThemeData) {
  return _baseCupertinoTextThemeData.copyWith(
    textStyle: TextStyle(
      color: CupertinoColors.destructiveRed,
      fontSize: 16,
    ),
  );
}

///Theme Cupertino Dark__________________________________________________________________________________________________________________________________________
CupertinoThemeData cupertinoThemeDataDark = _cupertinoBase.copyWith(
  scaffoldBackgroundColor: CupertinoColors.systemOrange,
  textTheme: _textThemeDark(_cupertinoBase.textTheme),
  barBackgroundColor: CupertinoColors.activeGreen,
);

CupertinoTextThemeData _textThemeDark(
    CupertinoTextThemeData _baseCupertinoTextThemeData) {
  return _baseCupertinoTextThemeData.copyWith(
    textStyle: TextStyle(
      color: CupertinoColors.tertiaryLabel,
      fontSize: 20,
    ),
  );
}
