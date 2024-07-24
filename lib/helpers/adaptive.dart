import 'package:flutter/material.dart';

bool isDeviceLarge(BuildContext context) {
  return getSize(context) == ScreenSize.extraLarge;
}

bool isDeviceMedium(BuildContext context) {
  return getSize(context) == ScreenSize.large;
}

bool isDeviceSmall(BuildContext context) {
  return getSize(context) == ScreenSize.normal;
}

enum ScreenSize { small, normal, large, extraLarge }

ScreenSize getSize(BuildContext context) {
  double deviceWidth = MediaQuery.of(context).size.width;
  if (deviceWidth > 900) return ScreenSize.extraLarge;
  if (deviceWidth > 600) return ScreenSize.large;
  if (deviceWidth > 300) return ScreenSize.normal;
  return ScreenSize.small;
}
