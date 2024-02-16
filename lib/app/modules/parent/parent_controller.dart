import 'package:get/get.dart';
import 'package:trstore/app/modules/cart/cart_view.dart';
import '../home/views/home_view.dart';

class ParentController extends GetxController {
  List navigation = [
    const HomeView(),
    const CartView(),
  ];
  RxInt selectedIndex = 0.obs;

  void onTap(int index) {
    selectedIndex.value = index;
  }
}
