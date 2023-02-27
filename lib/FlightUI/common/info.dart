import 'package:flutter/cupertino.dart';

enum DeviceOperatingSystem { Android, IOS, Unknown }

class SizeInfo {
  static MediaQueryData? _mediaQueryData;
  static double? width;
  static double? height;
  static double? defaultSize;
  static Orientation? orientation;
  static double? scaleFactor;

  void init(BuildContext context) {

    _mediaQueryData = MediaQuery.of(context);
    scaleFactor = _mediaQueryData!.textScaleFactor;
    width = _mediaQueryData!.size.width;
    height = _mediaQueryData!.size.height;
    orientation = _mediaQueryData!.orientation;
    // On iPhone 11 the defaultSize = 10 almost
    // So if the screen size increase or decrease then our defaultSize also vary
    defaultSize = orientation == Orientation.landscape
        ? height! * 0.024
        : width! * 0.024;
  }
}