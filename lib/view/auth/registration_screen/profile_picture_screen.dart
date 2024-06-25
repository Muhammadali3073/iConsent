import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/view/auth/registration_screen/i_want_to_screen.dart';
import 'package:i_consent/widget/get_app_bar.dart';
import 'package:i_consent/widget/get_button.dart';
import 'package:i_consent/widget/get_padding_spacing.dart';
import 'package:i_consent/widget/get_spacing.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:i_consent/widget/get_toast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfilePictureScreen extends StatelessWidget {
  ProfilePictureScreen({super.key});

  final selectedImagePath = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GetAppBar(
        title: 'About me',
        actions: [
          TextButton(
            onPressed: () {
              selectedImagePath.value = '';
              Get.to(() => const IWantToScreen());
            },
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
            padding: Spacing.only(right: 2, left: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GetTextW5S16('Upload display picture')
                    .paddingOnly(top: 3.h, bottom: 2.h),
                Obx(() {
                  return selectedImagePath.value == ''
                      ? Align(
                          alignment: AlignmentDirectional.center,
                          child: GestureDetector(
                            onTap: () => _pickImage(ImageSource.gallery),
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
                                File(selectedImagePath.value),
                                height: 40.h,
                                width: SizeConfig.width,
                                fit: BoxFit.cover,
                              ),
                            ),
                            IconButton(
                              onPressed: () => selectedImagePath.value = '',
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
        onTap: () {
          if (selectedImagePath.value.isNotEmpty) {
            Get.to(() => const IWantToScreen());
          } else {
            showSnackBar('Please select profile picture before next.', false);
          }
        },
      ).paddingOnly(
        right: 2.h,
        left: 2.h,
        bottom: 3.h,
      ),
    );
  }

  void _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    } else {
      selectedImagePath.value = '';
      Get.snackbar('Error', 'No image selected',
          snackPosition: SnackPosition.TOP);
    }
  }
}
