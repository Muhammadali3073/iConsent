import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/view/home/consent_activities_screen.dart';
import 'package:i_consent/widget/get_app_bar.dart';
import 'package:i_consent/widget/get_button.dart';
import 'package:i_consent/widget/get_padding_spacing.dart';
import 'package:i_consent/widget/get_spacing.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CreateConsentFormScreen extends StatelessWidget {
  const CreateConsentFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GetAppBar(
        title: 'Create Consent Form',
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
                const GetTextW5S16('This consent is for:')
                    .paddingOnly(top: 3.h, bottom: 2.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.circle,
                      size: 1.h,
                      color: AppColor.darkBlackColor,
                    ).paddingOnly(right: 2.h),
                    const GetTextW5S16(
                      'Single encounter',
                      color: AppColor.darkBlackColor,
                    ),
                  ],
                ),
                const VerSpace(2),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.circle,
                      size: 1.h,
                      color: AppColor.darkBlackColor,
                    ).paddingOnly(right: 2.h),
                    const GetTextW5S16(
                      'Casual friendship',
                      color: AppColor.darkBlackColor,
                    ),
                  ],
                ),
                const VerSpace(2),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.circle,
                      size: 1.h,
                      color: AppColor.darkBlackColor,
                    ).paddingOnly(right: 2.h),
                    const GetTextW5S16(
                      'Dating',
                      color: AppColor.darkBlackColor,
                    ),
                  ],
                ),
                const VerSpace(2),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.circle,
                      size: 1.h,
                      color: AppColor.darkBlackColor,
                    ).paddingOnly(right: 2.h),
                    const GetTextW5S16(
                      'Committed relationship',
                      color: AppColor.darkBlackColor,
                    ),
                  ],
                ),
                const VerSpace(2),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.circle,
                      size: 1.h,
                      color: AppColor.darkBlackColor,
                    ).paddingOnly(right: 2.h),
                    const GetTextW5S16(
                      'Married',
                      color: AppColor.darkBlackColor,
                    ),
                  ],
                ),
                const VerSpace(2),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.circle,
                      size: 1.h,
                      color: AppColor.darkBlackColor,
                    ).paddingOnly(right: 2.h),
                    const GetTextW5S16(
                      'Alternative lifestyle\n(poly-amorous, swingers)',
                      color: AppColor.darkBlackColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: GetButton(
        'Create',
        onTap: () {
          Get.off(
              () => ConsentActivitiesScreen(indexConsentActivities: RxInt(1)));
        },
      ).paddingOnly(
        right: 2.h,
        left: 2.h,
        bottom: 3.h,
      ),
    );
  }
}
