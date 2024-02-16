import 'package:get/get.dart';
import '../../../../constants/app_urls.dart';
import '../../../service/api/dio_client.dart';
import '../../../service/network/exception_handler.dart';
import '../../../service/network/network_connectivity.dart';
import '../model/product_model.dart';

class HomeController extends GetxController with ExceptionHandler {
  RxBool isProductListLoading = false.obs;
  RxBool isProductDetailsLoading = false.obs;

  RxList<Products> products = <Products>[].obs;

  getProductList() async {
    if (await NetworkConnectivity.isNetworkAvailable()) {
      isProductListLoading.value = true;
      var response = await DioClient()
          .get(
            url: AppUrls.productDetails,
          )
          .catchError(handleError);

      if (response == null) return;

      products.assignAll((response as List).map((e) => Products.fromJson(e)).toList());
      isProductListLoading.value = false;
    }
  }

  @override
  void onInit() {
    getProductList();
    super.onInit();
  }
}
