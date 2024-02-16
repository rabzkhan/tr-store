import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constants/app_images.dart';

class CustomSnackBar {
  /// SnackBar ///

  // 1. success snackbar
  static showSnackBar({required String title, required String message, Duration? duration}) {
    Get.snackbar(
      title,
      message,
      duration: duration ?? const Duration(seconds: 2),
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      padding: const EdgeInsets.all(18),
      borderRadius: 50,
      colorText: Colors.white,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.TOP,
      icon: const Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: Icon(
          Icons.check_circle_outline_outlined,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  // 2. error snackbar
  static showErrorSnackBar({required String title, required String message, Color? color, Duration? duration}) {
    Get.snackbar(
      title,
      message,
      duration: duration ?? const Duration(seconds: 2),
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      padding: const EdgeInsets.all(18),
      borderRadius: 50,
      colorText: Colors.white,
      backgroundColor: color ?? Colors.redAccent,
      snackPosition: SnackPosition.TOP,
      icon: const Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: Icon(
          Icons.error_outline_outlined,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  /// Toast ///

  // 1. success toast
  static showToast({required String message, Color? color, Duration? duration}) {
    Get.rawSnackbar(
      duration: duration ?? const Duration(seconds: 2),
      margin: const EdgeInsets.only(top: 10, left: 18, right: 18),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      borderRadius: 50,
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.FLOATING,
      backgroundColor: color ?? const Color(0xff61cd80),
      icon: const Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: Icon(
          Icons.check_circle_outline_outlined,
          color: Colors.white,
          size: 22,
        ),
      ),
      onTap: (snack) {
        Get.closeAllSnackbars();
      },
      // overlayBlur: 0.8,
      message: message,
    );
  }

  // 2. info toast
  static showInfoToast({required String message, Color? color, Duration? duration}) {
    Get.rawSnackbar(
      duration: duration ?? const Duration(seconds: 2),
      margin: const EdgeInsets.only(top: 10, left: 18, right: 18),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      borderRadius: 50,
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.FLOATING,

      backgroundColor: color ?? const Color(0xff2E9AFE),

      onTap: (snack) {
        Get.closeAllSnackbars();
      },
      // overlayBlur: 0.8,
      message: message,
      icon: const Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: Icon(
          Icons.info_outline_rounded,
          color: Colors.white,
          size: 22,
        ),
      ),
    );
  }

  // 3. error toast
  static showErrorToast({required String message, Color? color, Duration? duration}) {
    Get.rawSnackbar(
      duration: duration ?? const Duration(seconds: 2),
      margin: const EdgeInsets.only(top: 10, left: 18, right: 18),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      borderRadius: 50,
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.FLOATING,
      backgroundColor: color ?? const Color(0xffd91b82),
      icon: const Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: Icon(
          Icons.error_outline_outlined,
          color: Colors.white,
          size: 22,
        ),
      ),
      onTap: (snack) {
        Get.closeAllSnackbars();
      },
      // overlayBlur: 0.8,
      message: message,
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
