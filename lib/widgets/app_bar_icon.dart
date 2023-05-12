import 'package:flutter/material.dart';
import 'package:moniepoint_test/utils/utils.dart';

class AppBarIcon extends StatelessWidget {
  final IconData icon;
  final String? count;
  final bool removeCount;
  final double additionalSize;
  const AppBarIcon({
    Key? key,
    this.count,
    required this.icon,
    this.additionalSize = 0,
    this.removeCount = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Icon(
          icon,
          size: 39.w + additionalSize,
          color: const Color(0xff393A4B),
        ),
        if (!removeCount)
          Container(
            height: 24.w,
            width: 26.w,
            decoration: BoxDecoration(
              color: const Color(0xffEB81A3),
              borderRadius: BorderRadius.circular(
                6.w,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              count!,
              style: TextStyle(
                color: Colors.white,
                fontSize: 13.sp,
              ),
            ),
          )
      ],
    );
  }
}
