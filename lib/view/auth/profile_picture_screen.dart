import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/controller/auth_controller.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/view/bottom_nav_bar.dart';
import 'package:i_consent/widget/get_app_bar.dart';
import 'package:i_consent/widget/get_button.dart';
import 'package:i_consent/widget/get_padding_spacing.dart';
import 'package:i_consent/widget/get_spacing.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfilePictureScreen extends StatelessWidget {
  ProfilePictureScreen({super.key});

  final AuthController authController = Get.find(tag: 'authController');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GetAppBar(
        title: 'Profile Picture',
        actions: [
          TextButton(
            onPressed: () => Get.offAll(() => const MyBottomNavBar()),
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
                const GetTextW5S16('Upload display picture')
                    .paddingOnly(top: 3.h, bottom: 2.h),
                Obx(() {
                  return authController.selectedImagePath.value == ''
                      ? Align(
                          alignment: AlignmentDirectional.center,
                          child: GestureDetector(
                            onTap: () =>
                                authController.pickImage(ImageSource.gallery),
                            child: SizedBox(
                              height: 40.h,
                              child: DottedBorder(
                                color: AppColor.primaryColor,
                                strokeWidth: 2,
                                borderType: BorderType.RRect,
                                radius: const Radius.circular(20),
                                dashPattern: const [4, 4],
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.upload_file,
                                        color: AppColor.primaryColor,
                                        size: 10.h,
                                      ),
                                      const VerSpace(1),
                                      const GetTextW6S19(
                                        'Upload Picture',
                                        color: AppColor.primaryColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : Stack(
                          alignment: Alignment.topRight,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadiusDirectional.all(
                                  Radius.circular(20)),
                              child: Image.file(
                                File(authController.selectedImagePath.value),
                                height: 40.h,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            IconButton(
                              onPressed: () =>
                                  authController.selectedImagePath.value = '',
                              icon: CircleAvatar(
                                radius: 1.5.h,
                                backgroundColor: AppColor.primaryColor,
                                child: Icon(
                                  Icons.close,
                                  color: AppColor.whiteColor,
                                  size: 2.h,
                                ),
                              ),
                            ),
                          ],
                        );
                }),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: GetButton(
        'Confirm',
        onTap: () => Get.offAll(() => const MyBottomNavBar()),
      ).paddingOnly(
        right: 3.h,
        left: 3.h,
        bottom: 2.h,
      ),
    );
  }
}
