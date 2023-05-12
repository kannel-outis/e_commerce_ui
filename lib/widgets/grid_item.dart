import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moniepoint_test/item_info_page.dart';
import 'package:moniepoint_test/utils/utils.dart';

class GridItem extends StatelessWidget {
  final bool changeColor;
  final String imagePath;
  final bool isLiked;
  const GridItem({
    Key? key,
    this.isLiked = false,
    required this.imagePath,
    this.changeColor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>  ItemInfoPage(imagePath: imagePath),
          ),
        );
      },
      child: Container(
        height: Utils.appBarMaxHeight,
        width: 270.w,
        decoration: BoxDecoration(
          color: changeColor ? Colors.white : Colors.transparent,
          // border: Border.all(
          //   color: Colors.black,
          //   width: 1.2,
          // ),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: Utils.appBarMinHeight,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        // Images.male_long_sleeve,
                        imagePath,
                      ),
                      fit: BoxFit.cover,
                      alignment: Alignment(1, -.9),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 18.w,
                  ),
                  width: 270.w,
                  height: 200.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 24.h,
                          bottom: 11.h,
                        ),
                        child: Text(
                          "Shirt",
                          style: TextStyle(
                            fontSize: 18.sp,
                            // fontWeight: FontWeight.bold,
                            color: const Color(0xffB3B3B3),
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Text(
                          "Essential Men's Short-Sleeve Crewnect T-shirt",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              child: Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.star_fill,
                                    color: Colors.orange,
                                    size: 24.w,
                                  ),
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  Text(
                                    "4.9 | 2339",
                                    style: TextStyle(
                                      fontSize: 17.sp,
                                      color: const Color(0xffB3B3B3),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              "\$12.00",
                              style: TextStyle(
                                fontSize: 31.sp,
                                fontWeight: FontWeight.bold,
                                color: Utils.primaryColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 50.w,
                width: 50.w,
                color: Colors.white.withOpacity(.3),
                child: Center(
                  child: Icon(
                    isLiked ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                    size: 30.w,
                    color: isLiked
                        ? const Color(0xffEB81A3)
                        : Colors.black.withOpacity(.5),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
