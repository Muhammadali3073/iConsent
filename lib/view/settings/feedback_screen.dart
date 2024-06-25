import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/utils/data.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/widget/get_app_bar.dart';
import 'package:i_consent/widget/get_padding_spacing.dart';
import 'package:i_consent/widget/get_setting_tile.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  void _handleTileTap(BuildContext context, int index) {
    if (index == 0) {
    } else if (index == 1) {
    } else if (index == 2) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GetAppBar(title: 'Feedback & Support', centerTitle: true),
      body: SizedBox(
        height: SizeConfig.height,
        width: SizeConfig.width,
        child: SafeArea(
          child: Padding(
            padding: Spacing.only(right: 2, left: 2, top: 3),
            child: Column(
              children: List.generate(
                AppData.feedbackTileDataList.length,
                (index) => _buildFeedbackTile(context, index),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeedbackTile(BuildContext context, int index) {
    final tileData = AppData.feedbackTileDataList[index];
    return SettingsTile(
      title: tileData.title,
      icon: tileData.icon,
      isNext: tileData.isNext,
      onTap: () => _handleTileTap(context, index),
    ).paddingOnly(bottom: 1.5.h);
  }
}
