// ignore_for_file: no_leading_underscores_for_local_identifiers, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trstore/app/modules/cart/controllers/cart_controller.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_text.dart';
import 'parent_controller.dart';

class ParentView extends GetView<ParentController> {
  const ParentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "TR STORE",
          style: bold.copyWith(
            fontSize: 20.sp,
            color: AppColors.primary,
          ),
        ),
        actions: [
          Obx(() {
            if (controller.selectedIndex == 1) {
              return const SizedBox();
            }
            return Stack(
              children: [
                IconButton(
                  onPressed: () {
                    controller.selectedIndex.value = 1;
                  },
                  icon: const Icon(
                    Icons.shopping_bag,
                    color: AppColors.primary,
                  ),
                ),
                Get.find<CartController>().cartItems.isNotEmpty
                    ? Positioned(
                        top: 6.sp,
                        right: 6.sp,
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          padding: EdgeInsets.all(6.sp),
                          child: Text(
                            Get.find<CartController>().cartItems.length.toString(),
                            style: bold.copyWith(color: Colors.white, fontSize: 10.sp),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            );
          })
        ],
      ),
      body: Obx(
        () => controller.navigation[controller.selectedIndex.value],
      ),
      bottomNavigationBar: Obx(() => Stack(
            children: [
              Positioned(
                bottom: 20.h,
                left: 0,
                right: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 65.w),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 75.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        /// ITEM 1
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 40.h,
                              width: 40.w,
                              child: IconButton(
                                hoverColor: Colors.transparent,
                                onPressed: () {
                                  controller.onTap(0);
                                },
                                icon: Icon(
                                  Icons.home,
                                  color: controller.selectedIndex.value == 0 ? Colors.white : Colors.grey.shade100,
                                  size: 25.sp,
                                ),
                              ),
                            ),
                            SizedBox(height: 2.sp),
                            Container(
                              height: 4.h,
                              width: 30.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(4.r)),
                                color: controller.selectedIndex.value == 0 ? Colors.white : Colors.transparent,
                              ),
                            ),
                          ],
                        ),

                        /// ITEM 2
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 40.h,
                              width: 40.w,
                              child: Stack(
                                children: [
                                  IconButton(
                                    hoverColor: Colors.transparent,
                                    onPressed: () {
                                      controller.onTap(1);
                                    },
                                    icon: Icon(
                                      Icons.shopping_bag,
                                      color: controller.selectedIndex.value == 1 ? Colors.white : Colors.grey.shade100,
                                      size: 25.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 2.sp),
                            Container(
                              height: 4.h,
                              width: 30.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(4.r)),
                                color: controller.selectedIndex.value == 1 ? Colors.white : Colors.transparent,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
