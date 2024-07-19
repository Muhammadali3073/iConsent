import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/extensions/keyboard_dismiss_extension.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/utils/validations.dart';
import 'package:i_consent/view/bottom_nav_bar.dart';
import 'package:i_consent/widget/get_app_bar.dart';
import 'package:i_consent/widget/get_button.dart';
import 'package:i_consent/widget/get_padding_spacing.dart';
import 'package:i_consent/widget/get_spacing.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:i_consent/widget/get_toast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';

class ShareLinkConsentScreen extends StatelessWidget with MyAppValidations {
  ShareLinkConsentScreen({super.key});

  final random = Random();
  final TextEditingController otpController = TextEditingController();
  final StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const GetAppBar(
        title: 'Link with Partner',
      ),
      body: SizedBox(
        height: SizeConfig.height,
        width: SizeConfig.width,
        child: Padding(
          padding: Spacing.only(right: 2, left: 2),
          child: Column(
            children: [
              Column(
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
                    },
                    onChanged: (value) {},
                    beforeTextPaste: (text) {
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
                        Get.back();
                        showSnackBar('Linked successfully', true);
                      } else {
                        showSnackBar(errorMessage, false);
                      }
                    }),
                  ),
                ],
              ),
              const Spacer(),
              _buildOrDivider(),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const VerSpace(2),
                  const GetTextW4S16(
                    'Share your code with your partner to create the link:',
                  ),
                  const VerSpace(5),
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
                              text: _generateRandomCode(),
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
                  const VerSpace(5),
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
                  const VerSpace(2),
                  _buildBottomNavigationBar(context),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  String _generateRandomCode() {
    return (random.nextInt(900000) + 100000).toString();
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
            Get.offAll(
                () => MyBottomNavBar(selectedIndexBottomNavBar: RxInt(1)));

            showSnackBar(
              'Shared Link successfully.',
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
