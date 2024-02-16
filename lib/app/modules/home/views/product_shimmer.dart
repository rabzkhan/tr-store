import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../constants/app_colors.dart';

Widget productShimmer() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
    child: GridView.builder(
        primary: false,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: 12,
        itemBuilder: (BuildContext ctx, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[200]!,
            highlightColor: Colors.grey[300]!,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: Colors.white,
                border: Border.all(color: AppColors.gray),
              ),
              child: Container(),
            ),
          );
        }),
  );
}
