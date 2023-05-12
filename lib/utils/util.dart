import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Utils {
  static double blockHeight = 0.0;
  static double blockWidth = 0.0;

  static void getBlockHeightAndBlockWidth(BuildContext context) {
    final size = MediaQuery.of(context).size;

    blockHeight = size.height / 100;
    blockWidth = size.width / 100;
  }

  static get padding => blockWidth * 5;
  static double get appBarMinHeight => 203.h;
  static double get appBarMaxHeight => 450.h;
  static Color get primaryColor => const Color(0xFF2A977D);
  static double get aspectRatio => 245.w / 380.h;
  static Color get buttonColor => const Color(0xff2B2D41);
}
