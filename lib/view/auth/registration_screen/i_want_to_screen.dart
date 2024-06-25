import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/utils/data.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/view/auth/registration_screen/cancel_agreement_screen.dart';
import 'package:i_consent/view/auth/registration_screen/choose_consent_screen.dart';
import 'package:i_consent/view/auth/registration_screen/create_consent_form_screen.dart';
import 'package:i_consent/view/bottom_nav_bar.dart';
import 'package:i_consent/widget/get_app_bar.dart';
import 'package:i_consent/widget/get_padding_spacing.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class IWantToScreen extends StatelessWidget {
  const IWantToScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GetAppBar(
        title: '',
        actions: [
          TextButton(
            onPressed: () => Get.offAll(
                () => MyBottomNavBar(selectedIndexBottomNavBar: RxInt(1))),
            child: const GetTextW4S14(
              'Skip',
              color: AppColor.primaryColor,
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: SizeConfig.height,
        width: SizeConfig.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: Spacing.only(right: 2, left: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GetTextW5S16('I want to')
                    .paddingOnly(top: 3.h, bottom: 2.h),
                Column(
                  children: List.generate(
                    3,
                    (index) => InkWell(
                      onTap: () => index == 0
                          ? Get.to(() => const CreateConsentFormScreen())
                          : index == 1
                              ? Get.to(() => const ChooseConsentScreen())
                              : Get.to(() => CancelAgreementScreen()),
                      child: Container(
                        width: SizeConfig.width,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColor.whiteColor,
                          borderRadius: const BorderRadiusDirectional.all(
                            Radius.circular(8),
                          ),
                          border: Border.all(
                            color: AppColor.primaryColor,
                            width: 0.1.h,
                          ),
                        ),
                        child: GetTextW4S16(
                          AppData.iWantToList[index].toString(),
                          color: AppColor.darkBlackColor,
                        ).paddingSymmetric(vertical: 1.2.h),
                      ).paddingOnly(bottom: 1.h),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
