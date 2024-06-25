import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/utils/data.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/view/chat/inbox_chat_screen.dart';
import 'package:i_consent/widget/get_app_bar.dart';
import 'package:i_consent/widget/get_image.dart';
import 'package:i_consent/widget/get_spacing.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GetAppBar(
        title: 'Chat',
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: GetSvgImage(AppData.addChatIcon, height: 0.3.h))
        ],
      ),
      body: SizedBox(
        height: SizeConfig.height,
        width: SizeConfig.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VerSpace(2),
            const GetTextW6S19(
              'Messages',
              color: AppColor.primaryColor,
            ).paddingSymmetric(horizontal: 2.h),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: AppData.chatsData.length,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: 1.h, bottom: 10.h),
                itemBuilder: (context, index) {
                  return Slidable(
                    key: ValueKey(index),
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            // Add your mute action here
                          },
                          backgroundColor:
                              AppColor.lightGreyColor.withOpacity(0.5),
                          foregroundColor: Colors.white,
                          icon: Icons.volume_off_rounded,
                        ),
                        SlidableAction(
                          onPressed: (context) {
                            // Add your delete action here
                          },
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                        ),
                      ],
                    ),
                    child: InkWell(
                      hoverColor: Colors.transparent,
                      overlayColor: WidgetStateColor.transparent,
                      focusColor: Colors.transparent,
                      onTap: () {
                        Get.to(() => InboxChatScreen(
                              name: RxString(AppData.chatsData[index].name),
                              profilePic:
                                  RxString(AppData.chatsData[index].profilePic),
                            ));
                      },
                      child: SizedBox(
                        height: 9.h,
                        width: SizeConfig.width,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: CircleAvatar(
                                  radius: 4.h,
                                  backgroundColor:
                                      AppColor.lightGreyColor.withOpacity(0.1),
                                  backgroundImage: NetworkImage(
                                    AppData.chatsData[index].profilePic,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Spacer(),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: GetTextW4S12(
                                      AppData.chatsData[index].lastMsgTime,
                                      color: AppColor.lightGreyColor,
                                    ),
                                  ).paddingOnly(right: 2.h),
                                  Row(
                                    children: [
                                      const HorSpace(1),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            GetTextBS16(
                                              AppData.chatsData[index].name,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const VerSpace(0.4),
                                            GetTextW4S14(
                                              AppData.chatsData[index].lastMsg,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              color: AppColor.lightGreyColor,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const HorSpace(2),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 0.6.h, vertical: 0.2.h),
                                        alignment: Alignment.center,
                                        decoration: const BoxDecoration(
                                          color: AppColor.primaryColor,
                                          borderRadius: BorderRadiusDirectional.all(Radius.circular(20))
                                        ),
                                        child: GetTextW4S11(
                                          AppData.chatsData[index].newMsgCount,
                                          color: AppColor.whiteColor,
                                        ),
                                      ).paddingOnly(right: 2.h),
                                    ],
                                  ),
                                  const Spacer(flex: 2),
                                  Divider(
                                    color: AppColor.lightGreyColor
                                        .withOpacity(0.3),
                                    height: 0.0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ).paddingOnly(left: 2.h),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
