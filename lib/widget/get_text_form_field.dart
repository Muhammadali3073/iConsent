import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/extensions/keyboard_dismiss_extension.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GetTextFormField extends StatelessWidget {
  const GetTextFormField(
    this.hintText, {
    super.key,
    this.controller,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.prefixIcon,
    this.onTap,
    this.readOnly = false,
    this.suffixIconConstraintsWidth,
    this.suffixIconConstraintsHeight,
    this.prefixIconConstraintsHeight,
    this.prefixIconConstraintsWidth,
    this.inputFormatters,
    this.onChanged,
    this.maxLines,
    this.textInputAction,
    this.focusNode,
    this.maxLength,
  });

  final String hintText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final VoidCallback? onTap;
  final bool readOnly;
  final double? suffixIconConstraintsWidth;
  final double? suffixIconConstraintsHeight;
  final double? prefixIconConstraintsHeight;
  final double? prefixIconConstraintsWidth;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final int? maxLines;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      maxLines: maxLines ?? 1,
      maxLength: maxLength,
      keyboardType: keyboardType,
      obscureText: obscureText,
      cursorColor: Colors.black,
      controller: controller,
      onTap: onTap,
      onChanged: onChanged,
      readOnly: readOnly,
      textInputAction: textInputAction ?? TextInputAction.next,
      inputFormatters: inputFormatters,
      onTapOutside: (event) {
        context.dismissKeyboard();
      },
      style: textStyleW4S16(),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: AppColor.lightGreyColor, width: 0.1.h),
            borderRadius: BorderRadius.circular(0.8.h)),
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: AppColor.lightGreyColor, width: 0.1.h),
            borderRadius: BorderRadius.circular(0.8.h)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.8.h)),
        contentPadding: EdgeInsets.symmetric(
          vertical: 1.4.h,
          horizontal: 1.6.h,
        ),
        suffixIconConstraints: BoxConstraints.tightFor(
          width: suffixIconConstraintsWidth ?? 5.0.h,
          height: suffixIconConstraintsHeight ?? 2.4.h,
        ),
        prefixIconConstraints: BoxConstraints.tightForFinite(
          width: prefixIconConstraintsWidth ?? 5.0.h,
          height: prefixIconConstraintsHeight ?? 2.h,
        ),
        hintStyle:
            textStyleW4S16(color: AppColor.darkBlackColor.withOpacity(0.7)),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        isCollapsed: true,
        filled: true,
        fillColor: AppColor.whiteColor,
        hintText: hintText,
        enabled: true,
      ),
    );
  }
}
