import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/utils/data.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/view/auth/registration_screen/add_new_module_screen.dart';
import 'package:i_consent/view/auth/registration_screen/link_consent_screen.dart';
import 'package:i_consent/view/home/confirmation_details_screen.dart';
import 'package:i_consent/view/home/consent_activities_screen.dart';
import 'package:i_consent/widget/get_app_bar.dart';
import 'package:i_consent/widget/get_button.dart';
import 'package:i_consent/widget/get_spacing.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:i_consent/widget/get_toast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ConsentFormScreen extends StatelessWidget {
  final bool isChoose;

  const ConsentFormScreen({
    super.key,
    this.isChoose = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GetAppBar(
        title: 'Consent Form',
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.close),
        ),
        actions: [
          TextButton(
            onPressed: () =>
                Get.to(() => const AddNewModuleScreen(isModify: true)),
            child: const GetTextW4S12(
              'Add Module',
              color: AppColor.primaryColor,
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: SizeConfig.height,
        width: SizeConfig.width,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: AppData.consentFormData.length,
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 1.h),
          itemBuilder: (context, index) {
            return Obx(
              () => AppData.consentFormData[index].isSkip.value
                  ? Column(
                      children: [
                        const VerSpace(1),
                        SizedBox(
                          width: SizeConfig.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GetTextW5S16(AppData
                                      .consentFormData[index].type
                                      .toString()),
                                  GestureDetector(
                                    onTap: () => Get.to(
                                      () => ConsentActivitiesScreen(
                                        indexConsentActivities:
                                            RxInt(index + 1),
                                        isEdit: true,
                                      ),
                                    ),
                                    child: const GetTextW4S14(
                                      'Edit',
                                      color: AppColor.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                              const VerSpace(0.5),
                              Column(
                                children: List.generate(
                                  AppData.consentFormData[index]
                                      .consentActivitiesCheck!.length,
                                  (i) => Obx(
                                    () => AppData
                                            .consentFormData[index]
                                            .consentActivitiesCheck![i]
                                            .isCheck!
                                            .value
                                        ? Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Icon(
                                                Icons.check,
                                                color: AppColor.primaryColor,
                                                size: 2.h,
                                              ),
                                              const HorSpace(0.5),
                                              GetTextW4S14(AppData
                                                  .consentFormData[index]
                                                  .consentActivitiesCheck![i]
                                                  .title
                                                  .toString()),
                                            ],
                                          )
                                        : const SizedBox.shrink(),
                                  ),
                                ),
                              ),
                              const VerSpace(1),
                            ],
                          ).paddingSymmetric(horizontal: 2.h),
                        ),
                        Divider(
                          color: AppColor.lightGreyColor.withOpacity(0.2),
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
            );
          },
        ),
      ),
      bottomNavigationBar:
          // isChoose ?
          _buildAddNewModule(context),
      // : _buildLink(context),
    );
  }

  // Widget _buildConfirm(BuildContext context) {
  //   return GetButton(
  //     'Confirm',
  //     onTap: () => Get.to(() => ConfirmationDetailsScreen()),
  //   ).paddingOnly(
  //     right: 3.w,
  //     left: 3.w,
  //     bottom: 2.h,
  //   );
  // }

  Widget _buildAddNewModule(BuildContext context) {
    return GetButton(
      'Save Consent Form',
      onTap: () {
        Get.back();
        Get.back();
        showSnackBar('Saved Consent Form Successfully', true);
      },
    ).paddingOnly(
      right: 3.w,
      left: 3.w,
      bottom: 2.h,
    );
  }

// Widget _buildLink(BuildContext context) {
//   return GetButton(
//     'Link this consent',
//     onTap: () => Get.to(() => ConfirmationDetailsScreen()),
//   ).paddingOnly(
//     right: 3.w,
//     left: 3.w,
//     bottom: 2.h,
//   );
// }
}
