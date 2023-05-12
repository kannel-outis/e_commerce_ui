// import 'package:flutter/material.dart';
// import 'package:moniepoint_test/utils/utils.dart';
// import 'package:moniepoint_test/widgets/fade_slide_animation.dart';

// class TestingPage extends StatefulWidget {
//   const TestingPage({super.key});

//   @override
//   State<TestingPage> createState() => _TestingPageState();
// }

// class _TestingPageState extends State<TestingPage>
//     with TickerProviderStateMixin {
//   late final AnimationController _animationController;
//   late final AnimationController _animationController2;
//   late final AnimationController _animationController3;
//   late final CurvedAnimation _curve;
//   late final CurvedAnimation _curve2;
//   late final CurvedAnimation _curve3;
//   final int duration = 300;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: duration),
//     );
//     _curve =
//         CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
//     _animationController2 = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: duration),
//     );
//     _curve2 =
//         CurvedAnimation(parent: _animationController2, curve: Curves.easeInOut);
//     _animationController3 = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: duration),
//     );
//     _curve3 =
//         CurvedAnimation(parent: _animationController3, curve: Curves.easeInOut);
//     // _animationController.forward();
//   }

//   void _animate(
//     Future<void> Function() first,
//     Future<void> Function() second,
//     Future<void> Function() third,
//   ) async {
//     // first();
//     // Future.delayed(
//     //   Duration(milliseconds: duration * 2),
//     //   () {
//     //     second();
//     //   },
//     // );
//     // Future.delayed(
//     //   Duration(milliseconds: duration * 3),
//     //   () {
//     //     third();
//     //   },
//     // );
//     first().then(
//       (value) async => await second().then(
//         (value) async => await third(),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     _animationController2.dispose();
//     _animationController3.dispose();
//     super.dispose();
//   }

//   void ani() {
//     _animationController.reset();
//     _animationController2.reset();
//     _animationController3.reset();
//     _animate(
//       () => _animationController.forward(from: 0.0),
//       () => _animationController2.forward(from: 0.0),
//       () => _animationController3.forward(from: 0.0),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     // _animate(() {
//     //   _animationController.reset();
//     //   _animationController2.reset();
//     //   _animationController3.reset();
//     //   _animationController.forward();
//     // }, () {
//     //   _animationController2.forward();
//     // }, () {
//     //   _animationController3.forward();
//     // });
//     ani();
//     // _animationController.forward(from: 0.0).then(
//     //       (value) => _animationController2.forward(from: 0.0),
//     //     );

//     return Scaffold(
//       body: SizedBox(
//         width: double.infinity,
//         child: Row(
//           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               child: Column(
//                 children: [
//                   FadeSlideAnimation(
//                     animationController: _animationController,
//                     curve: _curve,
//                     child: Container(
//                       height: 200,
//                       width: 200,
//                       color: Colors.red,
//                     ),
//                   ),
//                   SizedBox(height: 20.h),
//                   FadeSlideAnimation(
//                     animationController: _animationController2,
//                     curve: _curve2,
//                     child: Container(
//                       height: 200,
//                       width: 200,
//                       color: Colors.red,
//                     ),
//                   ),
//                   SizedBox(height: 20.h),
//                   FadeSlideAnimation(
//                     animationController: _animationController3,
//                     curve: _curve3,
//                     child: Container(
//                       height: 200,
//                       width: 200,
//                       color: Colors.red,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Container(
//               child: Column(
//                 children: [
//                   FadeSlideAnimation(
//                     animationController: _animationController,
//                     // curve: _curve,
//                     child: Container(
//                       height: 200,
//                       width: 200,
//                       color: Colors.red,
//                     ),
//                   ),
//                   SizedBox(height: 20.h),
//                   FadeSlideAnimation(
//                     animationController: _animationController2,
//                     // curve: _curve2,
//                     child: Container(
//                       height: 200,
//                       width: 200,
//                       color: Colors.red,
//                     ),
//                   ),
//                   SizedBox(height: 20.h),
//                   FadeSlideAnimation(
//                     animationController: _animationController3,
//                     // curve: _curve3,
//                     child: Container(
//                       height: 200,
//                       width: 200,
//                       color: Colors.red,
//                     ),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
