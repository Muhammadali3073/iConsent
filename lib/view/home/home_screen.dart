import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/utils/data.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/view/auth/registration_screen/create_consent_form_screen.dart';
import 'package:i_consent/view/auth/registration_screen/i_want_to_screen.dart';
import 'package:i_consent/view/auth/registration_screen/share_link_screen.dart';
import 'package:i_consent/view/chat/inbox_chat_screen.dart';
import 'package:i_consent/view/home/all_agreements_screen.dart';
import 'package:i_consent/view/home/notification_screen.dart';
import 'package:i_consent/view/home/review_agreement_screen.dart';
import 'package:i_consent/view/profile/user_profile_screen.dart';
import 'package:i_consent/widget/get_button.dart';
import 'package:i_consent/widget/get_image.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: GetAssetImage(AppData.logo, scale: 0.9.h),
        actions: [
          IconButton(
            onPressed: () => Get.to(() => const NotificationScreen()),
            icon: Icon(Icons.notifications_outlined, size: 3.5.h),
          )
        ],
        toolbarHeight: 12.h,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader(
              'Current Agreements',
              'See all',
              () => Get.to(() => const AllAgreementsScreen(
                    title: 'Current Agreements',
                  )),
            ),
            _buildAgreementsGrid(
                'https://img.freepik.com/free-photo/model-wearing-beautiful-shade-clothing_23-2151428017.jpg?t=st=1718194161~exp=1718197761~hmac=d4a5df429daa63b4242701a379e917aafadeb4fd30720ce143a72dd3e6cf7d36&w=740'),
            _buildSectionHeader(
              'All Agreements',
              'See all',
              () => Get.to(() => const AllAgreementsScreen(
                    title: 'All Agreements',
                  )),
            ),
            _buildAgreementsGrid(
                'https://img.freepik.com/free-photo/young-cute-woman-cap-glasses-posing-outside-showing-thumbs-up-high-quality-photo_114579-91847.jpg?t=st=1719316843~exp=1719320443~hmac=084a70fe77f2055790215a082bc017ef871822488ae130870309702ade552119&w=740'),
            const Spacer(),
            _buildButton(
              'Create consent form',
              AppColor.whiteColor,
              AppColor.primaryColor,
              _handleCreateConsentFormPressed,
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(
      String title, String actionText, void Function()? onTap) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GetTextW6S19(title),
          GestureDetector(
              onTap: onTap,
              child: GetTextW4S14(actionText, color: AppColor.primaryColor)),
        ],
      ),
    );
  }

  // Widget _buildFeaturedArticlesGrid() {
  //   return SizedBox(
  //     height: 24.h,
  //     child: GridView.builder(
  //       shrinkWrap: true,
  //       padding: EdgeInsets.symmetric(horizontal: 2.h),
  //       scrollDirection: Axis.horizontal,
  //       itemCount: 5,
  //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //         crossAxisCount: 1,
  //         mainAxisSpacing: 1.h,
  //         childAspectRatio: 1 / 1.4,
  //       ),
  //       itemBuilder: (BuildContext context, int index) {
  //         return _buildFeaturedArticleItem(
  //           () => Get.to(() => const ArticlesDetailsScreen()),
  //         );
  //       },
  //     ),
  //   ).paddingOnly(bottom: 1.h);
  // }

  Widget _buildFeaturedArticleItem(void Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: AppColor.lightGreyColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColor.lightGreyColor.withOpacity(0.1),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                width: SizeConfig.width,
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(8)),
                  child: Image.network(
                    'https://img.freepik.com/free-photo/photorealistic-valentines-day-celebration_23-2151128357.jpg?t=st=1718191431~exp=1718195031~hmac=c05ae22c22ed6dab74e0c82e7de3e485e6b510e2f8479ed7ddae3534958b8864&w=1800',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 0.7.h, vertical: 0.5.h),
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(8)),
                border: Border(
                  top: BorderSide(
                    color: AppColor.lightGreyColor.withOpacity(0.1),
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const GetTextW4S13(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ).paddingOnly(bottom: 0.5.h),
                  Row(
                    children: [
                      GetTextW4S12(
                        'John Doe',
                        color: AppColor.lightGreyColor.withOpacity(0.9),
                      ),
                      Icon(
                        Icons.circle,
                        size: 0.5.h,
                        color: AppColor.lightGreyColor.withOpacity(0.5),
                      ).paddingSymmetric(horizontal: 0.5.h),
                      GetTextW4S12(
                        '5 min read',
                        color: AppColor.lightGreyColor.withOpacity(0.9),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAgreementsGrid(String linkImage) {
    return SizedBox(
      height: 26.h,
      child: GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 2.h),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 1.h,
          childAspectRatio: 1 / 0.7,
        ),
        itemBuilder: (BuildContext context, int index) {
          return _buildAgreementItem(
              index,
              () => Get.to(
                    () => const UserProfileScreen(),
                  ),
              linkImage);
        },
      ),
    );
  }

  Widget _buildAgreementItem(
      int index, void Function()? onTap, String linkImage) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.lightGreyColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: NetworkImage(linkImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  child: GetTextW4S16(
                    'Leilani',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    color: AppColor.whiteColor,
                  ),
                ),
                GetTextW4S16(
                  ', 19',
                  color: AppColor.whiteColor,
                ),
              ],
            ).paddingOnly(bottom: 0.2.h),
            GestureDetector(
              onTap: () => Get.to(() => InboxChatScreen(
                    profilePic: RxString(
                        'https://img.freepik.com/free-photo/model-wearing-beautiful-shade-clothing_23-2151428017.jpg?t=st=1718194161~exp=1718197761~hmac=d4a5df429daa63b4242701a379e917aafadeb4fd30720ce143a72dd3e6cf7d36&w=740'),
                    name: RxString('Leilani'),
                  )),
              child: Container(
                width: SizeConfig.width,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 0.5.h),
                decoration: BoxDecoration(
                  color: AppColor.lightBlueColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const GetTextW4S12(
                  'Chat',
                  color: AppColor.whiteColor,
                ),
              ),
            ).paddingOnly(bottom: 0.5.h),
            GestureDetector(
              onTap: () {
                index == 0 || index == 3
                    ? Get.to(() => const CreateConsentFormScreen())
                    : Get.to(() => const ReviewAgreementScreen());
              },
              child: Container(
                width: SizeConfig.width,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 0.5.h),
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: GetTextW4S12(
                  index == 0 || index == 3
                      ? 'Create consent form'
                      : 'Review consent form',
                  color: AppColor.whiteColor,
                ),
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 1.h, vertical: 1.h),
      ),
    );
  }

  Widget _buildButton(
    String label,
    Color backgroundColor,
    Color textColor,
    VoidCallback onPressed,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.4.h),
      child: SizedBox(
        height: 5.h,
        width: SizeConfig.width,
        child: GetOutlineButton(
          'Link with Partner',
          onTap: onPressed,
          buttonColor: backgroundColor,
          textColor: textColor,
        ),
      ),
    );
  }

  void _handleCreateConsentFormPressed() {
    Get.to(() => ShareLinkConsentScreen());
    // Get.to(() => ConsentActivitiesScreen(indexConsentActivities: RxInt(1)));
  }
}
