import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/utils/data.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/utils/utils.dart';
import 'package:i_consent/view/auth/login_in_screen.dart';
import 'package:i_consent/view/settings/edit_profile_screen.dart';
import 'package:i_consent/widget/get_app_bar.dart';
import 'package:i_consent/widget/get_image.dart';
import 'package:i_consent/widget/get_padding_spacing.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: GetAppBar(
        title: 'Profile',
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () => _logout(context),
            icon: const GetSvgImage(AppData.logoutIcon),
          ),
        ],
      ),
      body: SizedBox(
        height: SizeConfig.height,
        width: SizeConfig.width,
        child: SafeArea(
          child: Padding(
            padding: Spacing.only(right: 2, left: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildProfilePicture(),
                _buildProfileInfo('Full Name', 'James Stone, 24'),
                _buildProfileInfo('Email Address', 'James_Stone0@gmail.com'),
                _buildProfileInfo('Gender', 'Male'),
                _buildProfileInfo('Location', 'Times Square, NY'),
                const Spacer(),
                _buildEditProfileButton(),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _logout(BuildContext context) {
    Utils.logoutDialogBox(
      context,
      () => Get.offAll(() => LoginScreen()),
    );
  }

  Widget _buildProfileInfo(String title, String value) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GetTextW4S16(title),
            GetTextW4S14(
              value,
              color: AppColor.lightGreyColor,
            ),
          ],
        ),
        Divider(
          color: AppColor.lightGreyColor.withOpacity(0.4),
        ),
      ],
    );
  }

  Widget _buildProfilePicture() {
    return CircleAvatar(
      radius: 6.h,
      backgroundColor: AppColor.lightGreyColor.withOpacity(0.1),
      backgroundImage: const NetworkImage(
        'https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg',
      ),
    ).paddingSymmetric(vertical: 3.h);
  }

  Widget _buildEditProfileButton() {
    return OutlinedButton(
      onPressed: () => Get.to(() => EditProfileScreen()),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(AppColor.whiteColor),
        foregroundColor: WidgetStateProperty.all<Color>(
            AppColor.darkBlackColor.withOpacity(0.2)),
        overlayColor: WidgetStateProperty.all<Color>(
          AppColor.darkBlackColor.withOpacity(0.3),
        ),
        side: WidgetStateProperty.all<BorderSide>(
          const BorderSide(color: AppColor.darkBlackColor, width: 1),
        ),
        shape: WidgetStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      child: const GetTextW5S16('Edit Profile'),
    );
  }
}
