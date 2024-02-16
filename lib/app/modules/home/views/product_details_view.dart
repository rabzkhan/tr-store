import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trstore/app/modules/cart/controllers/cart_controller.dart';
import 'package:trstore/app/modules/cart/models/cart_model.dart';
import 'package:trstore/app/modules/home/model/product_model.dart';
import 'package:trstore/app/modules/parent/parent_controller.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_text.dart';
import '../../../../helpers/helpers.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView(this.products, {super.key});
  final Products products;
  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product Details',
          style: bold.copyWith(fontSize: 16.sp),
        ),
        actions: [
          Obx(() {
            if (Get.find<ParentController>().selectedIndex == 1) {
              return const SizedBox();
            }
            return Stack(
              children: [
                IconButton(
                  onPressed: () {
                    Get.find<ParentController>().selectedIndex.value = 1;
                    Get.back();
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
      body: Column(
        children: [
          CustomNetworkImage(
            url: widget.products.image ?? '',
            height: 400.sp,
            radius: 10.sp,
            width: double.infinity,
          ),
          Padding(
            padding: EdgeInsets.all(12.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.products.title ?? '',
                      style: semiBold.copyWith(fontSize: 18.sp),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    10.verticalSpace,
                    Text(
                      widget.products.content ?? '',
                      style: light.copyWith(fontSize: 14.sp),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    15.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${widget.products.price?.toStringAsFixed(2)} BDT",
                          style: bold.copyWith(fontSize: 20.sp),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        InkWell(
                          onTap: () async {
                            CartModel cartItem = CartModel(
                                productId: widget.products.id,
                                title: widget.products.title,
                                description: widget.products.content,
                                imageUrl: widget.products.thumbnail,
                                price: widget.products.price,
                                quantity: 1);
                            Get.find<CartController>().addToCart(cartItem);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.primary.withOpacity(0.5),
                              borderRadius: BorderRadius.all(
                                Radius.circular(16.r),
                              ),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 6.sp, horizontal: 8.sp),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.shopping_bag,
                                  color: AppColors.canvasColor,
                                  size: 18.sp,
                                ),
                                3.horizontalSpace,
                                Text(
                                  "Add To Cart",
                                  style: bold.copyWith(color: Colors.white, fontSize: 14.sp),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
