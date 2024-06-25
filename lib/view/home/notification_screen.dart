import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
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
          itemCount: 10,
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 1.h),
          itemBuilder: (context, index) {
            return Column(
              children: [
                const VerSpace(1),
                GestureDetector(
                  onTap: () {},
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
                              backgroundImage: const NetworkImage(
                                'https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg',
                              ),
                            ),
                          ),
                        ),
                        const Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GetTextW4S14(
                                '5h ago',
                                color: AppColor.lightGreyColor,
                              ),
                              Spacer(),
                              GetTextW5S16(
                                'John has sent you a requestJohn has sent you a requestJohn has sent you a request',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Spacer(),
                              GetTextW4S14(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do...',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                color: AppColor.lightGreyColor,
                              ),
                              Spacer(),
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
