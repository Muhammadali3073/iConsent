import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/view/home/consent_activities_screen.dart';
import 'package:i_consent/view/home/review_agreement_screen.dart';
import 'package:i_consent/view/profile/user_profile_screen.dart';
import 'package:i_consent/widget/get_app_bar.dart';
import 'package:i_consent/widget/get_spacing.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AllAgreementsScreen extends StatelessWidget {
  const AllAgreementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GetAppBar(title: 'All Agreements', centerTitle: true),
      body: SizedBox(
        height: SizeConfig.height,
        width: SizeConfig.width,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 10,
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Get.to(() => const UserProfileScreen()),
              child: Container(
                height: 18.h,
                margin: EdgeInsets.only(bottom: 1.3.h),
                decoration: BoxDecoration(
                    color: AppColor.lightGreyColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColor.lightGreyColor.withOpacity(0.1),
                    )),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        height: SizeConfig.height,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(8)),
                          child: Image.network(
                            'https://img.freepik.com/free-photo/model-wearing-beautiful-shade-clothing_23-2151428017.jpg?t=st=1718194161~exp=1718197761~hmac=d4a5df429daa63b4242701a379e917aafadeb4fd30720ce143a72dd3e6cf7d36&w=740',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 1.h),
                        decoration: BoxDecoration(
                          color: AppColor.whiteColor,
                          borderRadius: const BorderRadius.horizontal(
                              right: Radius.circular(8)),
                          border: Border(
                            left: BorderSide(
                              color: AppColor.lightGreyColor.withOpacity(0.1),
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Flexible(
                                      child: GetTextW4S16(
                                        'Leila',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    GetTextW4S16(', 19'),
                                  ],
                                ),
                                GetTextW4S14(
                                  'Female',
                                  color: AppColor.lightGreyColor,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: SizeConfig.width,
                                    alignment: Alignment.center,
                                    padding:
                                        EdgeInsets.symmetric(vertical: 0.5.h),
                                    decoration: BoxDecoration(
                                      color: AppColor.lightBlueColor,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: const GetTextW4S13(
                                      'Chat',
                                      color: AppColor.whiteColor,
                                    ),
                                  ),
                                ),
                                const VerSpace(0.5),
                                GestureDetector(
                                  onTap: () {
                                    index == 1
                                        ? Get.to(
                                            () => ConsentActivitiesScreen(
                                              indexConsentActivities: RxInt(1),
                                            ),
                                          )
                                        : Get.to(() =>
                                            const ReviewAgreementScreen());
                                  },
                                  child: Container(
                                    width: SizeConfig.width,
                                    alignment: Alignment.center,
                                    padding:
                                        EdgeInsets.symmetric(vertical: 0.5.h),
                                    decoration: BoxDecoration(
                                      color: AppColor.primaryColor,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: GetTextW4S13(
                                      index == 1
                                          ? 'Create Consent Form'
                                          : 'Review agreement',
                                      color: AppColor.whiteColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
