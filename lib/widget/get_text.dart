import 'package:flutter/material.dart';
import 'package:i_consent/constants/color.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

TextStyle textStyleW4S16({Color? color}) {
  return TextStyle(
    color: color ?? AppColor.darkBlackColor,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );
}

class GetTextW3S14 extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;

  const GetTextW3S14(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      textAlign: textAlign,
      overflow: overflow,
      style: TextStyle(
        color: color ?? AppColor.darkBlackColor,
        fontSize: 15.sp,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}

class GetTextW4S14 extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

  const GetTextW4S14(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.overflow,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        color: color ?? AppColor.darkBlackColor,
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class GetTextW5S16 extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;

  const GetTextW5S16(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      textAlign: textAlign,
      overflow: overflow,
      style: TextStyle(
        color: color ?? AppColor.darkBlackColor,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
class GetTextBS17 extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;

  const GetTextBS17(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      textAlign: textAlign,
      overflow: overflow,
      style: TextStyle(
        color: color ?? AppColor.darkBlackColor,
        fontSize: 17.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class GetTextW4S16 extends StatelessWidget {
  final String text;
  final Color? color;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;

  const GetTextW4S16(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.overflow,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        color: color ?? AppColor.darkBlackColor,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class GetTextW6S19 extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;

  const GetTextW6S19(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      textAlign: textAlign,
      overflow: overflow,
      style: TextStyle(
        color: color ?? AppColor.darkBlackColor,
        fontSize: 19.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
class GetTextW6S18 extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;

  const GetTextW6S18(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      textAlign: textAlign,
      overflow: overflow,
      style: TextStyle(
        color: color ?? AppColor.darkBlackColor,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class GetTextW4S13 extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;


  const GetTextW4S13(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.overflow,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        color: color ?? AppColor.darkBlackColor,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class GetTextW4S12 extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;


  const GetTextW4S12(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.overflow,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        color: color ?? AppColor.darkBlackColor,
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class GetTextBS28 extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;

  const GetTextBS28(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      textAlign: textAlign,
      overflow: overflow,
      style: TextStyle(
        color: color ?? AppColor.darkBlackColor,
        fontSize: 22.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
