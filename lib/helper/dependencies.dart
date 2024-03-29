import 'package:fooddelivery/controllers/cart_controller.dart';
import 'package:fooddelivery/controllers/popular_product_controller.dart';
import 'package:fooddelivery/data/api/api_client.dart';
import 'package:fooddelivery/data/repository/cart_repo.dart';
import 'package:fooddelivery/data/repository/popular_product_repo.dart';
import 'package:fooddelivery/utils/app_constants.dart';
import 'package:get/get.dart';

Future<void> init() async{
  String token="mine";
  //api client
  Get.lazyPut(()=>ApiClient(appBaseUrl:AppConstants.BASE_URL));
  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(()=>CartRepo());
  //controllesrs
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}