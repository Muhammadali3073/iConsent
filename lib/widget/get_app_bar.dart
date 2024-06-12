import 'package:flutter/material.dart';
import 'package:i_consent/constants/color.dart';

import 'get_text.dart';

class GetAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final double lineHeight;
  final bool centerTitle;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final Widget? leading;

  const GetAppBar({
    super.key,
    this.title,
    this.lineHeight = 1,
    this.centerTitle = true,
    this.actions,
    this.bottom,
    this.leading,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight + 1.5);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      scrolledUnderElevation: 0,
      backgroundColor: AppColor.bgColor,
      title: GetTextW6S19(title ?? ''),
      centerTitle: centerTitle,
      actions: actions,
      bottom: bottom ??
          PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              color: AppColor.darkBlackColor.withOpacity(0.1),
              height: lineHeight,
            ),
          ),
    );
  }
}
