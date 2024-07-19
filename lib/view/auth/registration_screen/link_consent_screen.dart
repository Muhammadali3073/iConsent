import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/extensions/keyboard_dismiss_extension.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/utils/validations.dart';
import 'package:i_consent/view/home/new_consent_form_screen.dart';
import 'package:i_consent/widget/get_app_bar.dart';
import 'package:i_consent/widget/get_button.dart';
import 'package:i_consent/widget/get_padding_spacing.dart';
import 'package:i_consent/widget/get_spacing.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:i_consent/widget/get_toast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LinkConsentScreen extends StatelessWidget with MyAppValidations {
  LinkConsentScreen({super.key});

  final TextEditingController otpController = TextEditingController();
  final StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const GetAppBar(
        title: 'Link this consent',
      ),
      body: SizedBox(
        height: SizeConfig.height,
        width: SizeConfig.width,
        child: Padding(
          padding: Spacing.only(right: 2, left: 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const GetTextW4S16(
                      'Ask your partner to send you their linking code and enter it below:')
                  .paddingOnly(top: 2.h, bottom: 2.h),
              PinCodeTextField(
                autoFocus: false,
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
                  fieldWidth: 4.5.h,
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
              const VerSpace(5),
              SizedBox(
                width: SizeConfig.width,
                child: GetButton('Link', onTap: () {
                  final errorMessage =
                      otpScreenErrorHandler(otp: otpController);
                  if (errorMessage.isEmpty) {
                    Get.off(() => NewConsentFormScreen(isResponse: true));
                    showSnackBar('Linked successfully', true);
                  } else {
                    showSnackBar(errorMessage, false);
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
