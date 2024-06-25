import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/view/home/consent_form_screen.dart';
import 'package:i_consent/widget/get_app_bar.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChooseConsentScreen extends StatelessWidget {
  const ChooseConsentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GetAppBar(
        title: 'Choose Consent Form',
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
                  5,
                  (index) => InkWell(
                    onTap: () =>
                        Get.to(() => const ConsentFormScreen(isChoose: true)),
                    child: Column(
                      children: [
                        SizedBox(
                          width: SizeConfig.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GetTextW5S16(
                                'Agreement ${index + 1}',
                                color: AppColor.darkBlackColor,
                              ),
                              const GetTextW4S14(
                                'Partner: Leilani',
                                color: AppColor.lightGreyColor,
                              ),
                              const GetTextW4S14(
                                'Dated: 2/02/2024',
                                color: AppColor.lightGreyColor,
                              ),
                            ],
                          ),
                        ).paddingOnly(
                            left: 2.h, right: 2.h, top: 1.5.h, bottom: 1.h),
                        Divider(
                          height: 0,
                          color: AppColor.lightGreyColor.withOpacity(0.3),
                        )
                      ],
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
