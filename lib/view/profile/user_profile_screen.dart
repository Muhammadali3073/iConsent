import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/utils/data.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/utils/utils.dart';
import 'package:i_consent/view/chat/inbox_chat_screen.dart';
import 'package:i_consent/view/home/consent_form_screen.dart';
import 'package:i_consent/view/home/review_agreement_screen.dart';
import 'package:i_consent/widget/get_button.dart';
import 'package:i_consent/widget/get_image.dart';
import 'package:i_consent/widget/get_spacing.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Utils.setStatusBarColor();
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent, scrolledUnderElevation: 0),
      extendBodyBehindAppBar: true,
      body: SizedBox(
        height: SizeConfig.height,
        width: SizeConfig.width,
        child: Column(
          children: [
            Container(
              height: 60.h,
              width: SizeConfig.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://img.freepik.com/free-photo/model-wearing-beautiful-shade-clothing_23-2151428017.jpg?t=st=1718194161~exp=1718197761~hmac=d4a5df429daa63b4242701a379e917aafadeb4fd30720ce143a72dd3e6cf7d36&w=740',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 3.h),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    GetTextW6S18(
                                      'Jessica Parker',
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    GetTextW6S19(
                                      ', 23',
                                    ),
                                  ],
                                ),
                                GetTextW4S16(
                                  'Female',
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () => Get.to(() => InboxChatScreen(
                                    profilePic: RxString(
                                        'https://img.freepik.com/free-photo/model-wearing-beautiful-shade-clothing_23-2151428017.jpg?t=st=1718194161~exp=1718197761~hmac=d4a5df429daa63b4242701a379e917aafadeb4fd30720ce143a72dd3e6cf7d36&w=740'),
                                    name: RxString('Jessica Parker'),
                                  )),
                              child: GetSvgImage(
                                AppData.chatIcon,
                                color: AppColor.primaryColor,
                                height: 4,
                              ),
                            )
                          ],
                        ),
                        const VerSpace(1.5),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GetTextBS17(
                                  'Location',
                                  overflow: TextOverflow.ellipsis,
                                ),
                                GetTextW4S16(
                                  'Chicago, IL United States',
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(1.h),
                              decoration: BoxDecoration(
                                  color: AppColor.primaryColor.withOpacity(0.2),
                                  borderRadius:
                                      const BorderRadiusDirectional.all(
                                          Radius.circular(8))),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: AppColor.primaryColor,
                                    size: 2.h,
                                  ),
                                  const GetTextW4S14(
                                    '1 km',
                                    color: AppColor.primaryColor,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    _buildEditReviewButtons(context),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildEditReviewButtons(BuildContext context) {
    return Column(
      children: [
        _buildButton(context, 'Edit Consent Form', AppColor.primaryColor,
            AppColor.whiteColor, _handleEditPressed),
        const VerSpace(1.5),
        _buildButton(context, 'Review Consent Form', AppColor.whiteColor,
            AppColor.darkBlackColor, _handleReviewPressed,
            isOutlined: true),
      ],
    );
  }

  Widget _buildButton(BuildContext context, String label, Color backgroundColor,
      Color textColor, VoidCallback onPressed,
      {bool isOutlined = false}) {
    return SizedBox(
      height: 5.h,
      width: SizeConfig.width,
      child: isOutlined
          ? GetOutlineButton(
              label,
              onTap: onPressed,
              buttonColor: backgroundColor,
              textColor: textColor,
            )
          : GetButton(
              label,
              onTap: onPressed,
              buttonColor: backgroundColor,
              textColor: textColor,
            ),
    );
  }

  void _handleEditPressed() {
    Get.to(() => const ConsentFormScreen());
  }

  void _handleReviewPressed() {
    Get.to(() => const ReviewAgreementScreen());
  }
}
