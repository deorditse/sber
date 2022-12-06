import 'dart:io';
import 'package:flutter/foundation.dart';

enum CustomPlatform {
  linux,
  macos,
  windows,
  ios,
  android,
  fuchsia,
  web,
  undefined,
}

class AppPlatform {
  static const Map<String, CustomPlatform> _platformMap = {
    'linux': CustomPlatform.linux,
    'macos': CustomPlatform.macos,
    'windows': CustomPlatform.windows,
    'ios': CustomPlatform.ios,
    'fuchsia': CustomPlatform.fuchsia,
  };

  static CustomPlatform _getPlatform() {
    //проверим сначала на веб
    if (kIsWeb) {
      return CustomPlatform.web;
    } //foundation пакет
    print(Platform.operatingSystem);
    return _platformMap[Platform.operatingSystem] ?? CustomPlatform.undefined;
  }

  static CustomPlatform get platform => _getPlatform();

  static bool get isMobile =>
      platform == CustomPlatform.ios || platform == CustomPlatform.android;
}
