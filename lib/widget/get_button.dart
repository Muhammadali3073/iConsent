import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GetButton extends StatelessWidget {
  final String text;
  final Color? buttonColor;
  final Color? textColor;
  final void Function() onTap;

  const GetButton(
    this.text, {
    super.key,
    this.buttonColor,
    this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      color: buttonColor ?? AppColor.primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: GetTextW4S16(text, color: textColor ?? AppColor.whiteColor),
    );
  }
}

class GetSocialButton extends StatelessWidget {
  final String text;
  final Color? buttonColor;
  final Color? textColor;
  final Widget icon;
  final void Function() onTap;

  const GetSocialButton(
    this.text, {
    super.key,
    this.buttonColor,
    this.textColor,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: SizeConfig.width,
        decoration: BoxDecoration(
          color: buttonColor ?? AppColor.whiteColor,
          border: Border.all(color: AppColor.lightGreyColor.withOpacity(0.3)),
          borderRadius: const BorderRadiusDirectional.all(
            Radius.circular(8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            GetTextW4S14(
              text,
              color: textColor ?? AppColor.darkBlackColor,
              textAlign: TextAlign.center,
            )
          ],
        ).paddingSymmetric(vertical: 0.8.h),
      ),
    );
  }
}

class GetOutlineButton extends StatelessWidget {
  final String text;
  final Color? buttonColor;
  final Color? textColor;
  final void Function() onTap;

  const GetOutlineButton(
    this.text, {
    super.key,
    this.buttonColor,
    this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor:
            WidgetStateProperty.all<Color>(buttonColor ?? AppColor.whiteColor),
        foregroundColor: WidgetStateProperty.all<Color>(
            textColor ?? AppColor.darkBlackColor),
        overlayColor: WidgetStateProperty.all<Color>(
            AppColor.lightGreyColor.withOpacity(0.3)),
        side: WidgetStateProperty.all<BorderSide>(
            const BorderSide(color: AppColor.darkBlackColor, width: 1)),
        shape: WidgetStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      ),
      child: GetTextW4S16(text, color: textColor ?? AppColor.darkBlackColor),
    );
  }
}
