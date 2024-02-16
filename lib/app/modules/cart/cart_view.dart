import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:trstore/app/modules/cart/controllers/cart_controller.dart';
import 'package:trstore/constants/app_text.dart';

import '../../../constants/app_colors.dart';
import '../../../helpers/helpers.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  CartController cartController = Get.find();
  @override
  void initState() {
    cartController.getCartItems();
    super.initState();
  }

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
              if (cartController.cartItems.isEmpty) {
                return Text("Your cart is empty ");
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: cartController.cartItems.length,
                  itemBuilder: (BuildContext context, int index) {
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
                                url: cartController.cartItems[index].imageUrl ?? "",
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
                                        cartController.cartItems[index].title ?? '',
                                        style: semiBold,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      2.verticalSpace,
                                      Text(
                                        cartController.cartItems[index].description ?? '',
                                        style: light.copyWith(fontSize: 12.sp),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                  10.verticalSpace,
                                  Text(
                                    "${cartController.cartItems[index].price?.toStringAsFixed(2)} BDT",
                                    style: bold.copyWith(fontSize: 14.sp),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(onPressed: () {}, icon: const Icon(Icons.remove_circle)),
                                          Text("0", style: bold),
                                          IconButton(onPressed: () {}, icon: const Icon(Icons.add_circle)),
                                        ],
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            cartController.deleteCartItems(cartController.cartItems[index].productId!);
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
