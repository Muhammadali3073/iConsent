import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/utils/data.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/widget/get_app_bar.dart';
import 'package:i_consent/widget/get_button.dart';
import 'package:i_consent/widget/get_spacing.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:i_consent/widget/get_toast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ReviewUpdateScreen extends StatelessWidget {
  const ReviewUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GetAppBar(
        title: 'Review',
        centerTitle: true,
      ),
      body: SizedBox(
        height: SizeConfig.height,
        width: SizeConfig.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VerSpace(1),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GetTextW5S16(
                    'Old response date: 21/02/2024',
                    color: AppColor.lightGreyColor,
                  ),
                  GetTextW5S16(
                    'New response date: 01/04/2024',
                    color: AppColor.primaryColor,
                  ),
                ],
              ).paddingSymmetric(horizontal: 2.h),
              ListView.builder(
                shrinkWrap: true,
                itemCount: AppData.consentFormData.length,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: 1.h),
                itemBuilder: (context, index) {
                  return Obx(
                    () => AppData.consentFormData[index].isSkip.value == false
                        ? Column(
                            children: [
                              const VerSpace(1),
                              SizedBox(
                                width: SizeConfig.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GetTextW5S16(AppData
                                        .consentFormData[index].type
                                        .toString()),
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
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      Icons.check,
                                                      color:
                                                          AppColor.primaryColor,
                                                      size: 1.8.h,
                                                    ),
                                                    const HorSpace(0.5),
                                                    RichText(
                                                      text: TextSpan(
                                                        text: AppData
                                                            .consentFormData[
                                                                index]
                                                            .consentActivitiesCheck![
                                                                i]
                                                            .title
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 15.sp,
                                                          color: AppColor
                                                              .darkBlackColor,
                                                        ),
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                            text: ' - new',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 15.sp,
                                                              color: AppColor
                                                                  .primaryColor,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      Icons.check,
                                                      color: AppColor
                                                          .lightGreyColor,
                                                      size: 1.8.h,
                                                    ),
                                                    const HorSpace(0.5),
                                                    RichText(
                                                      text: TextSpan(
                                                        text: AppData
                                                            .consentFormData[
                                                                index]
                                                            .consentActivitiesCheck![
                                                                i]
                                                            .title
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 15.sp,
                                                          color: AppColor
                                                              .darkBlackColor,
                                                        ),
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                            text: ' - old',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 15.sp,
                                                              color: AppColor
                                                                  .lightGreyColor,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildConfirm(context),
    );
  }

  Widget _buildConfirm(BuildContext context) {
    return GetButton(
      'Done',
      onTap: () {
        Get.back();
        Get.back();
        showSnackBar(
          'Updated consent successfully.',
          true,
        );
      },
    ).paddingOnly(
      right: 3.w,
      left: 3.w,
      bottom: 2.h,
    );
  }
}
