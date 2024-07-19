import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/utils/data.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/utils/utils.dart';
import 'package:i_consent/view/auth/registration_screen/link_consent_screen.dart';
import 'package:i_consent/view/home/review_partner_screen.dart';
import 'package:i_consent/widget/get_app_bar.dart';
import 'package:i_consent/widget/get_spacing.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GetAppBar(title: 'Notifications', centerTitle: true),
      body: SizedBox(
        height: SizeConfig.height,
        width: SizeConfig.width,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: AppData.notificationData.length,
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 1.h),
          itemBuilder: (context, index) {
            return Column(
              children: [
                const VerSpace(1),
                InkWell(
                  hoverColor: Colors.transparent,
                  overlayColor: WidgetStateColor.transparent,
                  focusColor: Colors.transparent,
                  onTap: () {
                    if (index == 0) {
                      Get.to(() => LinkConsentScreen());
                    } else if (index == 1) {
                      Get.to(() => ReviewPartnerScreen());
                    } else {
                      Get.to(() => ReviewPartnerScreen(isResponse: true));
                    }
                  },
                  child: SizedBox(
                    height: 15.h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: CircleAvatar(
                              radius: 2.6.h,
                              backgroundColor:
                                  AppColor.lightGreyColor.withOpacity(0.1),
                              backgroundImage: NetworkImage(
                                AppData.notificationData[index].profilePic
                                    .toString(),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GetTextW4S14(
                                Utils.formatDateTime(
                                  AppData.notificationData[index].timestamp,
                                ),
                                color: AppColor.lightGreyColor,
                              ),
                              const Spacer(),
                              GetTextW5S16(
                                AppData.notificationData[index].text.toString(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const Spacer(),
                              GetTextW4S14(
                                AppData.notificationData[index].subText
                                    .toString(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                color: AppColor.lightGreyColor,
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ).paddingSymmetric(horizontal: 3.h),
                ),
                Divider(
                  color: AppColor.lightGreyColor.withOpacity(0.2),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
