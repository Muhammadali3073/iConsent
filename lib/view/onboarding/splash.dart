import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/constants/data.dart';
import 'package:i_consent/view/onboarding/onboarding_screen.dart';
import 'package:i_consent/widget/get_button.dart';
import 'package:i_consent/widget/get_image.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: double.infinity,
              child: GetAssetImage(
                AppData.splashImage,
                height: 9.h,
                boxFit: BoxFit.contain,
              )),
          const GetTextW3S14(
            'iConsent is your go-to for ensuring every intimate moment is safe and consensual. Prioritize respect and communication in every experience!',
            color: AppColor.whiteColor,
            textAlign: TextAlign.center,
          ).paddingSymmetric(horizontal: 3.8.h),
          GetButton(
            'Get Started',
            buttonColor: AppColor.whiteColor,
            textColor: AppColor.primaryColor,
            onTap: () => Get.off(() => const OnboardScreen()),
          ).paddingOnly(right: 3.h, left: 3.h, bottom: 3.h),
        ],
      ),
    );
  }
}
