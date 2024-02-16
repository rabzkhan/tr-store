import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:trstore/app/modules/home/model/product_model.dart';
import '../../../../constants/app_urls.dart';
import '../../../service/api/dio_client.dart';
import '../../../service/network/exception_handler.dart';
import '../../../service/network/network_connectivity.dart';

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
