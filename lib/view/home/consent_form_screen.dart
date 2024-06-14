import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/utils/data.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/view/home/consent_activities_screen.dart';
import 'package:i_consent/widget/get_app_bar.dart';
import 'package:i_consent/widget/get_button.dart';
import 'package:i_consent/widget/get_spacing.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:i_consent/widget/get_toast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';

class ConsentFormScreen extends StatelessWidget {
  final bool isEdit;
  final bool isReview;

  const ConsentFormScreen({
    super.key,
    this.isEdit = false,
    this.isReview = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isEdit || isReview
          ? GetAppBar(
              title: isEdit ? 'Consent Form' : 'Review Consent Form',
              centerTitle: false,
            )
          : AppBar(
              scrolledUnderElevation: 0.0,
              elevation: 0.0,
              backgroundColor: AppColor.bgColor,
              title: const GetTextW6S19('Consent Form'),
              centerTitle: false,
              leading: IconButton(
                  onPressed: () => Get.back(), icon: const Icon(Icons.close)),
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
            var data = AppData.consentFormData[index];
            return Column(
              children: [
                const VerSpace(1),
                GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    width: SizeConfig.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GetTextW5S16(data.type.toString()),
                            isReview
                                ? const SizedBox.shrink()
                                : GestureDetector(
                                    onTap: () => Get.to(
                                      () => ConsentActivitiesScreen(
                                        indexConsentActivities:
                                            RxInt(index + 1),
                                        isEdit: RxBool(true),
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
                            data.consentActivitiesCheck!.length,
                            (i) => Obx(
                              () =>
                                  data.consentActivitiesCheck![i].isCheck!.value
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
                                            GetTextW4S14(data
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
                ),
                Divider(
                  color: AppColor.lightGreyColor.withOpacity(0.2),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: isEdit || isReview
          ? const SizedBox.shrink()
          : _buildBottomNavigationBar(context),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return GetButton(
      'Share',
      onTap: () async {
        final result = await Share.share('Consent Form Data');

        if (result.status == ShareResultStatus.success) {
          showSnackBar(
            'Thank you for sharing Consent Form Data',
            true,
          );
        } else {
          showSnackBar(
            'Failed to share Consent Form Data',
            false,
          );
        }
      },
    ).paddingOnly(
      right: 3.w,
      left: 3.w,
      bottom: 2.h,
    );
  }
}
