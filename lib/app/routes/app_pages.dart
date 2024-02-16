import 'package:get/get.dart';
import '../modules/cart/bindings/cart_binding.dart';
import '../modules/cart/cart_view.dart';
import '../modules/parent/parent_view.dart';
import '../modules/parent/parent_binding.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const PARENT = Routes.PARENT;
  static const HOME = Routes.HOME;
  static const CART = Routes.CART;

  static final routes = [
    /// Parent
    GetPage(
      name: _Paths.PARENT,
      page: () => const ParentView(),
      binding: ParentBinding(),
    ),

    /// Home
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),

    /// Cart
    GetPage(
      name: _Paths.CART,
      page: () => const CartView(),
      binding: CartBinding(),
    ),
  ];
}
