import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/utils/data.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/utils/validations.dart';
import 'package:i_consent/view/auth/forgot_password_screen/successfully_changed_password_screen.dart';
import 'package:i_consent/widget/get_button.dart';
import 'package:i_consent/widget/get_image.dart';
import 'package:i_consent/widget/get_padding_spacing.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:i_consent/widget/get_text_form_field.dart';
import 'package:i_consent/widget/get_toast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ResetPasswordScreen extends StatelessWidget with MyAppValidations {
  ResetPasswordScreen({super.key});

  final TextEditingController newPasswordForgotController =
      TextEditingController();
  final TextEditingController confirmNewPasswordForgotController =
      TextEditingController();
  final isShowConfirmNewPassword = false.obs;
  final isShowNewPassword = false.obs;

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
          padding: Spacing.only(right: 2, left: 2),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GetTextW6S19('Reset Password').paddingOnly(bottom: 1.4.h),
                GetTextFormField(
                  'New Password',
                  controller: newPasswordForgotController,
                  obscureText: isShowNewPassword.value,
                  keyboardType: TextInputType.visiblePassword,
                  prefixIcon: const GetSvgImage(
                    AppData.lockIcon,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () =>
                        isShowNewPassword.value = !isShowNewPassword.value,
                    child: Icon(
                      !isShowNewPassword.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      size: 2.5.h,
                      color: AppColor.blackColor,
                    ),
                  ),
                ).paddingOnly(bottom: 1.4.h),
                GetTextFormField(
                  'Confirm New Password',
                  controller: confirmNewPasswordForgotController,
                  obscureText: isShowConfirmNewPassword.value,
                  keyboardType: TextInputType.visiblePassword,
                  prefixIcon: const GetSvgImage(AppData.lockIcon),
                  suffixIcon: GestureDetector(
                    onTap: () => isShowConfirmNewPassword.value =
                        !isShowConfirmNewPassword.value,
                    child: Icon(
                      !isShowConfirmNewPassword.value
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
        ),
      ),
      bottomNavigationBar: GetButton('Set New Password', onTap: () {
        final errorMessage = resetPasswordScreenErrorHandler(
          newPassword: newPasswordForgotController,
          confirmNewPassword: confirmNewPasswordForgotController,
        );
        if (errorMessage.isEmpty) {
          Get.offAll(() => const SuccessfullyChangedPasswordScreen());
        } else {
          showSnackBar(errorMessage, false);
        }
      }).paddingOnly(right: 2.h, left: 2.h, bottom: 3.h),
    );
  }
}
