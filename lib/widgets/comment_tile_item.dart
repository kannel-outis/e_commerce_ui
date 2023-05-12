import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moniepoint_test/utils/utils.dart';

class CommentTileItem extends StatelessWidget {
  final String name;
  final String? imagePath;
  const CommentTileItem({
    Key? key,
    required this.name,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    Container(
                      height: 40.w,
                      width: 40.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.h),
                        image: DecorationImage(
                          image:
                              AssetImage(imagePath ?? Images.male_long_sleeve),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: Utils.blockHeight),
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 18.5.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.star_fill,
                      color: Colors.orange,
                      size: 19.w,
                    ),
                    SizedBox(width: Utils.blockHeight),
                    Text(
                      "5.0",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 20.w),
                    RotatedBox(
                      quarterTurns: 2,
                      child: Icon(
                        CupertinoIcons.ellipsis,
                        size: 30.w,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              _Wrap(label: "Product in good comdition"),
              _Wrap(label: "Very fast Delivery"),
              _Wrap(label: "Fast seller response"),
            ],
          ),
          SizedBox(height: 20.h),
          SizedBox(
            width: 400.w,
            child: Text(
              "According to my expectations. This is the best. Thank you",
              style: TextStyle(
                fontSize: 20.sp,
                height: 1.8,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Row(
                  children: [
                    SizedBox(
                      child: Row(
                        children: [
                          Icon(
                            Icons.thumb_up,
                            color: Utils.primaryColor,
                            size: 25.w,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Text(
                      "Helpful ?",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Utils.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "Yesterday",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              )
            ],
          ),
          SizedBox(height: 40.h),
          Divider(
            color: Colors.grey.withOpacity(.2),
            thickness: 2,
            height: 2,
          )
        ],
      ),
    );
  }
}

class _Wrap extends StatelessWidget {
  final String label;
  const _Wrap({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.w),
        border: Border.all(
          width: 1,
          color: Utils.primaryColor,
        ),
        color: Utils.primaryColor.withOpacity(.3),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 15.sp,
          color: Utils.primaryColor,
        ),
      ),
    );
  }
}
