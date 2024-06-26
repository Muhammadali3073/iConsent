import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/view/auth/login_screen.dart';
import 'package:i_consent/view/auth/registration_screen/signup_screen.dart';
import 'package:i_consent/widget/get_button.dart';
import 'package:i_consent/widget/get_spacing.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardScreen extends StatelessWidget {
  OnboardScreen({super.key});

  final currentIndex = 0.obs;
  final pageController = PageController().obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: SizeConfig.height,
        width: SizeConfig.width,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  physics: const ScrollPhysics(),
                  controller: pageController.value,
                  onPageChanged: (value) {
                    currentIndex.value = value;
                  },
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox.shrink(),
                        const GetTextW3S14(
                          'Tailor your experience by setting your unique comfort levels and preferences.',
                          textAlign: TextAlign.center,
                        ).paddingSymmetric(horizontal: 2.h),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox.shrink(),
                        const GetTextW3S14(
                          'Use the app\'s reminder features to schedule regular check-ins and consent updates.',
                          textAlign: TextAlign.center,
                        ).paddingSymmetric(horizontal: 2.h),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  const VerSpace(3),
                  SmoothPageIndicator(
                    effect: SlideEffect(
                      activeDotColor: AppColor.primaryColor,
                      dotColor: Colors.black12,
                      dotHeight: 1.h,
                      dotWidth: 1.h,
                    ),
                    controller: pageController.value,
                    count: 2,
                  ).paddingOnly(bottom: 4.h),
                  SizedBox(
                    width: SizeConfig.width,
                    child: GetButton(
                      'Create an account',
                      onTap: () => Get.off(() => SignUpScreen()),
                    ).paddingSymmetric(horizontal: 2.h),
                  ),
                  GestureDetector(
                    onTap: () => Get.off(() => LoginScreen()),
                    child: RichText(
                      text: TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color: AppColor.darkBlackColor),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Login',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              color: AppColor.primaryColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ).paddingOnly(top: 2.h, bottom: 3.h),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
