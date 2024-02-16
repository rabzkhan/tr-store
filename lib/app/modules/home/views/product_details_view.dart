import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:trstore/app/modules/home/model/product_model.dart';

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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product Details',
          style: bold.copyWith(fontSize: 16.sp),
        ),
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
                    Text(
                      "${widget.products.price?.toStringAsFixed(2)} BDT",
                      style: bold.copyWith(fontSize: 20.sp),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Quantity:",
                          style: semiBold.copyWith(fontSize: 14.sp),
                        ),
                        Row(
                          children: [
                            IconButton(onPressed: () {}, icon: const Icon(Icons.remove_circle)),
                            Text("0", style: bold),
                            IconButton(onPressed: () {}, icon: const Icon(Icons.add_circle)),
                          ],
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
