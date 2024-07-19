import 'package:flutter/material.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/widget/get_image.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    required this.title,
    required this.isNext,
    required this.icon,
    this.onTap,
  });

  final String title;
  final String icon;
  final bool isNext;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      overlayColor: WidgetStateColor.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 4.h,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: GetSvgImage(icon, color: AppColor.primaryColor),
                    ),
                  ),
                  GetTextW5S16(title.toString()),
                ],
              ),
              isNext
                  ? Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColor.darkBlackColor,
                      size: 2.h,
                    )
                  : const SizedBox.shrink()
            ],
          ),
          Divider(
            color: AppColor.lightGreyColor.withOpacity(0.4),
          ),
        ],
      ),
    );
  }
}
