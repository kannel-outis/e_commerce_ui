import 'package:flutter/material.dart';
import 'package:moniepoint_test/utils/utils.dart';

class IconItem extends StatelessWidget {
  final IconData icon;
  final String label;
  const IconItem({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 60.w,
            width: 60.w,
            // color: const Color(0xffF6F6F6)
            decoration: BoxDecoration(
              color: const Color(0xffB3B3B3).withOpacity(.3),
              borderRadius: BorderRadius.circular(12.w),
            ),
            child: Icon(icon, size: 36.w),
          ),
          Text(
            label,
            style: TextStyle(
                fontSize: 17.w,
                // fontWeight: FontWeight.bold,
                color: const Color(0xffB3B3B3)),
          ),
        ],
      ),
    );
  }
}
