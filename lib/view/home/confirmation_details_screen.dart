import 'dart:io';
import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/widget/get_app_bar.dart';
import 'package:i_consent/widget/get_button.dart';
import 'package:i_consent/widget/get_padding_spacing.dart';
import 'package:i_consent/widget/get_spacing.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:i_consent/widget/get_text_form_field.dart';
import 'package:i_consent/widget/get_toast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:signature/signature.dart';

import 'review_consent_form_screen.dart';

class ConfirmationDetailsScreen extends StatelessWidget {
  ConfirmationDetailsScreen({super.key, this.isResponse = false});

  final bool isResponse;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final selectedDate = Rx<DateTime?>(null);
  final selectedImagePath = ''.obs;
  final signatureController = SignatureController(
    penStrokeWidth: 1.5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.transparent,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GetAppBar(title: 'Confirmation Details'),
      body: SizedBox(
        height: SizeConfig.height,
        width: SizeConfig.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: Spacing.only(right: 2, left: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GetTextW5S16('Full Name')
                    .paddingOnly(top: 3.h, bottom: 1.h),
                GetTextFormField(
                  'Enter Name',
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  suffixIconConstraintsHeight: 4.h,
                ),
                const GetTextW5S16('Date').paddingOnly(top: 2.h, bottom: 1.h),
                GetTextFormField(
                  'Select DOB',
                  controller: dobController,
                  onTap: () => _selectDOB(context),
                  readOnly: true,
                  suffixIconConstraintsHeight: 4.h,
                  suffixIcon: const Icon(
                    Icons.date_range_outlined,
                    color: AppColor.primaryColor,
                  ),
                ),
                const GetTextW5S16('Take a Selfie')
                    .paddingOnly(top: 2.h, bottom: 2.h),
                Obx(() {
                  return selectedImagePath.value == ''
                      ? Align(
                          alignment: AlignmentDirectional.center,
                          child: GestureDetector(
                            onTap: () => _pickImage(ImageSource.camera),
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
                                        Icons.camera_alt_outlined,
                                        color: AppColor.primaryColor,
                                        size: 10.h,
                                      ),
                                      const VerSpace(1),
                                      const GetTextW6S19(
                                        'Take a selfie',
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
                const VerSpace(2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const GetTextW5S16('Signature'),
                    GestureDetector(
                      onTap: () {
                        if (signatureController.isNotEmpty) {
                          signatureController.clear();
                        }
                      },
                      child: const GetTextW4S14(
                        'clear',
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ],
                ),
                const VerSpace(2),
                Container(
                  height: 20.h,
                  width: SizeConfig.width,
                  decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadiusDirectional.all(Radius.circular(8)),
                      border: Border.all(
                          color: AppColor.lightGreyColor, width: 0.1.h)),
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadiusDirectional.all(Radius.circular(8)),
                    child: Signature(
                      controller: signatureController,
                      backgroundColor: AppColor.whiteColor,
                    ),
                  ),
                ),
                const VerSpace(2),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: GetButton(
        'Review',
        onTap: () async {
          Uint8List? signatureImage = await signatureController.toPngBytes();
          if (signatureController.isNotEmpty) {
            Get.to(() => ReviewConsentFormScreen(
                  signatureImage: signatureImage,
                  isResponse: isResponse,
                ));
          } else {
            showSnackBar(
              'Signature must not be empty.',
              false,
            );
          }
        },
      ).paddingOnly(
        right: 2.h,
        left: 2.h,
        bottom: 3.h,
      ),
    );
  }

  Future<void> _selectDOB(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColor.primaryColor,
            colorScheme:
                const ColorScheme.light(primary: AppColor.primaryColor),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
      dobController.text =
          DateFormat('MMM d, yyyy').format(selectedDate.value!);
    }
  }

  void _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker()
        .pickImage(source: source, preferredCameraDevice: CameraDevice.front);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    } else {
      selectedImagePath.value = '';
      showSnackBar('No image selected', false);
    }
  }
}
