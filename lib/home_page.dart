import 'package:flutter/material.dart';
import 'package:moniepoint_test/utils/utils.dart';
import 'package:sliver_tools/sliver_tools.dart';

import 'widgets/widgets.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _opacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      body: Container(
        child: Stack(
          children: [
            ScrollConfiguration(
              behavior: const NoEffectScrollConfig(),
              child: CustomScrollView(
                slivers: [
                  SliverStack(
                    children: [
                      SliverPositioned.fill(
                        child: SliverPersistentHeader(
                          pinned: true,
                          delegate: SliverDelegateAppBar(
                            (op) {
                              _opacity = op;
                              WidgetsBinding.instance
                                  .addPostFrameCallback((timeStamp) {
                                setState(() {});
                              });
                            },
                            removeOpacity: true,
                          ),
                        ),
                      ),
                      SliverPositioned.fill(
                        child: SliverPersistentHeader(
                          // pinned: true,
                          delegate: SliverDelegateAppBar(
                            (op) {
                              _opacity = op;
                              WidgetsBinding.instance
                                  .addPostFrameCallback((timeStamp) {
                                setState(() {});
                              });
                            },
                            useMaxHeightAsMinHeight: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 14.h)),
                  SliverToBoxAdapter(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: Utils.padding),
                      height: 122.h,
                      // color: Colors.red,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          IconItem(
                            icon: MyIcons.category_icon,
                            label: "Category",
                          ),
                          IconItem(
                            icon: MyIcons.airplane_icon,
                            label: "Flight",
                          ),
                          IconItem(
                            icon: MyIcons.bill,
                            label: "Bill",
                          ),
                          IconItem(
                            icon: MyIcons.data_plan,
                            label: "Data Plan",
                          ),
                          IconItem(
                            icon: MyIcons.top_up,
                            label: "Top Up",
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 50.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            height: 5.w,
                            width: 15.w,
                            margin: EdgeInsets.only(right: 3.w),
                            decoration: BoxDecoration(
                              color: Utils.buttonColor,
                              borderRadius: BorderRadius.circular(50.w),
                            ),
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            height: 5.w,
                            width: 5.w,
                            margin: EdgeInsets.only(right: 3.w),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(.5),
                              borderRadius: BorderRadius.circular(50.w),
                            ),
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            height: 5.w,
                            width: 5.w,
                            margin: EdgeInsets.only(right: 3.w),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(.5),
                              borderRadius: BorderRadius.circular(50.w),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 14.h)),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: StickyAppBarDelegate(
                      height: 90.h,
                      child: Container(
                        width: Utils.blockWidth * 100,
                        height: 90.h,
                        color: const Color(0xffEDEEF0).withOpacity(1),
                        padding:
                            EdgeInsets.symmetric(horizontal: Utils.padding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Best Sale Products",
                              style: TextStyle(
                                fontSize: 28.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "See more",
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: Utils.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // SliverList(
                  //   delegate: SliverChildListDelegate(
                  //     [],
                  //   ),
                  // ),
                  SliverToBoxAdapter(
                    child: Container(
                      width: Utils.blockWidth * 100,
                      height: 1500.h,
                      color: const Color(0xffEDEEF0).withOpacity(.5),
                      padding: EdgeInsets.symmetric(horizontal: Utils.padding),
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: GridView(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: Utils.aspectRatio,
                            crossAxisSpacing: Utils.padding / 2,
                            mainAxisSpacing: Utils.padding,
                          ),
                          children: const [
                            GridItem(
                                changeColor: true,
                                imagePath: Images.male_long_sleeve),
                            GridItem(imagePath: Images.shirt_1, isLiked: true),
                            GridItem(imagePath: Images.shirt_2),
                            GridItem(imagePath: Images.shirt_3),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            MyAppBar(opacity: _opacity)
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 100.h,
        decoration: BoxDecoration(
          color: const Color(0xffEDEEF0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 100,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BottomIcon(
              icon: MyIcons.home_icon,
              label: "Home",
              color: Utils.primaryColor,
            ),
            const BottomIcon(icon: MyIcons.voucher_icon, label: "Voucher"),
            const BottomIcon(icon: MyIcons.wallet_icon_1, label: "Wallet"),
            BottomIcon(
                icon: MyIcons.settings, label: "Settings", additionalSize: 3.w),
          ],
        ),
      ),
    );
  }
}

class BottomIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;
  final double additionalSize;
  const BottomIcon({
    Key? key,
    this.color,
    this.additionalSize = 0.0,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: additionalSize + 40.w,
          color: color,
        ),
        SizedBox(height: 10.h),
        Text(
          label,
          style: TextStyle(
            fontSize: 17.sp,
          ),
        ),
      ],
    );
  }
}

class TopWidget extends StatelessWidget {
  const TopWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Utils.appBarMaxHeight,
      width: double.infinity,
      child: const Carousel(),
    );
  }
}

class Carousel extends StatefulWidget {
  const Carousel({
    Key? key,
  }) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel>
    with AutomaticKeepAliveClientMixin {
  late final PageController _pageController;
  int page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController()
      ..addListener(() {
        setState(() {
          page = _pageController.page!.round();
        });
      });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: [
        PageView(
          controller: _pageController,
          scrollBehavior: const NoEffectScrollConfig(),
          children: const [
            CarouselItem(
              imagePath: Images.hanger_white,
            ),
            CarouselItem(
              imagePath: Images.make_up,
              alignment: Alignment(1, -1),
              secondSlide: true,
            ),
          ],
        ),
        Positioned(
          top: Utils.appBarMaxHeight * .5,
          right: 100.w,
          // height: ,
          child: Row(
            children: [
              for (var i = 0; i < 3; i++)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  height: 5.w,
                  width: i == page ? 15.w : 5.w,
                  margin: EdgeInsets.only(right: 3.w),
                  decoration: BoxDecoration(
                    color: i == page
                        ? Utils.buttonColor
                        : Colors.grey.withOpacity(.5),
                    borderRadius: BorderRadius.circular(50.w),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
