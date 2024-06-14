import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/extensions/keyboard_dismiss_extension.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/utils/validations.dart';
import 'package:i_consent/view/auth/reset_password_screen.dart';
import 'package:i_consent/widget/get_button.dart';
import 'package:i_consent/widget/get_padding_spacing.dart';
import 'package:i_consent/widget/get_spacing.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:i_consent/widget/get_toast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class VerificationOTPScreen extends StatelessWidget with MyAppValidations {
  VerificationOTPScreen({super.key});

  final TextEditingController otpController = TextEditingController();
  final StreamController<ErrorAnimationType> errorController = StreamController<ErrorAnimationType>();

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
                  const GetTextW6S19('Verification').paddingOnly(bottom: 1.4.h),
                  const GetTextW4S13('Enter code sent to your email\naddress')
                      .paddingOnly(bottom: 1.6.h),
                  PinCodeTextField(
                    autoFocus: true,
                    length: 6,
                    keyboardType: TextInputType.phone,
                    appContext: context,
                    obscureText: false,
                    animationType: AnimationType.scale,
                    pinTheme: PinTheme(
                      borderWidth: 1.px,
                      shape: PinCodeFieldShape.underline,
                      selectedColor: AppColor.primaryColor,
                      selectedFillColor: AppColor.bgColor,
                      inactiveColor: AppColor.lightGreyColor,
                      inactiveFillColor: AppColor.bgColor,
                      fieldHeight: 5.4.h,
                      fieldWidth: 4.4.h,
                      activeColor: AppColor.primaryColor,
                      activeFillColor: AppColor.bgColor,
                      fieldOuterPadding: EdgeInsets.symmetric(
                        horizontal: 1.1.h,
                      ),
                    ),
                    animationDuration: const Duration(milliseconds: 200),
                    backgroundColor: AppColor.bgColor,
                    mainAxisAlignment: MainAxisAlignment.center,
                    enableActiveFill: true,
                    errorAnimationController: errorController,
                    controller: otpController,
                    onCompleted: (v) {
                      context.dismissKeyboard();
                      log("Completed OTP:${otpController.text}");
                    },
                    onChanged: (value) {},
                    beforeTextPaste: (text) {
                      log("Allowing to paste $text");
                      return true;
                    },
                  ),
                  const VerSpace(2),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () => {},
                      child: RichText(
                        text: TextSpan(
                          text: 'Didn’t received code? ',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15.sp,
                              color: AppColor.darkBlackColor),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Resend',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15.sp,
                                color: AppColor.primaryColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              GetButton('Verify', onTap: () {
                final errorMessage =
                otpScreenErrorHandler(otp: otpController);
                if (errorMessage.isEmpty) {
                  Get.to(() => ResetPasswordScreen());
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
