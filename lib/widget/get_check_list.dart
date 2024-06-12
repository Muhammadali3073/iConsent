import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GetCheckList extends StatelessWidget {
  const GetCheckList({super.key, required this.activity, required this.onTap});

  final dynamic activity;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Obx(
        () => Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 1.4.h, horizontal: 2.h),
          margin: EdgeInsets.only(top: 1.4.h),
          decoration: BoxDecoration(
            color: activity.isCheck!.value
                ? AppColor.primaryColor
                : AppColor.whiteColor,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: activity.isCheck!.value
                  ? AppColor.primaryColor
                  : AppColor.lightGreyColor,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: GetTextW5S16(
                  activity.title.toString(),
                  color: activity.isCheck!.value
                      ? AppColor.whiteColor
                      : AppColor.darkBlackColor,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(
                    color: activity.isCheck!.value
                        ? AppColor.whiteColor
                        : AppColor.lightGreyColor.withOpacity(0.7),
                  ),
                ),
                child: Icon(
                  Icons.check,
                  size: 1.6.h,
                  color: activity.isCheck!.value
                      ? AppColor.primaryColor
                      : AppColor.lightGreyColor.withOpacity(0.7),
                ).paddingAll(0.3.h),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
