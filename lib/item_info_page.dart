import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'utils/utils.dart';
import 'widgets/widgets.dart';

class ItemInfoPage extends StatefulWidget {
  final String? imagePath;
  const ItemInfoPage({
    Key? key,
    this.imagePath,
  }) : super(key: key);

  @override
  State<ItemInfoPage> createState() => _ItemInfoPageState();
}

class _ItemInfoPageState extends State<ItemInfoPage>
    with TickerProviderStateMixin {
  Duration get animationDuration => const Duration(milliseconds: 1000);
  String get path => widget.imagePath ?? Images.shirt_4;
  late final AnimationController _animationController;
  late final AnimationController _fadeAnimation1;
  late final AnimationController _fadeAnimation2;
  late final AnimationController _fadeAnimation3;
  late final AnimationController _fadeAnimation4;
  double interval(int index) => index * .1;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: animationDuration);
    _fadeAnimation1 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: animationDuration.inMilliseconds ~/ 2),
    );
    _fadeAnimation2 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: animationDuration.inMilliseconds ~/ 2),
    );
    _fadeAnimation3 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: animationDuration.inMilliseconds ~/ 2),
    );
    _fadeAnimation4 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: animationDuration.inMilliseconds ~/ 2),
    );
    // _animate();
    Timer(const Duration(milliseconds: 200), () {
      _animationController.forward();
      Timer(const Duration(milliseconds: 200), () {
        _fadeAnimation1.forward();
        Timer(const Duration(milliseconds: 100), () {
          _fadeAnimation2.forward();
          Timer(const Duration(milliseconds: 100), () {
            _fadeAnimation3.forward();
            Timer(const Duration(milliseconds: 50), () {
              _fadeAnimation4.forward();
            });
          });
        });
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _fadeAnimation1.dispose();
    _fadeAnimation2.dispose();
    _fadeAnimation3.dispose();
    _fadeAnimation4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size(Utils.blockWidth * 100, Utils.appBarMinHeight * 1.2),
        child: Container(
          height: Utils.appBarMinHeight / 1.2,
          width: double.infinity,
          // color: Colors.transparent,
          padding: EdgeInsets.only(
            left: Utils.padding,
            right: Utils.padding,
            bottom: Utils.padding,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const AppBarIcon(
                  icon: CupertinoIcons.back,
                  removeCount: true,
                ),
              ),
              SizedBox(
                width: 170.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppBarIcon(
                      icon: CupertinoIcons.heart,
                      removeCount: true,
                    ),
                    AppBarIcon(
                      icon: MyIcons.share,
                      removeCount: true,
                      additionalSize: 5.w,
                    ),
                    const AppBarIcon(
                      icon: MyIcons.cart_icon,
                      count: "1",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Utils.padding,
              ),
              child: SizedBox(
                // height: Utils.blockHeight * 350,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    FadeSlideAnimation(
                      fadeAnimation: _fadeAnimation1,
                      animationController: _animationController,
                      index: 1,
                      child: Container(
                        width: double.infinity,
                        height: 600.h,
                        padding: EdgeInsets.only(left: 20.h),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(path),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10.w),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (var i = 1; i <= 4; i++)
                              Container(
                                height: 60.w,
                                width: 60.w,
                                margin: EdgeInsets.only(top: 20.h),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.w),
                                  // border: Border.all(
                                  //   width: 1.2,
                                  //   color: Colors.white,
                                  // ),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      "${"${path.split(".").first}_e$i"}.jpg",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    FadeSlideAnimation(
                      animationController: _animationController,
                      index: 2,
                      fadeAnimation: _fadeAnimation2,
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Icon(
                                    MyIcons.shop,
                                    size: 30.w,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(width: 5.w),
                                  Text(
                                    "tokobaju.id",
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.h),
                            SizedBox(
                              width: 400.w,
                              child: Text(
                                "Essential Men's Short-Sleeve Crewnect T-shirt",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 35.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(height: 30.h),
                            SizedBox(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                          "4.9 Ratings",
                                          style: TextStyle(
                                            fontSize: 25.sp,
                                            color: Colors.grey,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 7.w,
                                    width: 7.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Utils.blockHeight),
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    child: Row(
                                      children: [
                                        Text(
                                          "2.3k+ Reviews",
                                          style: TextStyle(
                                            fontSize: 25.sp,
                                            color: Colors.grey,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 7.w,
                                    width: 7.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Utils.blockHeight),
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    child: Row(
                                      children: [
                                        Text(
                                          "2.3k + Sold",
                                          style: TextStyle(
                                            fontSize: 25.sp,
                                            color: Colors.grey,
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
                      ),
                    ),
                    SizedBox(height: 30.h),
                    FadeSlideAnimation(
                      animationController: _animationController,
                      fadeAnimation: _fadeAnimation3,
                      index: 3,
                      child: SizedBox(
                        height: 80.h,
                        width: double.infinity,
                        // color: Colors.black,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            const _Divide(),
                            Row(
                              children: const [
                                TabItem(label: "About Item"),
                                TabItem(label: "Reviews", isActive: false)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    FadeSlideAnimation(
                      animationController: _animationController,
                      fadeAnimation: _fadeAnimation4,
                      index: 4,
                      child: Container(
                        padding: EdgeInsets.only(top: Utils.padding),
                        // height: 200.h,
                        // color: Colors.grey,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: const [
                                Expanded(
                                  child: AboutItemRowChild(
                                      label: "Brand", value: "ChArmkpR"),
                                ),
                                Expanded(
                                  child: AboutItemRowChild(
                                      label: "Color", value: "Aprikot"),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              children: const [
                                Expanded(
                                  child: AboutItemRowChild(
                                      label: "Category", value: "Casual Shirt"),
                                ),
                                Expanded(
                                  child: AboutItemRowChild(
                                      label: "Material", value: "Polyester"),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              children: const [
                                Expanded(
                                  child: AboutItemRowChild(
                                      label: "Condition", value: "New"),
                                ),
                                Expanded(
                                  child: AboutItemRowChild(
                                      label: "Heavy", value: "200 g"),
                                ),
                              ],
                            ),
                            SizedBox(height: 50.h),
                          ],
                        ),
                      ),
                    ),
                    FadeSlideAnimation(
                      animationController: _animationController,
                      fadeAnimation: _fadeAnimation4,
                      index: 4,
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const _Divide(),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 50.h),
                                  Text(
                                    "Description: ",
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 30.h),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const ProductFeature(
                                            feature:
                                                "Long-sleeve dress shirt in classic fit featuring button-down collar made with original material"),
                                        const ProductFeature(
                                          feature: "Patch Pocket on Left Chest",
                                        ),
                                        const ProductFeature(
                                          feature:
                                              "Durable Combination Cotton Fabric",
                                        ),
                                        const ProductFeature(
                                          feature:
                                              "Comfortable and quality dress shirt",
                                        ),
                                        const ProductFeature(
                                          feature:
                                              "Go To Classic button down shirt for all special occassions",
                                        ),
                                        SizedBox(height: 30.h),
                                        Text(
                                          "Chat with us if there is anything you need to ask about the product or how the product ;)",
                                          maxLines: 2,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            height: 2.h,
                                            fontSize: 18.sp,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(height: 30.h),
                                        Row(
                                          children: [
                                            Text(
                                              "See less",
                                              style: TextStyle(
                                                fontSize: 18.sp,
                                                color: Utils.primaryColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(width: 5.w),
                                            RotatedBox(
                                              quarterTurns: 1,
                                              child: Icon(
                                                CupertinoIcons.back,
                                                color: Colors.grey,
                                                size: 20.w,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 50.h),
                                  const _Divide(),
                                ],
                              ),
                            ),
                            SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 50.h),
                                  Text(
                                    "Shipping Information: ",
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 30.h),
                                  const AboutItemRowChild(
                                    label: "Delivery",
                                    value: "Shipping from jakarta, indonesia",
                                  ),
                                  SizedBox(height: 20.h),
                                  const AboutItemRowChild(
                                    label: "Shipping",
                                    value: "FREE international Shipping ",
                                  ),
                                  SizedBox(height: 20.h),
                                  const AboutItemRowChild(
                                    label: "Arrive",
                                    value:
                                        "Estimated arrival on 25 - 27 Oct, 2022",
                                  ),
                                  SizedBox(height: 50.h),
                                  const _Divide(),
                                ],
                              ),
                            ),
                            SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 50.h),
                                  Text(
                                    "Seller Information: ",
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 40.h),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        // alignment: Alignment.bottomRight,
                                        children: [
                                          Container(
                                            height: 125.w,
                                            width: 125.w,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(200.w),
                                              color: const Color(0xfff0f0f0),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Thrifting",
                                                  style: TextStyle(
                                                    fontSize: 20.sp,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  "Store.   ",
                                                  style: TextStyle(
                                                    fontSize: 20.sp,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            // alignment: Alignment(.5, .5),
                                            bottom: 10.w,
                                            right: 5.w,
                                            child: Container(
                                              height: 30.w,
                                              width: 30.w,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        200.w),
                                                color:
                                                    Colors.grey.withOpacity(.4),
                                                border: Border.all(
                                                  width: 5,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(width: 30.w),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(height: 10.h),
                                            Text(
                                              "Thrifting_Store",
                                              style: TextStyle(
                                                fontSize: 25.sp,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 20.h),
                                            FittedBox(
                                              child: Text(
                                                "Active 5 Min ago   |   96.7% Positive Feedback",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 18.sp,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 20.h),
                                            Container(
                                              height: 50.h,
                                              width: 200.w,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  width: 1,
                                                  color: Utils.primaryColor,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(15.w),
                                              ),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    MyIcons.shop,
                                                    color: Utils.primaryColor,
                                                    size: 30.w,
                                                  ),
                                                  SizedBox(width: 10.w),
                                                  Text(
                                                    "Visit Store",
                                                    style: TextStyle(
                                                      fontSize: 19.sp,
                                                      color: Utils.primaryColor,
                                                      // fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 50.h),
                                ],
                              ),
                            ),
                            const RatingBoard(),
                            SizedBox(height: 40.h),
                            Text(
                              "Reviews with images & video ",
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                for (var i = 4; i >= 1; i--)
                                  Stack(
                                    children: [
                                      Container(
                                        height: 100.w,
                                        width: 100.w,
                                        margin: EdgeInsets.only(top: 20.h),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15.w),
                                          border: Border.all(
                                            width: 1.2,
                                            color: Colors.white,
                                          ),
                                          image: DecorationImage(
                                            image: AssetImage(
                                              "${"${path.split(".").first}_e$i"}.jpg",
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      if (i == 1)
                                        Container(
                                          height: 100.w,
                                          width: 100.w,
                                          margin: EdgeInsets.only(top: 20.h),
                                          decoration: BoxDecoration(
                                            color: Colors.black.withOpacity(.4),
                                            borderRadius:
                                                BorderRadius.circular(15.w),
                                            border: Border.all(
                                              width: 1.2,
                                              color: Colors.white,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "132+",
                                              style: TextStyle(
                                                fontSize: 22.sp,
                                                color: Colors.white,
                                                // fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                              ],
                            ),
                            SizedBox(height: 40.h),
                            const _Divide(),
                            SizedBox(height: 40.h),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Top Reviews",
                                          style: TextStyle(
                                            fontSize: 20.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 20.h),
                                        Text(
                                          "Showing 3 of 2.3k+ reviews",
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 60.h,
                                          width: 180.w,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(.2),
                                            border: Border.all(
                                              width: 1.1,
                                              color:
                                                  Colors.black.withOpacity(.3),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.w),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                "Popular",
                                                style: TextStyle(
                                                  fontSize: 17.sp,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              const SizedBox(),
                                              const RotatedBox(
                                                quarterTurns: 3,
                                                child: Icon(CupertinoIcons.back,
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const CommentTileItem(name: "Eran Y****r"),
                            const CommentTileItem(name: "Annie Le***hart"),
                            const CommentTileItem(name: "Levi A***man"),
                            SizedBox(height: 50.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 250.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 35.w,
                                        width: 35.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100.w),
                                          color: Colors.grey.withOpacity(.3),
                                        ),
                                        child: Center(
                                          child: Icon(
                                            CupertinoIcons.back,
                                            size: 20.w,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "1",
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          color: Utils.primaryColor,
                                        ),
                                      ),
                                      Text(
                                        "2",
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        "3",
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        ".....",
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Container(
                                        height: 35.w,
                                        width: 35.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100.w),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.3),
                                                spreadRadius: 1,
                                                blurRadius: 7,
                                                offset: const Offset(0, 3),
                                              ),
                                            ]),
                                        child: Center(
                                          child: RotatedBox(
                                            quarterTurns: 2,
                                            child: Icon(
                                              CupertinoIcons.back,
                                              size: 20.w,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  "See more",
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Utils.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 60.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recommendation",
                          style: TextStyle(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "See more",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Utils.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    GridView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: Utils.aspectRatio,
                        crossAxisSpacing: Utils.padding / 2,
                        mainAxisSpacing: Utils.padding,
                      ),
                      children: const [
                        GridItem(imagePath: Images.male_long_sleeve),
                        GridItem(imagePath: Images.shirt_1, isLiked: true),
                        GridItem(imagePath: Images.shirt_2),
                        GridItem(imagePath: Images.shirt_3),
                      ],
                    ),
                    SizedBox(height: 170.h),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: FadeSlideAnimation(
              animationController: _animationController,
              fadeAnimation: _fadeAnimation3,
              index: 3,
              child: Container(
                height: 170.h,
                width: Utils.blockWidth * 100,
                padding: EdgeInsets.symmetric(horizontal: Utils.padding),
                color: Colors.white,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  height: 80.h,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Total price",
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: Utils.blockWidth),
                          Text(
                            "\$18.00",
                            style: TextStyle(
                              fontSize: 37.sp,
                              fontWeight: FontWeight.bold,
                              color: Utils.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 80.h,
                        width: 270.w,
                        decoration: BoxDecoration(
                          color: Utils.primaryColor,
                          borderRadius: BorderRadius.circular(10.w),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 91.w,
                              height: double.infinity,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    MyIcons.cart_icon,
                                    size: 30.w,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "1",
                                    style: TextStyle(
                                      fontSize: 25.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: double.infinity,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Utils.buttonColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10.w),
                                    bottomRight: Radius.circular(10.w),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  "Buy Now",
                                  style: TextStyle(
                                    fontSize: 25.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductFeature extends StatelessWidget {
  final String feature;
  const ProductFeature({
    Key? key,
    required this.feature,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.only(left: 20.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "• ",
            style: TextStyle(
              fontSize: 18.sp,
              height: 2.h,
              color: Colors.grey,
            ),
          ),
          Expanded(
            child: Text(
              feature,
              maxLines: 2,
              textAlign: TextAlign.start,
              style: TextStyle(
                height: 2.h,
                fontSize: 18.sp,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Divide extends StatelessWidget {
  const _Divide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.grey.withOpacity(.2),
      thickness: 2,
      height: 2,
    );
  }
}

class AboutItemRowChild extends StatelessWidget {
  final String label;
  final String value;
  const AboutItemRowChild({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Text(
            "$label: ",
            style: TextStyle(
              fontSize: 19.sp,
              color: Colors.grey,
            ),
          ),
        ),
        Container(
          child: Text(
            "   $value",
            style: TextStyle(
              fontSize: 19.sp, fontWeight: FontWeight.bold,
              // color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}

class TabItem extends StatelessWidget {
  final String label;
  final bool isActive;
  const TabItem({
    Key? key,
    required this.label,
    this.isActive = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 220.w,
      alignment: const Alignment(-.4, 0.0),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border(
          bottom: BorderSide(
            width: 4.w,
            color: isActive ? Utils.primaryColor : Colors.transparent,
          ),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 25.sp,
          color: isActive ? Utils.primaryColor : Colors.grey,
        ),
      ),
    );
  }
}
