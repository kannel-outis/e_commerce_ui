import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moniepoint_test/utils/utils.dart';

import 'app_bar_icon.dart';

class MyAppBar extends StatelessWidget {
  final double? opacity;
  const MyAppBar({
    Key? key,
    this.opacity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedOpacity(
          opacity: opacity ?? 0.0,
          duration: const Duration(milliseconds: 100),
          child: Container(
            width: Utils.blockWidth * 100,
            height: Utils.appBarMinHeight,
            color: Colors.white,
          ),
        ),
        Container(
          width: Utils.blockWidth * 100,
          height: Utils.appBarMinHeight,
          // color: Colors.white.withOpacity(opacity ?? 0.0),
          padding: EdgeInsets.only(
            left: Utils.padding,
            right: Utils.padding,
            bottom: 24.w,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  height: 66.h,
                  decoration: BoxDecoration(
                    // color: Colors.black,
                    borderRadius: BorderRadius.circular(15.w),
                    border: Border.all(
                      width: 2,
                      // color: const Color(0xffC0C2CA),
                      color: Colors.black.withOpacity(.25),
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        MyIcons.search_icon,
                        size: 50.w,
                        color: Colors.black.withOpacity(.3),
                      ),
                      Text(
                        "Search...",
                        style: TextStyle(
                          fontSize: 25.sp,
                          color: Colors.black.withOpacity(.25),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 66.h,
                width: 156.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    AppBarIcon(
                      count: "1",
                      icon: MyIcons.cart_icon,
                    ),
                    AppBarIcon(
                      count: "9+",
                      icon: CupertinoIcons.chat_bubble_text,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
