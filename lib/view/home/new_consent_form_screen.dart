import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/utils/data.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/view/home/confirmation_details_screen.dart';
import 'package:i_consent/widget/get_app_bar.dart';
import 'package:i_consent/widget/get_button.dart';
import 'package:i_consent/widget/get_check_list.dart';
import 'package:i_consent/widget/get_spacing.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:i_consent/widget/get_text_form_field.dart';
import 'package:i_consent/widget/get_toast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NewConsentFormScreen extends StatelessWidget {
  NewConsentFormScreen(
      {super.key, this.isSelected = false, this.isResponse = false});

  final bool isResponse;
  final bool isSelected;
  final TextEditingController certainSituationController =
      TextEditingController();
  final TextEditingController specificConditionController =
      TextEditingController();
  final TextEditingController additionalCustomizationController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return const GetAppBar(
      title: 'Consent Activities',
      centerTitle: true,
    );
  }

  Widget _buildBody() {
    return SizedBox(
      height: SizeConfig.height,
      width: SizeConfig.width,
      child: _buildConsentActivitiesList(),
    );
  }

  Widget _buildConsentActivitiesList() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
            AppData.consentFormData.length,
            (index) => Obx(
                  () => AppData.consentFormData[index].isSkip.value
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GetTextW5S16(_getConsentActivityData(index)
                                    .question
                                    .toString())
                                .paddingSymmetric(horizontal: 2.h),
                            if (index + 1 != 13)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: List.generate(
                                      _getConsentActivityData(index)
                                          .consentActivitiesCheck!
                                          .length,
                                      (i) => _buildConsentActivityItem(
                                          _getConsentActivityData(index)
                                              .consentActivitiesCheck![i],
                                          isSelected),
                                    ),
                                  ).paddingSymmetric(horizontal: 2.h),
                                  Obx(
                                    () => Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        _getConsentActivityData(index)
                                                .isAddMore!
                                                .value
                                            ? Expanded(
                                                child: GetTextFormField(
                                                  'Enter your preference ...',
                                                  controller:
                                                      certainSituationController,
                                                  minLines: 1,
                                                  maxLines: 3,
                                                ),
                                              )
                                            : const SizedBox.shrink(),
                                        GetButton(
                                          _getConsentActivityData(index)
                                                  .isAddMore!
                                                  .value
                                              ? 'remove'
                                              : 'add more',
                                          onTap: () {
                                            _getConsentActivityData(index)
                                                    .isAddMore!
                                                    .value =
                                                !_getConsentActivityData(index)
                                                    .isAddMore!
                                                    .value;
                                          },
                                        ).paddingOnly(left: 2.h),
                                      ],
                                    ).paddingOnly(
                                        top: 1.h, right: 2.h, left: 2.h),
                                  ),
                                  if (index + 1 == 11)
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const GetTextW5S16(
                                                'Only in certain situations')
                                            .paddingOnly(
                                                bottom: 1.h,
                                                top: 1.h,
                                                right: 2.h,
                                                left: 2.h),
                                        GetTextFormField(
                                          'Specify here ...',
                                          controller:
                                              certainSituationController,
                                          minLines: 3,
                                          maxLines: 3,
                                        ).paddingOnly(
                                            bottom: 1.h, right: 2.h, left: 2.h),
                                        const GetTextW5S16(
                                                'With specific conditions')
                                            .paddingOnly(
                                                bottom: 1.h,
                                                right: 2.h,
                                                left: 2.h),
                                        GetTextFormField(
                                          'Specify here ...',
                                          controller:
                                              specificConditionController,
                                          minLines: 3,
                                          maxLines: 3,
                                        ).paddingOnly(right: 2.h, left: 2.h),
                                      ],
                                    )
                                ],
                              )
                            else
                              GetTextFormField(
                                'Specify here ...',
                                controller: additionalCustomizationController,
                                minLines: 3,
                                maxLines: 5,
                              ).paddingOnly(top: 1.h, right: 2.h, left: 2.h),
                            const VerSpace(2),
                            const Divider(
                              color: AppColor.lightGreyColor,
                              height: 0,
                            )
                          ],
                        ).paddingSymmetric(vertical: 1.h)
                      : const SizedBox.shrink(),
                )),
      ),
    );
  }

  void _updateActivityCheck(var activity, bool isSelected) {
    if (isSelected) {
      showSnackBar(
        'These preferences selectable for your\'s partner first',
        false,
      );
    } else {
      activity.isCheck!.value = !activity.isCheck!.value;
      _isAnyActivityUnchecked();
    }
  }

  Widget _buildConsentActivityItem(var activity, bool isSelected) {
    return GetCheckList(
      activity: activity,
      onTap: () => _updateActivityCheck(activity, isSelected),
      isSelected: isSelected,
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return GetButton(
      'Next',
      onTap: () {
        Get.to(() => ConfirmationDetailsScreen(isResponse: isResponse,));
      },
    ).paddingOnly(
      right: 3.w,
      left: 3.w,
      bottom: 2.h,
    );
  }

  void _isAnyActivityUnchecked() {
    for (var consentData in AppData.consentFormData) {
      for (var activity in consentData.consentActivitiesCheck!) {
        if (activity.isCheck!.value == true) {
          consentData.isSkip.value = true;
        }
      }
    }
  }

  ConsentActivitiesData _getConsentActivityData(int currentStep) {
    switch (currentStep) {
      case 0:
        return AppData.kissingConsentActivitiesData;
      case 1:
        return AppData.touchingConsentActivitiesData;
      case 2:
        return AppData.sexualTouchingConsentActivitiesData;
      case 3:
        return AppData.oralActivitiesConsentActivitiesData;
      case 4:
        return AppData.intercourseConsentActivitiesData;
      case 5:
        return AppData.kinkConsentActivitiesData;
      case 6:
        return AppData.communicationConsentActivitiesData;
      case 7:
        return AppData.physicalIntimacyConsentActivitiesData;
      case 8:
        return AppData.digitalIntimacyConsentActivitiesData;
      case 9:
        return AppData.experimentalConsentActivitiesData;
      case 10:
        return AppData.conditionsConsentActivitiesData;
      case 11:
        return AppData.comfortConsentActivitiesData;
      default:
        return AppData.customizationConsentActivitiesData;
    }
  }
}
