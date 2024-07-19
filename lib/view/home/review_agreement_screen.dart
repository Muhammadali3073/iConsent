import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/utils/data.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/view/auth/registration_screen/cancel_agreement_screen.dart';
import 'package:i_consent/view/home/consent_form_screen.dart';
import 'package:i_consent/widget/get_app_bar.dart';
import 'package:i_consent/widget/get_button.dart';
import 'package:i_consent/widget/get_spacing.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ReviewAgreementScreen extends StatelessWidget {
  const ReviewAgreementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GetAppBar(
        title: 'Review Agreement',
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.close),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.to(() => const ConsentFormScreen()),
            child: const GetTextW4S14(
              'Edit',
              color: AppColor.primaryColor,
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: SizeConfig.height,
        width: SizeConfig.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GetTextBS17('Details')
                  .paddingOnly(top: 2.h, bottom: 2.h, right: 2.h, left: 2.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildProfilePicture(),
                  const HorSpace(1.5),
                  const GetTextW5S16('John Cooper'),
                ],
              ).paddingOnly(right: 2.h, left: 2.h),
              const VerSpace(1),
              Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    text: 'Agreement date : ',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: AppColor.lightGreyColor,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '21/02/2024',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const GetTextBS17('Consent form')
                  .paddingOnly(top: 2.h, right: 2.h, left: 2.h),
              ListView.builder(
                shrinkWrap: true,
                itemCount: AppData.consentFormData.length,
                physics: const NeverScrollableScrollPhysics(),
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
                                                            text: ' - me',
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
                                              : const SizedBox.shrink(),
                                        ),
                                      ),
                                    ),
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
                                                            text: ' - Sarah',
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildProfilePicture() {
    return CircleAvatar(
      radius: 3.5.h,
      backgroundColor: AppColor.lightGreyColor.withOpacity(0.1),
      backgroundImage: const NetworkImage(
        'https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg',
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return GetButton(
      'Cancel this Consent',
      onTap: () {
        Get.to(() => CancelAgreementScreen());
      },
    ).paddingOnly(right: 2.h, left: 2.h, bottom: 3.h);
  }
}
