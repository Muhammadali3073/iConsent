import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/view/auth/registration_screen/gender_screen.dart';
import 'package:i_consent/widget/get_app_bar.dart';
import 'package:i_consent/widget/get_button.dart';
import 'package:i_consent/widget/get_spacing.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:i_consent/widget/get_toast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TermAndConditionScreen extends StatelessWidget {
  TermAndConditionScreen({super.key, this.isShowButton = true});

  final bool isShowButton;
  final isCheckTermCondition = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GetAppBar(title: 'Terms & Conditions', centerTitle: true),
      body: SizedBox(
        height: SizeConfig.height,
        width: SizeConfig.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const VerSpace(1),
              const GetTextW4S13(
                'The iConsent application is designed to facilitate communication and understanding between consenting adults regarding their personal boundaries and preferences in intimate situations. This application is intended for informational and educational purposes only and does not provide legal protection or advice.\n\nBy using iConsent, you acknowledge and agree that:\n\n1. No Legal Advice: iConsent does not provide legal advice or create any legally binding agreements. For legal advice, please consult a licensed attorney.\n\n2. No Legal Protection: The use of iConsent does not constitute legal protection against any claims or disputes that may arise. Users are responsible for ensuring that their actions comply with applicable laws and regulations.\n\n3. Personal Responsibility: Users are solely responsible for their interactions and communications within the app. iConsent does not guarantee the accuracy, completeness, or reliability of any information exchanged through the app.\n\n4. Privacy and Confidentiality: While iConsent takes measures to protect user data, it cannot guarantee absolute privacy and confidentiality. Users should exercise caution when sharing personal information.\n\n5. Age Restriction: iConsent is intended for use by individuals who are of legal age of consent in their jurisdiction. By using the app, you confirm that you meet this requirement.\n\n6. No Endorsement: iConsent does not endorse or verify the intentions or actions of any users. It is the responsibility of each user to ensure that their interactions are consensual and respectful.\n\nBy continuing to use iConsent, you acknowledge that you have read, understood, and agree to this disclaimer. If you do not agree with any part of this disclaimer, you should discontinue use of the app immediately.',
                textAlign: TextAlign.start,
              ).paddingSymmetric(horizontal: 2.h),
              Row(
                children: [
                  Obx(() => Checkbox(
                        checkColor: Colors.white,
                        side: const BorderSide(color: AppColor.greenColor),
                        fillColor: WidgetStateProperty.all(AppColor.greenColor),
                        value: isCheckTermCondition.value,
                        onChanged: (bool? value) {
                          isCheckTermCondition.value = value!;
                        },
                      )),
                  const GetTextW4S14('I agree to above terms & conditions')
                ],
              ).paddingSymmetric(horizontal: 0.4.h),
              const VerSpace(2),
            ],
          ),
        ),
      ),
      bottomNavigationBar: isShowButton
          ? GetButton('Continue', onTap: () {
              isCheckTermCondition.value
                  ? Get.to(() => GenderScreen())
                  : showSnackBar('Please check Terms & Conditions', false);
            }).paddingOnly(
              right: 2.h,
              left: 2.h,
              bottom: 3.h,
            )
          : const SizedBox.shrink(),
    );
  }
}
