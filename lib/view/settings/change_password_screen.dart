import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/controller/profile_controller.dart';
import 'package:i_consent/extensions/keyboard_dismiss_extension.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/view/auth/forgot_passsword_screen.dart';
import 'package:i_consent/widget/get_app_bar.dart';
import 'package:i_consent/widget/get_padding_spacing.dart';
import 'package:i_consent/widget/get_spacing.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  final ProfileController profileController =
      Get.find(tag: 'profileController');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GetAppBar(
        title: 'Change Password',
        centerTitle: false,
      ),
      body: SizedBox(
        height: SizeConfig.height,
        width: SizeConfig.width,
        child: SafeArea(
          child: Padding(
            padding: Spacing.only(right: 2, left: 2, top: 3),
            child: Column(
              children: [
                _buildPasswordRow(
                  context,
                  'Enter Old Password',
                  onForgotPasswordTap: () {
                    Get.to(() => ForgotPasswordScreen());
                  },
                ),
                _buildPasswordField(
                  context,
                  controller: profileController.oldPasswordController,
                  hintText: '*******',
                ),
                const VerSpace(2),
                _buildPasswordRow(context, 'Enter New Password'),
                _buildPasswordField(
                  context,
                  controller: profileController.newPasswordController,
                  hintText: '*******',
                ),
                const VerSpace(2),
                _buildPasswordRow(context, 'Confirm New Password'),
                _buildPasswordField(
                  context,
                  controller: profileController.confirmNewPasswordController,
                  hintText: '*******',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildPasswordRow(
    BuildContext context,
    String label, {
    VoidCallback? onForgotPasswordTap,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GetTextW4S14(
          label,
          color: AppColor.primaryColor,
        ),
        if (onForgotPasswordTap != null)
          GestureDetector(
            onTap: onForgotPasswordTap,
            child: Text(
              'Forgot password?',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: AppColor.primaryColor,
              ),
            ),
          ),
      ],
    );
  }

  TextFormField _buildPasswordField(
    BuildContext context, {
    required String hintText,
    required TextEditingController? controller,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.visiblePassword,
      cursorColor: Colors.black,
      textInputAction: TextInputAction.next,
      onTapOutside: (event) {
        context.dismissKeyboard();
      },
      style: textStyleW4S16(),
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.lightGreyColor,
            width: 0.1.h,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.lightGreyColor,
            width: 0.1.h,
          ),
        ),
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(0.8.h),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 1.4.h),
        hintStyle: textStyleW4S16(
          color: AppColor.darkBlackColor.withOpacity(0.7),
        ),
        isCollapsed: true,
        filled: true,
        fillColor: AppColor.bgColor,
        hintText: hintText,
        enabled: true,
      ),
    );
  }
}
