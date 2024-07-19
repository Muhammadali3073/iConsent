import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/utils/data.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/view/auth/registration_screen/add_new_module_screen.dart';
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
                Column(
                  children: List.generate(
                      AppData.consentFor.length,
                      (index) => InkWell(
                            hoverColor: Colors.transparent,
                            overlayColor: WidgetStateColor.transparent,
                            focusColor: Colors.transparent,
                            onTap: () =>
                                AppData.consentFor[index].isCheck!.value =
                                    !AppData.consentFor[index].isCheck!.value,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Obx(() => Container(
                                      decoration: BoxDecoration(
                                        color: AppData.consentFor[index]
                                                .isCheck!.value
                                            ? AppColor.primaryColor
                                            : AppColor.whiteColor,
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        border: Border.all(
                                          color: AppData.consentFor[index]
                                                  .isCheck!.value
                                              ? AppColor.primaryColor
                                              : AppColor.lightGreyColor
                                                  .withOpacity(0.7),
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.check,
                                        size: 1.6.h,
                                        color: AppData.consentFor[index]
                                                .isCheck!.value
                                            ? AppColor.whiteColor
                                            : AppColor.lightGreyColor
                                                .withOpacity(0.7),
                                      ).paddingAll(0.3.h),
                                    )),
                                const HorSpace(2),
                                GetTextW4S14(
                                    AppData.consentFor[index].title.toString())
                              ],
                            ).paddingOnly(bottom: 2.h),
                          )),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: GetButton(
        'Select Module',
        onTap: () {
          Get.to(() => const AddNewModuleScreen());
        },
      ).paddingOnly(
        right: 2.h,
        left: 2.h,
        bottom: 3.h,
      ),
    );
  }
}
