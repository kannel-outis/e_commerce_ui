import 'package:flutter/material.dart';
import 'package:moniepoint_test/item_info_page.dart';
import 'package:moniepoint_test/testing_page.dart';
import 'utils/utils.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(600.0, 1350.8),
      // splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          builder: (context, child) {
            Utils.getBlockHeightAndBlockWidth(context);

            return MaterialApp(
              theme: ThemeData(
                primarySwatch: Colors.blue,
                fontFamily: "JosefinSans",
              ),
              home: const MyHomePage(title: "title"),
              // home: const TestingPage(),
              // home: const ItemInfoPage(),
            );
          },
        );
      },
    );
  }
}
