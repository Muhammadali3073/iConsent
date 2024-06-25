import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/utils/data.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/utils/utils.dart';
import 'package:i_consent/view/auth/login_screen.dart';
import 'package:i_consent/view/auth/registration_screen/term_condition_screen.dart';
import 'package:i_consent/view/settings/change_password_screen.dart';
import 'package:i_consent/view/settings/edit_profile_screen.dart';
import 'package:i_consent/view/settings/feedback_screen.dart';
import 'package:i_consent/view/settings/reminder_screen.dart';
import 'package:i_consent/widget/get_app_bar.dart';
import 'package:i_consent/widget/get_padding_spacing.dart';
import 'package:i_consent/widget/get_setting_tile.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  void _handleTileTap(BuildContext context, int index) {
    if (index == 0) {
      Get.to(() => EditProfileScreen());
    } else if (index == 1) {
      Get.to(() => ReminderScreen());
    } else if (index == 2) {
      Get.to(() => ChangePasswordScreen());
    } else if (index == 3) {
      Get.to(() => TermAndConditionScreen(isShowButton: false));
    } else if (index == 4) {
      Get.to(() => const FeedbackScreen());
    } else if (index == 5) {
      Utils.logoutDialogBox(
        context,
        () => Get.offAll(() => LoginScreen()),
      );
    } else if (index == 6) {
      Utils.deleteDialogBox(
        context,
        () => Get.offAll(() => LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const GetAppBar(
        title: 'Settings',
        centerTitle: true,
      ),
      body: SizedBox(
        height: SizeConfig.height,
        width: SizeConfig.width,
        child: SafeArea(
          child: Padding(
            padding: Spacing.only(right: 2, left: 2, top: 3),
            child: Column(
              children: List.generate(
                AppData.settingsTileDataList.length,
                (index) => _buildSettingsTile(context, index),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsTile(BuildContext context, int index) {
    final tileData = AppData.settingsTileDataList[index];
    return SettingsTile(
      title: tileData.title,
      icon: tileData.icon,
      isNext: tileData.isNext,
      onTap: () => _handleTileTap(context, index),
    ).paddingOnly(bottom: 1.5.h);
  }
}
