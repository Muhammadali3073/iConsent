import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/utils/data.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/view/auth/location_screen.dart';
import 'package:i_consent/widget/get_app_bar.dart';
import 'package:i_consent/widget/get_button.dart';
import 'package:i_consent/widget/get_image.dart';
import 'package:i_consent/widget/get_padding_spacing.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:i_consent/widget/get_text_form_field.dart';
import 'package:i_consent/widget/get_toast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GenderScreen extends StatelessWidget {
  GenderScreen({super.key});

  final TextEditingController genderController = TextEditingController();
  final selectedIndexGender = 6.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GetAppBar(
        title: 'Gender',
        actions: [
          TextButton(
            onPressed: () {
              genderController.clear();
              selectedIndexGender.value = 6;
              Get.to(() => LocationScreen());
            },
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
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const GetTextW5S16('I am a')
                      .paddingOnly(top: 3.h, bottom: 2.h),
                  Column(
                    children: List.generate(
                      5,
                      (index) => InkWell(
                        onTap: () => selectedIndexGender.value = index,
                        child: Container(
                          width: SizeConfig.width,
                          decoration: BoxDecoration(
                            color: selectedIndexGender.value == index
                                ? AppColor.primaryColor
                                : AppColor.whiteColor,
                            borderRadius: const BorderRadiusDirectional.all(
                              Radius.circular(8),
                            ),
                            border: Border.all(
                              color: selectedIndexGender.value == index
                                  ? AppColor.primaryColor
                                  : AppColor.lightGreyColor,
                              width: 0.1.h,
                            ),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 5.h,
                                child: AppData.genderList[index].type ==
                                            'Male' ||
                                        AppData.genderList[index].type ==
                                            'Female'
                                    ? GetSvgImage(
                                        AppData.genderList[index].icon
                                            .toString(),
                                        color:
                                            selectedIndexGender.value == index
                                                ? AppColor.whiteColor
                                                : AppColor.darkBlackColor,
                                      )
                                    : GetAssetImage(
                                        AppData.genderList[index].icon
                                            .toString(),
                                        color:
                                            selectedIndexGender.value == index
                                                ? AppColor.whiteColor
                                                : AppColor.darkBlackColor,
                                        height:
                                            AppData.genderList[index].type ==
                                                    'Non-Binary'
                                                ? 0.3.h
                                                : 0.4.h,
                                      ),
                              ),
                              GetTextW4S16(
                                AppData.genderList[index].type.toString(),
                                color: selectedIndexGender.value == index
                                    ? AppColor.whiteColor
                                    : AppColor.darkBlackColor,
                              ).paddingSymmetric(vertical: 1.4.h),
                            ],
                          ),
                        ).paddingOnly(bottom: 1.h),
                      ),
                    ),
                  ),
                  GetTextFormField(
                    'Other',
                    controller: genderController,
                    onTap: () => selectedIndexGender.value = 6,
                  ).paddingOnly(bottom: 1.h),
                  InkWell(
                    onTap: () => selectedIndexGender.value = 5,
                    child: Container(
                      width: SizeConfig.width,
                      decoration: BoxDecoration(
                          color: selectedIndexGender.value == 5
                              ? AppColor.primaryColor
                              : AppColor.whiteColor,
                          borderRadius: const BorderRadiusDirectional.all(
                            Radius.circular(8),
                          ),
                          border: Border.all(
                              color: selectedIndexGender.value == 5
                                  ? AppColor.primaryColor
                                  : AppColor.lightGreyColor,
                              width: 0.1.h)),
                      child: GetTextW4S16(
                        'Prefer not to say',
                        color: selectedIndexGender.value == 5
                            ? AppColor.whiteColor
                            : AppColor.darkBlackColor,
                      ).paddingSymmetric(vertical: 1.4.h, horizontal: 1.6.h),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: GetButton('Next', onTap: () {
        if (genderController.text.isNotEmpty || selectedIndexGender.value < 6) {
          Get.to(() => LocationScreen());
        } else {
          showSnackBar('Please select at least one item before next.', false);
        }
      }).paddingOnly(
        right: 2.h,
        left: 2.h,
        bottom: 3.h,
      ),
    );
  }
}
