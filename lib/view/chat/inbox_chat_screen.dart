import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/extensions/keyboard_dismiss_extension.dart';
import 'package:i_consent/utils/data.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/utils/utils.dart';
import 'package:i_consent/widget/get_image.dart';
import 'package:i_consent/widget/get_spacing.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:i_consent/widget/get_text_form_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

enum Options { create, modify, cancel, report, block, delete }

class InboxChatScreen extends StatelessWidget {
  final RxString profilePic;
  final RxString name;

  InboxChatScreen({super.key, required this.profilePic, required this.name});

  final TextEditingController messageController = TextEditingController();
  final RxInt _popupMenuItemIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildMessageList(context),
          _buildMessageInput(),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    final appBarHeight = AppBar().preferredSize.height;

    return AppBar(
      backgroundColor: AppColor.bgColor,
      scrolledUnderElevation: 0,
      title: Row(
        children: [
          CircleAvatar(
            radius: 2.2.h,
            backgroundColor: AppColor.lightGreyColor.withOpacity(0.1),
            backgroundImage: NetworkImage(profilePic.value),
          ),
          const HorSpace(1),
          GetTextW6S19(name.value),
        ],
      ),
      centerTitle: false,
      leadingWidth: 4.h,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const GetSvgImage(AppData.videoIcon),
        ),
        IconButton(
          onPressed: () {},
          icon: const GetSvgImage(AppData.callIcon),
        ),
        PopupMenuButton(
          icon: const GetSvgImage(AppData.chatMenuIcon),
          onSelected: (value) => _onMenuItemSelected(value),
          offset: Offset(0.0, appBarHeight - 2.h),
          color: AppColor.bgColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          itemBuilder: (ctx) => _buildPopupMenuItems(),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: AppColor.darkBlackColor.withOpacity(0.1),
          height: 1,
        ),
      ),
    );
  }

  List<PopupMenuItem<int>> _buildPopupMenuItems() {
    return [
      _buildPopupMenuItem('Create consent form', Options.create.index),
      _buildPopupMenuItem('Modify consent form', Options.modify.index),
      _buildPopupMenuItem('Cancel consent form', Options.cancel.index),
      _buildPopupMenuItem('Report', Options.report.index,
          iconData: Icons.person_off_rounded),
      _buildPopupMenuItem('Block', Options.block.index,
          iconData: Icons.front_hand_rounded),
      _buildPopupMenuItem('Delete Chat', Options.delete.index,
          iconData: Icons.delete_rounded,
          isDivider: false,
          color: AppColor.primaryColor),
    ];
  }

  PopupMenuItem<int> _buildPopupMenuItem(
    String title,
    int position, {
    IconData? iconData,
    bool isDivider = true,
    Color? color,
  }) {
    return PopupMenuItem(
      value: position,
      padding: EdgeInsets.zero,
      height: 0,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.h),
            child: Row(
              mainAxisAlignment: iconData != null
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.start,
              children: [
                GetTextW4S16(title, color: color ?? AppColor.darkBlackColor),
                if (iconData != null)
                  Icon(
                    iconData,
                    color: color ?? AppColor.darkBlackColor,
                    size: 3.h,
                  ),
              ],
            ),
          ),
          if (isDivider)
            Divider(
              color: AppColor.lightGreyColor.withOpacity(0.3),
              height: 0.0,
            ),
        ],
      ),
    );
  }

  void _onMenuItemSelected(int value) {
    _popupMenuItemIndex.value = value;
    // Handle menu item selection
  }

  Widget _buildMessageList(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        reverse: true,
        child: GestureDetector(
          onTap: () {
            context.dismissKeyboard();
          },
          child: Obx(
            () => ListView.builder(
              itemCount: AppData.messages.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final message =
                    AppData.messages[index];
                final isOther = message.sender == name.value;
                return _buildMessageBubble(message, isOther);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMessageBubble(Message message, bool isOther) {
    return Align(
      alignment: isOther ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.only(
          top: 0.5.h,
          bottom: 0.5.h,
          left: isOther ? 2.h : SizeConfig.width / 4,
          right: isOther ? SizeConfig.width / 4 : 2.h,
        ),
        padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.h),
        decoration: BoxDecoration(
          color: isOther
              ? AppColor.primaryColor.withOpacity(0.1)
              : AppColor.lightGreyColor.withOpacity(0.1),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(12),
            topRight: const Radius.circular(12),
            bottomLeft:
                isOther ? const Radius.circular(0) : const Radius.circular(12),
            bottomRight:
                isOther ? const Radius.circular(12) : const Radius.circular(0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GetTextW3S14(message.text),
            GetTextW4S11(Utils.formatDateTime(message.timestamp),
                color: AppColor.lightGreyColor),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: EdgeInsets.only(right: 2.h, left: 2.h, bottom: 3.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 2.2.h,
            backgroundColor: AppColor.primaryColor,
            child: GetSvgImage(AppData.fileIcon, height: 0.3.h),
          ),
          const HorSpace(1.6),
          Expanded(
            child: GetTextFormField(
              'Type your message',
              vertical: 1.h,
              maxLines: 3,
              controller: messageController,
              onTapOutside: (event) {},
            ),
          ),
          const HorSpace(1.6),
          GestureDetector(
            onTap: _sendMessage,
            child: CircleAvatar(
              radius: 2.2.h,
              backgroundColor: AppColor.primaryColor,
              child: GetSvgImage(AppData.sendIcon, height: 0.3.h),
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    if (messageController.text.isNotEmpty) {
      AppData.messages.add(Message(
        text: messageController.text.trim(),
        sender: name.value != 'Vicki' ? 'Vicki' : 'Bonnie',
        timestamp: DateTime.now(),
      ));
      messageController.clear();
    }
  }
}
