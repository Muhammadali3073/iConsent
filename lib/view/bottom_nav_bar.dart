import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/utils/data.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/view/chat/chat_screen.dart';
import 'package:i_consent/view/home/home_screen.dart';
import 'package:i_consent/view/profile/profile_screen.dart';
import 'package:i_consent/view/settings/setting_screen.dart';
import 'package:i_consent/widget/get_image.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({super.key, required this.selectedIndexBottomNavBar});

  final RxInt selectedIndexBottomNavBar;

  static const List<String> listOfBottomNavBarIcons = [
    AppData.settingIcon,
    AppData.homeIcon,
    AppData.chatIcon,
    AppData.profileIcon,
  ];

  static final List<Widget> pagesOfBottomNavBarIcons = [
    const SettingsScreen(),
    const HomeScreen(),
    const ChatScreen(),
    const ProfileScreen(),
  ];

  Widget _buildBottomNavBarIcon(int index) {
    final bool isSelected = index == selectedIndexBottomNavBar.value;
    return GestureDetector(
      onTap: () => selectedIndexBottomNavBar.value = index,
      child: CircleAvatar(
        backgroundColor:
            isSelected ? AppColor.primaryColor : AppColor.whiteColor,
        child: GetSvgImage(
          listOfBottomNavBarIcons[index],
          color: isSelected ? AppColor.bgColor : null,
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      width: SizeConfig.width,
      padding: EdgeInsets.symmetric(vertical: 1.2.h),
      margin: EdgeInsets.only(right: 3.h, left: 3.h, bottom: 1.6.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: AppColor.primaryColor.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 15,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(
          listOfBottomNavBarIcons.length,
          (index) => _buildBottomNavBarIcon(index),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: SizeConfig.height,
        width: SizeConfig.width,
        child: Obx(
          () => Stack(
            alignment: Alignment.bottomCenter,
            children: [
              pagesOfBottomNavBarIcons[selectedIndexBottomNavBar.value],
              _buildBottomNavBar(),
            ],
          ),
        ),
      ),
    );
  }
}
