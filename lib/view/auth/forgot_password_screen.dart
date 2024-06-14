import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/utils/data.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/utils/validations.dart';
import 'package:i_consent/view/auth/verification_otp_screen.dart';
import 'package:i_consent/widget/get_button.dart';
import 'package:i_consent/widget/get_image.dart';
import 'package:i_consent/widget/get_padding_spacing.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:i_consent/widget/get_text_form_field.dart';
import 'package:i_consent/widget/get_toast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ForgotPasswordScreen extends StatelessWidget with MyAppValidations {
  ForgotPasswordScreen({super.key});

  final TextEditingController emailForgotController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColor.bgColor,
      ),
      body: SizedBox(
        height: SizeConfig.height,
        width: SizeConfig.width,
        child: Padding(
          padding: Spacing.only(right: 3, left: 3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const GetTextW6S19('Forgot Password?')
                      .paddingOnly(bottom: 1.4.h),
                  GetTextFormField(
                    'Email Address',
                    controller: emailForgotController,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: const GetSvgImage(AppData.emailIcon),
                  ),
                ],
              ),
              GetButton('Continue', onTap: () {
                final errorMessage = forgotScreenErrorHandler(
                  email: emailForgotController,
                );
                if (errorMessage.isEmpty) {
                  Get.to(() => VerificationOTPScreen());
                } else {
                  showSnackBar(errorMessage, false);
                }
              }).paddingOnly(bottom: 2.h),
            ],
          ),
        ),
      ),
    );
  }
}
