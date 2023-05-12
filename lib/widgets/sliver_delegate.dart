import 'package:flutter/cupertino.dart';
import 'package:moniepoint_test/home_page.dart';
import 'package:moniepoint_test/main.dart';
import 'package:moniepoint_test/widgets/my_app_bar.dart';
import 'package:moniepoint_test/utils/utils.dart';

class SliverDelegateAppBar extends SliverPersistentHeaderDelegate {
  final Function(double)? opacity;
  final bool removeOpacity;
  final bool useMaxHeightAsMinHeight;

  SliverDelegateAppBar(
    this.opacity, {
    this.removeOpacity = false,
    this.useMaxHeightAsMinHeight = false,
  });

  @override
  Widget build(BuildContext context, offset, ifTrue) {
    opacity?.call(offset / Utils.appBarMaxHeight);
    return Stack(
      fit: StackFit.expand,
      children: [
        Opacity(
          opacity: removeOpacity ? 0.0 : 1.0,
          child: const TopWidget(),
        ),
        Opacity(
          opacity: 0.0,
          child: MyAppBar(
            opacity: offset / Utils.appBarMaxHeight,
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => Utils.appBarMaxHeight;

  @override
  double get minExtent =>
      useMaxHeightAsMinHeight ? Utils.appBarMaxHeight : Utils.appBarMinHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class StickyAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double height;
  final Widget? child;

  StickyAppBarDelegate({required this.height, this.child});

  @override
  Widget build(BuildContext context, offset, ifTrue) {
    return child ?? SizedBox(height: height);
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
