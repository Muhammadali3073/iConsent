import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/controller/auth_controller.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/view/auth/profile_picture_screen.dart';
import 'package:i_consent/widget/get_app_bar.dart';
import 'package:i_consent/widget/get_button.dart';
import 'package:i_consent/widget/get_padding_spacing.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:i_consent/widget/get_text_form_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AgeScreen extends StatelessWidget {
  AgeScreen({super.key});

  final AuthController authController = Get.find(tag: 'authController');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GetAppBar(
        title: 'Age',
        actions: [
          TextButton(
            onPressed: () => Get.off(() => ProfilePictureScreen()),
            child: const GetTextW4S14(
              'Skip',
              color: AppColor.primaryColor,
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: SizeConfig.height,
        width: SizeConfig.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: Spacing.only(right: 3, left: 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GetTextW5S16('I live in')
                    .paddingOnly(top: 3.h, bottom: 2.h),
                GetTextFormField(
                  'Select DOB',
                  controller: authController.dobController,
                  onTap: () => authController.selectDOB(context),
                  readOnly: true,
                  suffixIconConstraintsHeight: 4.h,
                  suffixIcon: const Icon(
                    Icons.date_range_outlined,
                    color: AppColor.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: GetButton('Next', onTap: () {
        Get.to(() => ProfilePictureScreen());
      }).paddingOnly(
        right: 3.h,
        left: 3.h,
        bottom: 2.h,
      ),
    );
  }
}
