import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moniepoint_test/utils/utils.dart';

class RatingBoard extends StatelessWidget {
  const RatingBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Reviews & Ratings",
          style: TextStyle(
            fontSize: 20.sp,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            Container(
              // color: Colors.yellow,
              width: 150.w,
              height: 180.h,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.h),
                  Column(
                    children: [
                      Container(
                        // color: Colors.yellow,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "4.9",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 60.sp,
                                fontWeight: FontWeight.w900,
                                height: 1.h,
                              ),
                            ),
                            Text(
                              "   / 5.0",
                              style: TextStyle(
                                height: 3.h,
                                fontSize: 18.sp,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Container(
                        child: Row(
                          children: [
                            for (var i = 0; i < 5; i++)
                              Icon(
                                i == 4
                                    ? CupertinoIcons.star_lefthalf_fill
                                    : CupertinoIcons.star_fill,
                                color: Colors.orange,
                                size: 19.w,
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    "2.3k+ Reviews",
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                height: 180.h,
                width: double.infinity,
                padding: EdgeInsets.only(top: 10.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    RateItem(
                      value: "5",
                      count: "1.5k",
                      rate: .9,
                    ),
                    RateItem(
                      value: "4",
                      count: "710 ",
                      rate: .5,
                    ),
                    RateItem(
                      value: "3",
                      count: "140 ",
                      rate: .15,
                    ),
                    RateItem(
                      value: "2",
                      count: "10  ",
                      rate: .07,
                    ),
                    RateItem(
                      value: "1",
                      count: "4   ",
                      rate: .05,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class RateItem extends StatelessWidget {
  final String value;
  final String count;
  final double rate;
  const RateItem({
    Key? key,
    required this.value,
    required this.count,
    required this.rate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          CupertinoIcons.star_fill,
          color: Colors.orange,
          size: 19.w,
        ),
        Container(
          width: 30.w,
          child: Center(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 20.sp,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        Container(
          child: Stack(
            children: [
              Container(
                height: 15.h,
                width: 300.w,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.3),
                  borderRadius: BorderRadius.circular(
                    50.w,
                  ),
                ),
              ),
              Container(
                height: 15.h,
                width: 300.w - ((1 - rate) * 300.w),
                decoration: BoxDecoration(
                  color: Utils.primaryColor,
                  borderRadius: BorderRadius.circular(
                    50.w,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 10.w),
            child: FittedBox(
              child: Text(
                count,
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
