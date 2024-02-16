import 'package:get/get.dart';
import '../home/views/home_view.dart';

class ParentController extends GetxController {
  List navigation = [
    const HomeView(),
  ];
  RxInt selectedIndex = 0.obs;

  void onTap(int index) {
    selectedIndex.value = index;
  }
}
