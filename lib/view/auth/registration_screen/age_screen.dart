import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/view/auth/registration_screen/profile_picture_screen.dart';
import 'package:i_consent/widget/get_app_bar.dart';
import 'package:i_consent/widget/get_button.dart';
import 'package:i_consent/widget/get_padding_spacing.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:i_consent/widget/get_text_form_field.dart';
import 'package:i_consent/widget/get_toast.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AgeScreen extends StatelessWidget {
  AgeScreen({super.key});

  final TextEditingController dobController = TextEditingController();
  final selectedDate = Rx<DateTime?>(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GetAppBar(
        title: 'About me',
        actions: [
          TextButton(
            onPressed: () {
              dobController.clear();
              Get.to(() => ProfilePictureScreen());
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
                const GetTextW5S16('I live in')
                    .paddingOnly(top: 3.h, bottom: 2.h),
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
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: GetButton('Next', onTap: () {
        if (dobController.text.isNotEmpty) {
          Get.to(() => ProfilePictureScreen());
        } else {
          showSnackBar('Please select DOB before next.', false);
        }
      }).paddingOnly(
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
