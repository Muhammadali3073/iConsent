import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GetAssetImage extends StatelessWidget {
  const GetAssetImage(
    this.image, {
    super.key,
    this.height,
    this.width,
    this.color,
    this.scale,
    this.boxFit,
  });

  final String image;
  final double? height;
  final double? width;
  final Color? color;
  final double? scale;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/png/$image',
      color: color,
      width: width?.h,
      height: height?.h,
      fit: boxFit ?? BoxFit.contain,
      scale: scale,
    );
  }
}

class GetSvgImage extends StatelessWidget {
  const GetSvgImage(
    this.image, {
    super.key,
    this.height,
    this.color,
    this.width,
    this.boxFit,
  });

  final String image;
  final double? height;
  final Color? color;
  final double? width;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/svg/$image',
      width: width?.h,
      height: height?.h,
      fit: boxFit ?? BoxFit.contain,
      color: color,
    );
  }
}
