import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/utils/data.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/utils/validations.dart';
import 'package:i_consent/view/auth/login_screen.dart';
import 'package:i_consent/view/auth/registration_screen/term_condition_screen.dart';
import 'package:i_consent/widget/get_button.dart';
import 'package:i_consent/widget/get_image.dart';
import 'package:i_consent/widget/get_padding_spacing.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:i_consent/widget/get_text_form_field.dart';
import 'package:i_consent/widget/get_toast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignUpScreen extends StatelessWidget with MyAppValidations {
  SignUpScreen({super.key});

  final TextEditingController nameSignUpController =
      TextEditingController(text: 'Ali Bajwa');
  final TextEditingController emailSignUpController =
      TextEditingController(text: 'ali@gmai.com');
  final TextEditingController setPasswordSignUpController =
      TextEditingController(text: 'Admin@123');
  final TextEditingController confirmPasswordSignUpController =
      TextEditingController(text: 'Admin@123');
  final isShowConfirmPassword = true.obs;
  final isShowSetPassword = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          height: SizeConfig.height,
          width: SizeConfig.width,
          child: Padding(
            padding: Spacing.only(right: 2, left: 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GetAssetImage(AppData.logo, height: 2.h),
                const GetTextBS28('Register'),
                Obx(
                  () => Column(
                    children: [
                      _buildTextFormField(
                        'Full Name',
                        nameSignUpController,
                        TextInputType.name,
                        AppData.userIcon,
                      ).paddingOnly(bottom: 1.4.h),
                      _buildTextFormField(
                        'Email Address',
                        emailSignUpController,
                        TextInputType.emailAddress,
                        AppData.emailIcon,
                      ).paddingOnly(bottom: 1.4.h),
                      _buildPasswordFormField(
                        'Set Password',
                        setPasswordSignUpController,
                        isShowSetPassword,
                        () =>
                            isShowSetPassword.value = !isShowSetPassword.value,
                      ).paddingOnly(bottom: 1.4.h),
                      _buildPasswordFormField(
                        'Confirm Password',
                        confirmPasswordSignUpController,
                        isShowConfirmPassword,
                        () => isShowConfirmPassword.value =
                            !isShowConfirmPassword.value,
                      ),
                    ],
                  ),
                ),
                _buildDividerWithText('or'),
                _buildSocialButtons(),
                SizedBox(
                  width: SizeConfig.width,
                  child: GetButton(
                    'Register',
                    onTap: () {
                      final errorMessage = signupScreenErrorHandler(
                        name: nameSignUpController,
                        email: emailSignUpController,
                        setPassword: setPasswordSignUpController,
                        confirmPassword: confirmPasswordSignUpController,
                      );
                      if (errorMessage.isEmpty) {
                        Get.to(() => TermAndConditionScreen());
                      } else {
                        showSnackBar(errorMessage, false);
                      }
                    },
                  ),
                ),
                _buildLoginText(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(
    String labelText,
    TextEditingController controller,
    TextInputType keyboardType,
    String iconPath,
  ) {
    return GetTextFormField(
      labelText,
      controller: controller,
      keyboardType: keyboardType,
      prefixIcon: GetSvgImage(iconPath),
    );
  }

  Widget _buildPasswordFormField(
    String labelText,
    TextEditingController controller,
    RxBool isObscured,
    Function() toggleVisibility,
  ) {
    return GetTextFormField(
      labelText,
      controller: controller,
      obscureText: isObscured.value,
      keyboardType: TextInputType.visiblePassword,
      prefixIcon: const GetSvgImage(AppData.lockIcon),
      suffixIcon: GestureDetector(
        onTap: toggleVisibility,
        child: Icon(
          isObscured.value
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          size: 2.5.h,
          color: AppColor.blackColor,
        ),
      ),
    );
  }

  Widget _buildDividerWithText(String text) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: AppColor.lightGreyColor,
            endIndent: 2.h,
          ),
        ),
        GetTextW5S16(text),
        Expanded(
          child: Divider(
            color: AppColor.lightGreyColor,
            indent: 2.h,
          ),
        ),
      ],
    );
  }

  Widget _buildSocialButtons() {
    return Column(
      children: [
        GetSocialButton(
          'Continue with Google',
          onTap: () {},
          icon: GetSvgImage(
            AppData.googleIcon,
            height: 0.4.h,
          ).paddingOnly(right: 2.h),
        ).paddingOnly(bottom: 1.4.h),
        GetSocialButton(
          'Continue with Facebook',
          onTap: () {},
          icon: GetAssetImage(
            AppData.fbIcon,
            height: 0.4.h,
          ).paddingOnly(right: 2.h),
        ).paddingOnly(bottom: 1.4.h),
        GetSocialButton(
          'Continue with Apple',
          textColor: AppColor.whiteColor,
          buttonColor: AppColor.socialButtonColor,
          onTap: () {},
          icon: GetSvgImage(
            AppData.appleIcon,
            height: 0.38.h,
            width: 5.h,
          ).paddingOnly(right: 2.h),
        ),
      ],
    );
  }

  Widget _buildLoginText() {
    return GestureDetector(
      onTap: () => Get.off(() => LoginScreen()),
      child: RichText(
        text: TextSpan(
          text: 'Already have an account? ',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
            color: AppColor.darkBlackColor,
          ),
          children: <TextSpan>[
            TextSpan(
              text: 'Login',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: AppColor.primaryColor,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
