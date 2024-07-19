import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/view/bottom_nav_bar.dart';
import 'package:i_consent/widget/get_app_bar.dart';
import 'package:i_consent/widget/get_button.dart';
import 'package:i_consent/widget/get_padding_spacing.dart';
import 'package:i_consent/widget/get_spacing.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ConfirmProfileScreen extends StatelessWidget {
  const ConfirmProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const GetAppBar(
        title: 'Confirm Profile',
        centerTitle: true,
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
                _buildProfileInfo('DOB', 'Jun 25, 1998'),
                const Spacer(),
                // _buildLink(context),
                _buildBottomNavigationBar(context),
                const VerSpace(3),
              ],
            ),
          ),
        ),
      ),
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

  Widget _buildBottomNavigationBar(BuildContext context) {
    return SizedBox(
      width: SizeConfig.width,
      child: GetButton(
        'Confirm',
        onTap: () {
          Get.offAll(() => MyBottomNavBar(selectedIndexBottomNavBar: RxInt(1)));
        },
      ),
    );
  }
}
