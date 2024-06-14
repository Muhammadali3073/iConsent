import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/view/home/article_details_screen.dart';
import 'package:i_consent/widget/get_app_bar.dart';
import 'package:i_consent/widget/get_spacing.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GetAppBar(title: 'Articles', centerTitle: false),
      body: SizedBox(
        height: SizeConfig.height,
        width: SizeConfig.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VerSpace(2),
            const GetTextW6S19('Popular Articles')
                .paddingSymmetric(horizontal: 2.h),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Get.to(() => const ArticlesDetailsScreen()),
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
                                  'https://img.freepik.com/free-photo/photorealistic-valentines-day-celebration_23-2151128357.jpg?t=st=1718191431~exp=1718195031~hmac=c05ae22c22ed6dab74e0c82e7de3e485e6b510e2f8479ed7ddae3534958b8864&w=1800',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 1.h, vertical: 1.h),
                              decoration: BoxDecoration(
                                color: AppColor.whiteColor,
                                borderRadius: const BorderRadius.horizontal(
                                    right: Radius.circular(8)),
                                border: Border(
                                  left: BorderSide(
                                    color: AppColor.lightGreyColor
                                        .withOpacity(0.1),
                                  ),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const GetTextW4S12(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet.',
                                    maxLines: 6,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Row(
                                    children: [
                                      GetTextW4S12(
                                        'John Doe',
                                        color: AppColor.lightGreyColor
                                            .withOpacity(0.9),
                                      ),
                                      Icon(
                                        Icons.circle,
                                        size: 0.5.h,
                                        color: AppColor.lightGreyColor
                                            .withOpacity(0.5),
                                      ).paddingSymmetric(horizontal: 0.5.h),
                                      GetTextW4S12(
                                        '5 min read',
                                        color: AppColor.lightGreyColor
                                            .withOpacity(0.9),
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
            )
          ],
        ),
      ),
    );
  }
}
