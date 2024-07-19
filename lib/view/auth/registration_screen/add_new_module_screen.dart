import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/utils/data.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/view/home/new_consent_form_screen.dart';
import 'package:i_consent/widget/get_app_bar.dart';
import 'package:i_consent/widget/get_button.dart';
import 'package:i_consent/widget/get_spacing.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:i_consent/widget/get_toast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddNewModuleScreen extends StatelessWidget {
  const AddNewModuleScreen({super.key, this.isModify});

  final bool? isModify;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GetAppBar(
        title: 'Add new module',
        centerTitle: true,
      ),
      body: SizedBox(
        height: SizeConfig.height,
        width: SizeConfig.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GetTextW5S16(
                      'Select the consent activities to add to this consent form.')
                  .paddingSymmetric(horizontal: 1.5.h, vertical: 1.h),
              Column(
                children: List.generate(
                  AppData.consentFormData.length,
                  (index) => Obx(
                    () => InkWell(
                      hoverColor: Colors.transparent,
                      overlayColor: WidgetStateColor.transparent,
                      focusColor: Colors.transparent,
                      onTap: () => AppData.consentFormData[index].isSkip.value =
                          !AppData.consentFormData[index].isSkip.value,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Obx(
                            () => Container(
                              decoration: BoxDecoration(
                                color:
                                    AppData.consentFormData[index].isSkip.value
                                        ? AppColor.primaryColor
                                        : AppColor.whiteColor,
                                borderRadius: BorderRadius.circular(4.0),
                                border: Border.all(
                                  color: AppData
                                          .consentFormData[index].isSkip.value
                                      ? AppColor.primaryColor
                                      : AppColor.lightGreyColor
                                          .withOpacity(0.7),
                                ),
                              ),
                              child: Icon(
                                Icons.check,
                                size: 1.6.h,
                                color: AppData
                                        .consentFormData[index].isSkip.value
                                    ? AppColor.whiteColor
                                    : AppColor.lightGreyColor.withOpacity(0.7),
                              ).paddingAll(0.3.h),
                            ),
                          ),
                          const HorSpace(2),
                          GetTextW4S14(
                            AppData.consentFormData[index].type.toString(),
                          )
                        ],
                      ).paddingOnly(left: 2.h, right: 2.h, bottom: 2.h),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GetButton(
        'Confirm',
        onTap: () {
          if (isModify == true) {
            Get.back();
            showSnackBar('New modules added', true);
          } else {
            Get.to(() => NewConsentFormScreen());
          }
        },
      ).paddingOnly(
        right: 2.h,
        left: 2.h,
        bottom: 3.h,
      ),
    );
  }
}
