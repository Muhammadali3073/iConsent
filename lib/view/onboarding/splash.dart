import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/utils/data.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
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
      body: SizedBox(
        height: SizeConfig.height,
        width: SizeConfig.width,
        child: Column(
          children: [
            SizedBox(
                height: SizeConfig.height / 1.3,
                width: SizeConfig.width,
                child: const GetAssetImage(
                  AppData.splashImage,
                  boxFit: BoxFit.contain,
                )),
            const Spacer(),
            Column(
              children: [
                const GetTextW3S14(
                  'iConsent is your go-to for ensuring every intimate moment is safe and consensual. Prioritize respect and communication in every experience!',
                  color: AppColor.whiteColor,
                  textAlign: TextAlign.center,
                ).paddingSymmetric(
                  horizontal: 2.h,
                ),
                SizedBox(
                  width: SizeConfig.width,
                  child: GetButton(
                    'Get Started',
                    buttonColor: AppColor.whiteColor,
                    textColor: AppColor.primaryColor,
                    onTap: () => Get.off(() => OnboardScreen()),
                  ).paddingOnly(right: 2.h, left: 2.h, bottom: 3.h, top: 3.h),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
