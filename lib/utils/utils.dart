import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/constants/data.dart';
import 'package:i_consent/widget/get_image.dart';
import 'package:i_consent/widget/get_spacing.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Utils {
  // Utility function to set the status bar color
  static void setStatusBarColor() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ));
  }

  static Future<void> logoutDialogBox(BuildContext context, Function() onTap) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            surfaceTintColor: Colors.transparent,
            backgroundColor: AppColor.whiteColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.px)),
            title: const GetSvgImage(
              AppData.logoutIcon,
              height: 8,
            ),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const GetTextW4S14(
                  'Do you want to logout?',
                  textAlign: TextAlign.center,
                ),
                const VerSpace(2),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Get.back(),
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(
                              AppColor.whiteColor),
                          foregroundColor: WidgetStateProperty.all<Color>(
                              AppColor.primaryColor),
                          overlayColor: WidgetStateProperty.all<Color>(
                            AppColor.primaryColor.withOpacity(0.3),
                          ),
                          side: WidgetStateProperty.all<BorderSide>(
                            const BorderSide(
                                color: AppColor.primaryColor, width: 1),
                          ),
                          shape: WidgetStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                        child: const GetTextW4S16(
                          'No',
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ),
                    const HorSpace(2),
                    Expanded(
                      child: MaterialButton(
                        color: AppColor.primaryColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.all(
                            Radius.circular(8),
                          ),
                        ),
                        onPressed: onTap,
                        child: const GetTextW4S16(
                          'Yes',
                          color: AppColor.whiteColor,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ));
      },
    );
  }

  static Future<void> deleteDialogBox(BuildContext context, Function() onTap) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            surfaceTintColor: Colors.transparent,
            backgroundColor: AppColor.whiteColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.px)),
            title: const GetSvgImage(
              AppData.deleteIcon,
              height: 8,
            ),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const GetTextW4S14(
                  'Do you want to Delete?',
                  textAlign: TextAlign.center,
                ),
                const VerSpace(2),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Get.back(),
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(
                              AppColor.whiteColor),
                          foregroundColor: WidgetStateProperty.all<Color>(
                              AppColor.primaryColor),
                          overlayColor: WidgetStateProperty.all<Color>(
                            AppColor.primaryColor.withOpacity(0.3),
                          ),
                          side: WidgetStateProperty.all<BorderSide>(
                            const BorderSide(
                                color: AppColor.primaryColor, width: 1),
                          ),
                          shape: WidgetStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                        child: const GetTextW4S16(
                          'Cancel',
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ),
                    const HorSpace(2),
                    Expanded(
                      child: MaterialButton(
                        color: AppColor.primaryColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.all(
                            Radius.circular(8),
                          ),
                        ),
                        onPressed: onTap,
                        child: const GetTextW4S16(
                          'Confirm',
                          color: AppColor.whiteColor,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ));
      },
    );
  }

  static final Uint8List kTransparentImage = Uint8List.fromList(<int>[
    0x89,
    0x50,
    0x4E,
    0x47,
    0x0D,
    0x0A,
    0x1A,
    0x0A,
    0x00,
    0x00,
    0x00,
    0x0D,
    0x49,
    0x48,
    0x44,
    0x52,
    0x00,
    0x00,
    0x00,
    0x01,
    0x00,
    0x00,
    0x00,
    0x01,
    0x08,
    0x06,
    0x00,
    0x00,
    0x00,
    0x1F,
    0x15,
    0xC4,
    0x89,
    0x00,
    0x00,
    0x00,
    0x0A,
    0x49,
    0x44,
    0x41,
    0x54,
    0x78,
    0x9C,
    0x63,
    0x00,
    0x01,
    0x00,
    0x00,
    0x05,
    0x00,
    0x01,
    0x0D,
    0x0A,
    0x2D,
    0xB4,
    0x00,
    0x00,
    0x00,
    0x00,
    0x49,
    0x45,
    0x4E,
    0x44,
    0xAE,
    0x42,
    0x60,
    0x82,
  ]);
}
