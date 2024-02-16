import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trstore/app/modules/cart/controllers/cart_controller.dart';
import 'package:trstore/constants/app_images.dart';
import 'package:trstore/constants/app_text.dart';

import '../../../constants/app_colors.dart';
import '../../../helpers/helpers.dart';
import 'models/cart_model.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Shooping Cart",
              style: bold.copyWith(fontSize: 16.sp),
            ),
            20.verticalSpace,
            Obx(() {
              if (controller.cartItems.isEmpty) {
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppImages.kEmptyCar,
                        height: 100.sp,
                      ),
                      Text(
                        "Your cart is empty!",
                        style: semiBold,
                      ),
                    ],
                  ),
                );
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: controller.cartItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    int productPrice = controller.cartItems[index].price! * controller.cartItems[index].quantity!;
                    return Container(
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
                      child: Padding(
                        padding: EdgeInsets.all(4.sp),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: CustomNetworkImage(
                                url: controller.cartItems[index].imageUrl ?? "",
                                height: 140.sp,
                                radius: 10.sp,
                                width: double.infinity,
                              ),
                            ),
                            6.horizontalSpace,
                            Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        controller.cartItems[index].title ?? '',
                                        style: semiBold,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      2.verticalSpace,
                                      Text(
                                        controller.cartItems[index].description ?? '',
                                        style: light.copyWith(fontSize: 12.sp),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                  10.verticalSpace,
                                  Text(
                                    "$productPrice BDT",
                                    style: bold.copyWith(fontSize: 14.sp),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                int currentQuantiy = controller.cartItems[index].quantity!;
                                                if (currentQuantiy > 1) {
                                                  currentQuantiy--;
                                                }
                                                CartModel cartItem = CartModel(
                                                  productId: controller.cartItems[index].productId,
                                                  title: controller.cartItems[index].title,
                                                  description: controller.cartItems[index].description,
                                                  imageUrl: controller.cartItems[index].imageUrl,
                                                  price: controller.cartItems[index].price,
                                                  quantity: currentQuantiy,
                                                );
                                                Get.find<CartController>().updateCart(cartItem);
                                              },
                                              icon: const Icon(Icons.remove_circle)),
                                          Text(controller.cartItems[index].quantity.toString(), style: bold),
                                          IconButton(
                                              onPressed: () {
                                                int currentQuantiy = controller.cartItems[index].quantity!;
                                                currentQuantiy++;
                                                CartModel cartItem = CartModel(
                                                  productId: controller.cartItems[index].productId,
                                                  title: controller.cartItems[index].title,
                                                  description: controller.cartItems[index].description,
                                                  imageUrl: controller.cartItems[index].imageUrl,
                                                  price: controller.cartItems[index].price!,
                                                  quantity: currentQuantiy,
                                                );
                                                Get.find<CartController>().updateCart(cartItem);
                                              },
                                              icon: const Icon(Icons.add_circle)),
                                        ],
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            controller.deleteCartItems(controller.cartItems[index].productId!);
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.redAccent.withOpacity(0.7),
                                          )),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
