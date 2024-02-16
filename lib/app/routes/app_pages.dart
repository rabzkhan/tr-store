import 'package:get/get.dart';
import '../modules/parent/parent_view.dart';
import '../modules/parent/parent_binding.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const PARENT = Routes.PARENT;
  static const HOME = Routes.HOME;

  static final routes = [
    /// NAV BAR
    GetPage(
      name: _Paths.PARENT,
      page: () => const ParentView(),
      binding: ParentBinding(),
    ),

    ///
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
