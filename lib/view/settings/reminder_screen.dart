import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/widget/get_app_bar.dart';
import 'package:i_consent/widget/get_spacing.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:i_consent/widget/get_text_form_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ReminderScreen extends StatelessWidget {
  ReminderScreen({super.key});

  final TextEditingController reminderMsgController = TextEditingController();
  final isReminderAlert = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const GetAppBar(title: 'Reminder', centerTitle: false),
      body: SizedBox(
        height: SizeConfig.height,
        width: SizeConfig.width,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSwitchListTile(
                      title: 'Reminder Alert',
                      trailing: Obx(() => Transform.scale(
                            scale: 3.4.h / 4.h,
                            child: Switch(
                              value: isReminderAlert.value,
                              onChanged: (value) {
                                isReminderAlert.value = value;
                              },
                            ),
                          )),
                    ),
                    _buildSwitchListTile(
                      title: 'Reminder date & time',
                      trailing: Icon(
                        Icons.date_range_outlined,
                        color: AppColor.primaryColor,
                        size: 3.4.h,
                      ),
                    ),
                    const VerSpace(1),
                    const GetTextW5S16('Reminder message'),
                    const VerSpace(1),
                    GetTextFormField(
                      'Type here...',
                      controller: reminderMsgController,
                      maxLines: 3,
                      maxLength: 20,
                    )
                  ],
                ),
              ),
              const Spacer(flex: 4),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.h),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text:
                        'You can manage your app notifications permission on your ',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: AppColor.darkBlackColor,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Phone Settings',
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
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSwitchListTile(
      {required String title, required Widget? trailing}) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: GetTextW5S16(title),
          trailing: trailing,
        ),
        const Divider(thickness: 1.0, height: 1.0)
      ],
    );
  }
}
