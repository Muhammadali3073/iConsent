import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/constants/data.dart';
import 'package:i_consent/view/home/all_agreements_screen.dart';
import 'package:i_consent/view/home/article_details_screen.dart';
import 'package:i_consent/view/home/articles_screen.dart';
import 'package:i_consent/view/home/consent_activities_screen.dart';
import 'package:i_consent/view/profile/user_profile_screen.dart';
import 'package:i_consent/widget/get_image.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GetAssetImage(AppData.logo, scale: 0.9.h),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_outlined, size: 4.h),
          )
        ],
        toolbarHeight: 12.h,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader(
              'Featured Articles',
              'See all',
              () => Get.to(() => const ArticlesScreen()),
            ),
            _buildFeaturedArticlesGrid(),
            _buildSectionHeader(
              'Agreements',
              'See all',
              () => Get.to(() => const AllAgreementsScreen()),
            ),
            _buildAgreementsGrid(),
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

  Widget _buildFeaturedArticlesGrid() {
    return SizedBox(
      height: 24.h,
      child: GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 2.h),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 1.h,
          childAspectRatio: 1 / 1.4,
        ),
        itemBuilder: (BuildContext context, int index) {
          return _buildFeaturedArticleItem(
            () => Get.to(() => const ArticlesDetailsScreen()),
          );
        },
      ),
    ).paddingOnly(bottom: 1.h);
  }

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
                width: double.infinity,
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

  Widget _buildAgreementsGrid() {
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
            () => Get.to(() => const UserProfileScreen()),
          );
        },
      ),
    );
  }

  Widget _buildAgreementItem(void Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.lightGreyColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          image: const DecorationImage(
            image: NetworkImage(
                'https://img.freepik.com/free-photo/model-wearing-beautiful-shade-clothing_23-2151428017.jpg?t=st=1718194161~exp=1718197761~hmac=d4a5df429daa63b4242701a379e917aafadeb4fd30720ce143a72dd3e6cf7d36&w=740'),
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
              onTap: () {},
              child: Container(
                width: double.infinity,
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
              onTap: () {},
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 0.5.h),
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const GetTextW4S12(
                  'Review Consent Form',
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
        width: double.infinity,
        child: OutlinedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(backgroundColor),
            foregroundColor: WidgetStateProperty.all<Color>(textColor),
            overlayColor: WidgetStateProperty.all<Color>(
                AppColor.primaryColor.withOpacity(0.3)),
            side: WidgetStateProperty.all<BorderSide>(
                const BorderSide(color: AppColor.darkBlackColor, width: 1)),
            shape: WidgetStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          ),
          child: GetTextW4S16(label, color: textColor),
        ),
      ),
    );
  }

  void _handleCreateConsentFormPressed() {
    Get.to(() => ConsentActivitiesScreen());
  }
}
