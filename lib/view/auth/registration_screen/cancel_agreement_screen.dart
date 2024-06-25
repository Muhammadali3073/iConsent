import 'dart:typed_data';

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
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:signature/signature.dart';

class CancelAgreementScreen extends StatelessWidget {
  CancelAgreementScreen({super.key});

  final TextEditingController dobController = TextEditingController();
  final isCheckCancellation = true.obs;
  final selectedDate = Rx<DateTime?>(null);
  final signatureController = SignatureController(
    penStrokeWidth: 1.5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.transparent,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GetAppBar(title: 'Cancel Agreement'),
      body: SizedBox(
        height: SizeConfig.height,
        width: SizeConfig.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: Spacing.only(right: 2, left: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GetTextBS17(
                        'Are you sure you want to cancel this agreement?')
                    .paddingOnly(top: 2.h, bottom: 1.h),
                Row(
                  children: [
                    Obx(() => Checkbox(
                          checkColor: Colors.white,
                          side: const BorderSide(color: AppColor.primaryColor),
                          fillColor:
                              WidgetStateProperty.all(AppColor.primaryColor),
                          value: isCheckCancellation.value,
                          onChanged: (bool? value) {
                            isCheckCancellation.value = value!;
                          },
                        )),
                    const GetTextW4S14('This agreement is cancelled')
                  ],
                ),
                const GetTextW5S16('Cancellation date ')
                    .paddingOnly(top: 2.h, bottom: 1.h),
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
        'Confirm Cancel',
        onTap: () async {
          Uint8List? signatureImage = await signatureController.toPngBytes();
          if (signatureImage != null) {
            Get.back();
            showSnackBar(
              'Agreement Canceled successfully',
              true,
            );
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
}
