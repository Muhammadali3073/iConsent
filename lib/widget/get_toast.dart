import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void showToast(BuildContext context, String message) {
  OverlayEntry overlayEntry;
  overlayEntry = OverlayEntry(
    builder: (BuildContext context) => Align(
      alignment: Alignment.bottomCenter,
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: EdgeInsets.only(bottom: 10.h),
          padding: EdgeInsets.symmetric(horizontal: 2.4.h, vertical: 1.4.h),
          decoration: BoxDecoration(
            color: AppColor.socialButtonColor.withOpacity(0.7),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: GetTextW4S13(message, color: AppColor.whiteColor),
        ),
      ),
    ),
  );
  Overlay.of(context).insert(overlayEntry);

  // Hide the toast after 2 seconds
  Future.delayed(const Duration(seconds: 2), () {
    overlayEntry.remove();
  });
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showScaffoldMessenger(
    BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: GetTextW4S13(text, color: AppColor.whiteColor),
      backgroundColor: AppColor.socialButtonColor,
      duration: const Duration(seconds: 2),
    ),
  );
}

SnackbarController showSnackBar(String text, bool isSuccess) {
  return Get.snackbar(
    isSuccess ? 'Success' : 'Error',
    text,
    backgroundColor: isSuccess ? AppColor.primaryColor : AppColor.errorColor,
    colorText: AppColor.whiteColor,
  );
}
