import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trstore/app/modules/home/views/product_details_view.dart';
import 'package:trstore/constants/app_colors.dart';
import 'package:trstore/constants/app_text.dart';
import 'package:trstore/helpers/helpers.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isProductListLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (controller.products.isEmpty) {
          return const Center(
            child: Text("No Products Available"),
          );
        }
        return RefreshIndicator(
          onRefresh: () async => await controller.getProductList(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.sp),
            child: GridView.builder(
              itemCount: controller.products.length,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.all(6.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  color: AppColors.canvasColor,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.litegray.withOpacity(0.5),
                      offset: const Offset(0, 0),
                      spreadRadius: 4,
                      blurRadius: 1,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    CustomNetworkImage(
                      url: controller.products[index].thumbnail ?? "",
                      height: 100.sp,
                      radius: 10.sp,
                      width: double.infinity,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  controller.products[index].title ?? '',
                                  style: semiBold,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                2.verticalSpace,
                                Text(
                                  controller.products[index].content ?? '',
                                  style: light.copyWith(fontSize: 12.sp),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${controller.products[index].price?.toStringAsFixed(2)} BDT",
                                  style: bold.copyWith(fontSize: 15.sp),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => ProductDetailsView(controller.products[index]));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12.r),
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(vertical: 3.sp, horizontal: 6.sp),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.shopping_bag,
                                          color: AppColors.canvasColor,
                                          size: 14.sp,
                                        ),
                                        3.horizontalSpace,
                                        Text(
                                          "Add",
                                          style: bold.copyWith(color: Colors.white, fontSize: 11.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
