import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:universal_io/io.dart';

class PlatformInfo {
  PlatformGroup getPlatformGroup() {
    if (kIsWeb) {
      return PlatformGroup.web;
    } else if (Platform.isMacOS || Platform.isLinux || Platform.isWindows) {
      return PlatformGroup.desktop;
    } else if (Platform.isMacOS || Platform.isAndroid) {
      return PlatformGroup.mobile;
    } else {
      return PlatformGroup.unknown;
    }
  }

  PlatformType getPlatformType() {
    if (kIsWeb) {
      return PlatformType.Web;
    }

    if (Platform.isMacOS) {
      return PlatformType.MacOS;
    }

    if (Platform.isFuchsia) {
      return PlatformType.Fuchsia;
    }

    if (Platform.isLinux) {
      return PlatformType.Linux;
    }

    if (Platform.isWindows) {
      return PlatformType.Windows;
    }

    if (Platform.isIOS) {
      return PlatformType.iOS;
    }

    if (Platform.isAndroid) {
      return PlatformType.Android;
    }

    return PlatformType.Unknown;
  }
}

enum PlatformType { Web, iOS, Android, MacOS, Fuchsia, Linux, Windows, Unknown }
enum PlatformGroup { web, mobile, desktop, unknown }
