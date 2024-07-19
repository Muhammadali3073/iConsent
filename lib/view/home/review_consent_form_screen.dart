import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/utils/data.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/view/bottom_nav_bar.dart';
import 'package:i_consent/widget/get_app_bar.dart';
import 'package:i_consent/widget/get_button.dart';
import 'package:i_consent/widget/get_spacing.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:i_consent/widget/get_toast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ReviewConsentFormScreen extends StatelessWidget {
  const ReviewConsentFormScreen(
      {super.key, required this.signatureImage, this.isResponse = false});

  final bool isResponse;
  final Uint8List? signatureImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GetAppBar(title: 'Review Consent Form'),
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
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Icon(
                                                      Icons.check,
                                                      color:
                                                          AppColor.primaryColor,
                                                      size: 2.h,
                                                    ),
                                                    const HorSpace(0.5),
                                                    GetTextW4S14(AppData
                                                        .consentFormData[index]
                                                        .consentActivitiesCheck![
                                                            i]
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
              const GetTextW5S16('Signature')
                  .paddingOnly(right: 2.h, left: 2.h),
              const VerSpace(2),
              Container(
                height: 20.h,
                width: SizeConfig.width,
                margin: EdgeInsets.symmetric(horizontal: 2.h),
                decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    image: DecorationImage(image: MemoryImage(signatureImage!)),
                    borderRadius:
                        const BorderRadiusDirectional.all(Radius.circular(8)),
                    border: Border.all(
                        color: AppColor.lightGreyColor, width: 0.1.h)),
              ),
              const VerSpace(2),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context).paddingOnly(
        right: 2.h,
        left: 2.h,
        bottom: 3.h,
      ),
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
      isResponse ? 'Share this consent back' : 'Share this consent',
      onTap: () {
        if (isResponse == true) {
          Get.offAll(() => MyBottomNavBar(selectedIndexBottomNavBar: RxInt(1)));

          showSnackBar(
            'Shared consent form successfully.',
            true,
          );
        } else {
          Get.offAll(() => MyBottomNavBar(selectedIndexBottomNavBar: RxInt(1)));
          showSnackBar(
            'Shared consent form successfully.',
            true,
          );
        }
      },
    );
  }
}
