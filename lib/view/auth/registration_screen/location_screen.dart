import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/utils/data.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/view/auth/registration_screen/age_screen.dart';
import 'package:i_consent/widget/get_app_bar.dart';
import 'package:i_consent/widget/get_button.dart';
import 'package:i_consent/widget/get_padding_spacing.dart';
import 'package:i_consent/widget/get_spacing.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:i_consent/widget/get_toast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LocationScreen extends StatelessWidget {
  LocationScreen({super.key});

  final TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GetAppBar(
        title: 'About me',
        // actions: [
        //   TextButton(
        //     onPressed: () {
        //       locationController.clear();
        //       Get.to(() => AgeScreen());
        //     },
        //     child: const GetTextW4S14(
        //       'Skip',
        //       color: AppColor.primaryColor,
        //     ),
        //   ),
        // ],
      ),
      body: SizedBox(
        height: SizeConfig.height,
        width: SizeConfig.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: Spacing.only(right: 2, left: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GetTextW5S16('I live in')
                    .paddingOnly(top: 3.h, bottom: 2.h),
                TypeAheadField<City>(
                  suggestionsCallback: (search) => AppData.find(search),
                  controller: locationController,
                  builder: (context, controller, focusNode) {
                    return TextFormField(
                      controller: controller,
                      focusNode: focusNode,
                      style: textStyleW4S16(),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColor.lightGreyColor, width: 0.1.h),
                            borderRadius: BorderRadius.circular(0.8.h)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColor.lightGreyColor, width: 0.1.h),
                            borderRadius: BorderRadius.circular(0.8.h)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0.8.h)),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 1.4.h,
                          horizontal: 1.6.h,
                        ),
                        suffixIconConstraints: BoxConstraints.tightFor(
                          width: 5.0.h,
                          height: 5.h,
                        ),
                        prefixIconConstraints: BoxConstraints.tightForFinite(
                          width: 5.0.h,
                          height: 5.h,
                        ),
                        hintStyle: textStyleW4S16(
                            color: AppColor.darkBlackColor.withOpacity(0.7)),
                        prefixIcon: const Icon(
                          Icons.location_on_outlined,
                          color: AppColor.primaryColor,
                        ),
                        suffixIcon: const Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: AppColor.primaryColor,
                        ),
                        isCollapsed: true,
                        filled: true,
                        fillColor: AppColor.whiteColor,
                        hintText: 'Enter location',
                        enabled: true,
                      ),
                    );
                  },
                  itemBuilder: (context, city) {
                    return _buildCityInfo(city);
                  },
                  onSelected: (city) {
                    locationController.text = city.name;
                  },
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: GetButton('Next', onTap: () {
        if (locationController.text.isNotEmpty) {
          Get.to(() => AgeScreen());
        } else {
          showSnackBar('Please enter location before next.', false);
        }
      }).paddingOnly(
        right: 2.h,
        left: 2.h,
        bottom: 3.h,
      ),
    );
  }

  Widget _buildCityInfo(city) {
    return Column(
      children: [
        const VerSpace(1),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GetTextW4S16(city.name),
            GetTextW4S14(city.country, color: AppColor.lightGreyColor),
          ],
        ),
        Divider(
          color: AppColor.lightGreyColor.withOpacity(0.4),
        ),
      ],
    ).paddingSymmetric(horizontal: 2.h);
  }
}
