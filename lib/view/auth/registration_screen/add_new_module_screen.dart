import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/utils/data.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/view/home/consent_activities_screen.dart';
import 'package:i_consent/widget/get_app_bar.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddNewModuleScreen extends StatelessWidget {
  const AddNewModuleScreen({super.key});

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
              Column(
                children: List.generate(
                  AppData.consentFormData.length,
                  (index) => InkWell(
                    onTap: () => Get.to(
                      () => ConsentActivitiesScreen(
                        indexConsentActivities: RxInt(index + 1),
                        isEdit: true,
                      ),
                    ),
                    child: Obx(
                      () => AppData.consentFormData[index].isSkip.value == false
                          ? const SizedBox.shrink()
                          : Column(
                              children: [
                                SizedBox(
                                  width: SizeConfig.width,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GetTextW5S16(
                                        AppData.consentFormData[index].type
                                            .toString(),
                                        color: AppColor.darkBlackColor,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: AppColor.darkBlackColor,
                                        size: 1.5.h,
                                      )
                                    ],
                                  ),
                                ).paddingOnly(
                                    left: 2.h,
                                    right: 2.h,
                                    top: 1.h,
                                    bottom: 1.h),
                                Divider(
                                  height: 0,
                                  color:
                                      AppColor.lightGreyColor.withOpacity(0.3),
                                )
                              ],
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
