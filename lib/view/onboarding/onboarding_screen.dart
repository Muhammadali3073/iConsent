import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/view/auth/login_in_screen.dart';
import 'package:i_consent/view/auth/sign_up_screen.dart';
import 'package:i_consent/widget/get_button.dart';
import 'package:i_consent/widget/get_spacing.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var pageController = PageController().obs;

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
                    currentIndex = value;
                  },
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox.shrink(),
                        const GetTextW4S14(
                          'Tailor your experience by setting your unique comfort levels and preferences.',
                          textAlign: TextAlign.center,
                        ).paddingSymmetric(horizontal: 3.h),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox.shrink(),
                        const GetTextW4S14(
                          'Use the app\'s reminder features to schedule regular check-ins and consent updates.',
                          textAlign: TextAlign.center,
                        ).paddingSymmetric(horizontal: 3.h),
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
                  GetButton(
                    'Create an account',
                    onTap: () => Get.off(() => SignUpScreen()),
                  ).paddingSymmetric(horizontal: 3.h),
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
                  ).paddingOnly(top: 2.h, bottom: 2.h),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
