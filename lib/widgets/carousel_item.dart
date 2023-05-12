import 'package:flutter/material.dart';

import '../utils/utils.dart';

class CarouselItem extends StatelessWidget {
  final bool secondSlide;
  final String imagePath;
  final Alignment? alignment;
  const CarouselItem({
    required this.imagePath,
    this.alignment,
    this.secondSlide = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: Utils.padding),
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          image: AssetImage(
            imagePath,
          ),
          alignment: alignment ?? const Alignment(-1, .5),
          fit: BoxFit.cover,
        ),
      ),
      alignment: const Alignment(-1, .8),
      child: SizedBox(
        height: 210.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (secondSlide)
              Container(
                // color: Colors.white,
                width: 250.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // color: Colors.white,
                      child: Text(
                        "#BEAUTY SALE",
                        style: TextStyle(
                          fontSize: 18.w,
                          // letterSpacing: 1.2,
                          fontWeight: FontWeight.bold,
                          height: 2.8.h,
                        ),
                      ),
                    ),
                    FittedBox(
                      child: Text(
                        "DISCOVER OUR",
                        style: TextStyle(
                          fontSize: 30.w,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: Utils.blockHeight * .6),
                    FittedBox(
                      child: Text(
                        "BEAUTY SELECTION",
                        style: TextStyle(
                          fontSize: 30.w,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Container(
                      height: 47.h,
                      width: 168.w,
                      decoration: BoxDecoration(
                        color: Utils.buttonColor,
                        borderRadius: BorderRadius.circular(
                          9.w,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Check this out",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.w,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              )
            else
              SizedBox(
                // color: Colors.white,
                width: 180.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      child: Text(
                        "#FASHION DAY",
                        style: TextStyle(
                          fontSize: 18.w,
                          letterSpacing: 1.2,
                          height: 2.5.h,
                        ),
                      ),
                    ),
                    FittedBox(
                      child: Text(
                        "80% OFF",
                        style: TextStyle(
                          fontSize: 48.w,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: Utils.blockWidth),
                    Text(
                      "Discover fashion that suits to you style",
                      style: TextStyle(
                        fontSize: 15.w,
                        color: const Color(0xff6C6E78),
                      ),
                    ),
                    SizedBox(height: 28.h),
                    Container(
                      height: 47.h,
                      width: 168.w,
                      decoration: BoxDecoration(
                        color: Utils.buttonColor,
                        borderRadius: BorderRadius.circular(
                          9.w,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Check this out",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.w,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
