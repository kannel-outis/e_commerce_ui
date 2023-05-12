import 'package:flutter/material.dart';

class NoEffectScrollConfig extends ScrollBehavior {
  const NoEffectScrollConfig();
  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}
