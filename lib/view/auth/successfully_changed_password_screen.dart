import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/utils/data.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/view/auth/login_in_screen.dart';
import 'package:i_consent/view/bottom_nav_bar.dart';
import 'package:i_consent/widget/get_image.dart';
import 'package:i_consent/widget/get_padding_spacing.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SuccessfullyChangedPasswordScreen extends StatelessWidget {
  const SuccessfullyChangedPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.off(() => LoginScreen()),
            icon: const Icon(
              Icons.close,
              color: AppColor.darkBlackColor,
            )),
        scrolledUnderElevation: 0,
        backgroundColor: AppColor.bgColor,
      ),
      body: SizedBox(
        height: SizeConfig.height,
        width: SizeConfig.width,
        child: Padding(
          padding: Spacing.only(right: 3, left: 3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),
              Column(
                children: [
                  const GetTextBS28(
                    'Successfully\nChanged Password',
                    textAlign: TextAlign.center,
                  ).paddingOnly(bottom: 3.5.h),
                  const GetSvgImage(AppData.successIcon)
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => Get.off(() => const MyBottomNavBar()),
                child: Text(
                  'Go to Home',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: AppColor.primaryColor,
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
