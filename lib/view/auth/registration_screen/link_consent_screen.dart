import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/extensions/keyboard_dismiss_extension.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/utils/validations.dart';
import 'package:i_consent/widget/get_app_bar.dart';
import 'package:i_consent/widget/get_button.dart';
import 'package:i_consent/widget/get_padding_spacing.dart';
import 'package:i_consent/widget/get_spacing.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:i_consent/widget/get_toast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const GetTextW4S16(
                      'Ask your partner to send you their linking code and enter it below:')
                  .paddingOnly(top: 2.h),
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
              SizedBox(
                width: SizeConfig.width,
                child: GetButton('Link', onTap: () {
                  final errorMessage =
                      otpScreenErrorHandler(otp: otpController);
                  if (errorMessage.isEmpty) {
                    Get.back();
                    Get.back();
                    Get.back();
                    Get.back();
                    showSnackBar('Linked consent successfully', true);
                  } else {
                    showSnackBar(errorMessage, false);
                  }
                }),
              ),
              _buildOrDivider(),
              const GetTextW4S16(
                  'Share your code with your partner to link with this agreement:'),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () => {},
                  child: RichText(
                    text: TextSpan(
                      text: 'Your Code: ',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: AppColor.darkBlackColor),
                      children: <TextSpan>[
                        TextSpan(
                          text: '734-098',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () => {},
                  child: RichText(
                    text: TextSpan(
                      text: 'Want to change code? ',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15.sp,
                          color: AppColor.darkBlackColor),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Refresh',
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
              _buildBottomNavigationBar(context),
              const VerSpace(2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrDivider() {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: AppColor.lightGreyColor,
            endIndent: 2.h,
          ),
        ),
        const GetTextW5S16('or'),
        Expanded(
          child: Divider(
            color: AppColor.lightGreyColor,
            indent: 2.h,
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return SizedBox(
      width: SizeConfig.width,
      child: GetButton(
        'Share',
        onTap: () async {
          final result = await Share.share('Consent Form Data');

          if (result.status == ShareResultStatus.success) {
            Get.back();
            Get.back();
            Get.back();
            Get.back();
            showSnackBar(
              'Thank you for sharing Consent Form Data',
              true,
            );
          } else {
            showSnackBar(
              'Failed to share Consent Form Data',
              false,
            );
          }
        },
      ),
    );
  }
}
