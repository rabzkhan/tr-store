import 'package:get/get.dart';
import 'package:trstore/app/modules/cart/controllers/cart_controller.dart';
import '../home/controllers/home_controller.dart';
import 'parent_controller.dart';

class ParentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ParentController>(
      () => ParentController(),
    );
    Get.lazyPut<CartController>(
      () => CartController(),
    );
  }
}
