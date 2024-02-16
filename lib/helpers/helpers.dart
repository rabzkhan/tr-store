import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants/app_images.dart';

showToast(String message, [ToastGravity gravity = ToastGravity.CENTER]) {
  if (message != '') {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.grey.shade800,
      textColor: Colors.black,
      fontSize: 14.0,
    );
  }
}

class CustomNetworkImage extends StatelessWidget {
  CustomNetworkImage({
    super.key,
    required this.url,
    this.radius = 4,
    required this.height,
    required this.width,
  });

  final String url;
  num radius;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height.sp,
      width: width.sp,
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(radius.r),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: CircularProgressIndicator(
            color: Colors.grey.shade200,
            strokeWidth: 2,
          ),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        height: 300.sp,
        width: 300.sp,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xffF3F3F3),
          border: Border.all(color: Colors.white, width: 1),
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          AppImages.kNoImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
