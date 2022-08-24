import 'package:flutter/material.dart';

class Utils {
  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width / 414;
  }

  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.width / 896;
  }
}
