import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/constants/data.dart';
import 'package:i_consent/controller/auth_controller.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/utils/validations.dart';
import 'package:i_consent/view/auth/forgot_passsword_screen.dart';
import 'package:i_consent/view/auth/sign_up_screen.dart';
import 'package:i_consent/view/bottom_nav_bar.dart';
import 'package:i_consent/widget/get_button.dart';
import 'package:i_consent/widget/get_image.dart';
import 'package:i_consent/widget/get_padding_spacing.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:i_consent/widget/get_text_form_field.dart';
import 'package:i_consent/widget/get_toast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatelessWidget with MyAppValidations {
  LoginScreen({super.key});

  final AuthController authController = Get.find(tag: 'authController');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: SizeConfig.height,
        width: SizeConfig.width,
        child: SafeArea(
          child: Padding(
            padding: Spacing.only(right: 3, left: 3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GetAssetImage(AppData.logo, height: 2.h),
                const GetTextBS28('Login'),
                _buildLoginForm(),
                _buildOrDivider(),
                _buildSocialButtons(),
                _buildLoginButton(context),
                _buildRegisterText(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Column(
      children: [
        GetTextFormField(
          'Email Address',
          controller: authController.emailLoginController,
          keyboardType: TextInputType.emailAddress,
          prefixIcon: const GetSvgImage(AppData.emailIcon),
        ).paddingOnly(bottom: 1.4.h),
        Obx(
          () => GetTextFormField(
            'Password',
            controller: authController.passwordLoginController,
            obscureText: authController.isShowPassword.value,
            keyboardType: TextInputType.visiblePassword,
            prefixIcon: const GetSvgImage(AppData.lockIcon),
            suffixIcon: GestureDetector(
              onTap: authController.togglePasswordVisibility,
              child: Icon(
                authController.isShowPassword.value
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                size: 2.5.h,
                color: AppColor.blackColor,
              ),
            ),
          ).paddingOnly(bottom: 1.h),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () => Get.to(() => ForgotPasswordScreen()),
            child: Text(
              'Forgot password?',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: AppColor.primaryColor,
              ),
            ),
          ),
        ),
      ],
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

  Widget _buildLoginButton(BuildContext context) {
    return GetButton(
      'Login',
      onTap: () {
        final errorMessage = loginScreenErrorHandler(
          email: authController.emailLoginController,
          password: authController.passwordLoginController,
        );
        if (errorMessage.isEmpty) {
          Get.off(() => const MyBottomNavBar());
        } else {
          showScaffoldMessenger(context, errorMessage);
        }
      },
    );
  }

  Widget _buildRegisterText() {
    return GestureDetector(
      onTap: () => Get.off(() => SignUpScreen()),
      child: RichText(
        text: TextSpan(
          text: 'Don’t have an account? ',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
            color: AppColor.darkBlackColor,
          ),
          children: <TextSpan>[
            TextSpan(
              text: 'Register',
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
