import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/utils/utils.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ArticlesDetailsScreen extends StatelessWidget {
  const ArticlesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Utils.setStatusBarColor();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: SizedBox(
        height: SizeConfig.height,
        width: SizeConfig.width,
        child: Column(
          children: [
            Container(
              height: 30.h,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://img.freepik.com/free-photo/photorealistic-valentines-day-celebration_23-2151128357.jpg?t=st=1718191431~exp=1718195031~hmac=c05ae22c22ed6dab74e0c82e7de3e485e6b510e2f8479ed7ddae3534958b8864&w=1800',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(2.h),
                  child: Column(
                    children: [
                      const GetTextW6S19(
                              '3 Ways That Can Improve Your Relationship')
                          .paddingOnly(bottom: 1.h),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 2.4.h,
                            backgroundColor:
                                AppColor.lightGreyColor.withOpacity(0.1),
                            backgroundImage: const NetworkImage(
                              'https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg',
                            ),
                          ).paddingOnly(right: 1.h),
                          const GetTextW4S14(
                            'Markham Heid',
                            color: AppColor.primaryColor,
                          ),
                          Icon(
                            Icons.circle,
                            size: 0.5.h,
                            color: AppColor.lightGreyColor.withOpacity(0.5),
                          ).paddingSymmetric(horizontal: 0.5.h),
                          GetTextW4S12(
                            '5 min read',
                            color: AppColor.lightGreyColor.withOpacity(0.9),
                          ),
                          Icon(
                            Icons.circle,
                            size: 0.5.h,
                            color: AppColor.lightGreyColor.withOpacity(0.5),
                          ).paddingSymmetric(horizontal: 0.5.h),
                          GetTextW4S12(
                            '23 Oct',
                            color: AppColor.lightGreyColor.withOpacity(0.9),
                          ),
                        ],
                      ).paddingOnly(bottom: 2.h),
                      const GetTextW4S13(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis saconsectetur adipiscing elit. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis saconsectetur adipiscing elit. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis saconsectetur adipiscing elit. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. PrLorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, pet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur sodales ligula in libero. Sed dignissim Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur sodales ligula in libero. Sed dignissim Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur sodales ligula in libero. Sed dignissim ')
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
