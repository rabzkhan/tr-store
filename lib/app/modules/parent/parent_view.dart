// ignore_for_file: no_leading_underscores_for_local_identifiers, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_bag,
              color: AppColors.primary,
            ),
          )
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
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.litegray,
                        spreadRadius: 0,
                        blurRadius: 10.r,
                      ),
                    ],
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
                                  color: Colors.white,
                                  size: 25.sp,
                                ),
                              ),
                            ),
                            SizedBox(height: 2.sp),
                            Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
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
                              child: IconButton(
                                hoverColor: Colors.transparent,
                                onPressed: () {
                                  controller.onTap(1);
                                },
                                icon: Icon(
                                  Icons.shopping_bag,
                                  color: Colors.white,
                                  size: 25.sp,
                                ),
                              ),
                            ),
                            SizedBox(height: 2.sp),
                            Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
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
