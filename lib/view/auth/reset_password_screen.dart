import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/constants/data.dart';
import 'package:i_consent/controller/auth_controller.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/utils/validations.dart';
import 'package:i_consent/view/auth/successfully_changed_password_screen.dart';
import 'package:i_consent/widget/get_button.dart';
import 'package:i_consent/widget/get_image.dart';
import 'package:i_consent/widget/get_padding_spacing.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:i_consent/widget/get_text_form_field.dart';
import 'package:i_consent/widget/get_toast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ResetPasswordScreen extends StatelessWidget with MyAppValidations {
  ResetPasswordScreen({super.key});

  final AuthController authController = Get.find(tag: 'authController');

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
              Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const GetTextW6S19('Reset Password')
                        .paddingOnly(bottom: 1.4.h),
                    GetTextFormField(
                      'New Password',
                      controller: authController.newPasswordForgotController,
                      obscureText: authController.isShowNewPassword.value,
                      keyboardType: TextInputType.visiblePassword,
                      prefixIcon: const GetSvgImage(
                        AppData.lockIcon,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () =>
                            authController.toggleNewPasswordVisibility(),
                        child: Icon(
                          !authController.isShowNewPassword.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 2.5.h,
                          color: AppColor.blackColor,
                        ),
                      ),
                    ).paddingOnly(bottom: 1.4.h),
                    GetTextFormField(
                      'Confirm New Password',
                      controller:
                          authController.confirmNewPasswordForgotController,
                      obscureText:
                          authController.isShowConfirmNewPassword.value,
                      keyboardType: TextInputType.visiblePassword,
                      prefixIcon: const GetSvgImage(AppData.lockIcon),
                      suffixIcon: GestureDetector(
                        onTap: () =>
                            authController.toggleConfirmNewPasswordVisibility(),
                        child: Icon(
                          !authController.isShowConfirmNewPassword.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 2.5.h,
                          color: AppColor.blackColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GetButton('Set New Password', onTap: () {
                final errorMessage = resetPasswordScreenErrorHandler(
                  newPassword: authController.newPasswordForgotController,
                  confirmNewPassword:
                      authController.confirmNewPasswordForgotController,
                );
                if (errorMessage.isEmpty) {
                  Get.offAll(() => const SuccessfullyChangedPasswordScreen());
                } else {
                  showScaffoldMessenger(context, errorMessage);
                }
              }).paddingOnly(bottom: 2.h),
            ],
          ),
        ),
      ),
    );
  }
}
