import 'package:flutter/material.dart';
import 'package:fooddelivery/controllers/popular_product_controller.dart';
import 'package:fooddelivery/pages/home/cart/cart_page.dart';
import 'package:fooddelivery/pages/home/food/popular_food_detail.dart';
import 'package:fooddelivery/pages/home/food/recommended_food_detail.dart';
import 'package:fooddelivery/pages/home/food_page_body.dart';
import 'package:fooddelivery/pages/home/main_food_page.dart';
import 'package:fooddelivery/widgets/login.dart';
import 'package:fooddelivery/widgets/map.dart';
import 'package:fooddelivery/widgets/register.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MainFoodPage(),
    );
  }
}
