import 'package:eisteintaste/modules/cart/controller/cart_controller.dart';
import 'package:eisteintaste/modules/cart/repository/cart_repository.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartBinding implements Bindings {
  @override
  void dependencies() {
    final SharedPreferences sharedPreferences = Get.find(); 
    Get.lazyPut<CartRepo>(() => CartRepo(sharedPreferences: sharedPreferences), fenix: true);
    Get.lazyPut<CartController>(() => CartController(), fenix: true);
  }  
}
