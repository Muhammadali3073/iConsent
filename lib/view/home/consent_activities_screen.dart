import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/utils/data.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/view/home/consent_form_screen.dart';
import 'package:i_consent/view/home/review_update_screen.dart';
import 'package:i_consent/widget/get_app_bar.dart';
import 'package:i_consent/widget/get_button.dart';
import 'package:i_consent/widget/get_check_list.dart';
import 'package:i_consent/widget/get_stepper.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:i_consent/widget/get_text_form_field.dart';
import 'package:i_consent/widget/get_toast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ConsentActivitiesScreen extends StatelessWidget {
  final RxInt indexConsentActivities;
  final bool? isEdit;

  ConsentActivitiesScreen({
    super.key,
    required this.indexConsentActivities,
    this.isEdit = false,
  });

  final TextEditingController certainSituationController =
      TextEditingController();
  final TextEditingController specificConditionController =
      TextEditingController();
  final TextEditingController additionalCustomizationController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PopScope(
        canPop: indexConsentActivities.value == 1 || isEdit!,
        onPopInvoked: (didPop) {
          if (!didPop && indexConsentActivities.value > 1) {
            indexConsentActivities.value--;
          }
        },
        child: Scaffold(
          appBar: _buildAppBar(context),
          body: _buildBody(),
          bottomNavigationBar: _buildBottomNavigationBar(context),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return GetAppBar(
      title: 'Consent Activities',
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          _clearSelectedItems();
          _goBack();
        },
        icon: Icon(
          Theme.of(context).platform == TargetPlatform.iOS
              ? CupertinoIcons.back
              : Icons.arrow_back_rounded,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: isEdit!
            ? PreferredSize(
                preferredSize: const Size.fromHeight(1.0),
                child: Container(
                  color: AppColor.darkBlackColor.withOpacity(0.1),
                  height: 1,
                ),
              )
            : StepperBar(RxInt(indexConsentActivities.value)),
      ),
      actions: [
        isEdit!
            ? const SizedBox.shrink()
            : TextButton(
                onPressed: () {
                  _clearSelectedItems();
                  _goNext();
                },
                child: const GetTextW4S14(
                  'Skip',
                  color: AppColor.primaryColor,
                ),
              ),
      ],
    );
  }

  Widget _buildBody() {
    return SizedBox(
      height: SizeConfig.height,
      width: SizeConfig.width,
      child: _buildConsentActivitiesList().paddingSymmetric(horizontal: 2.h),
    );
  }

  Widget _buildConsentActivitiesList() {
    return Obx(
      () {
        final currentStep = indexConsentActivities.value;
        final activityData = _getConsentActivityData(currentStep);

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetTextW5S16(activityData.question.toString())
                  .paddingOnly(top: 2.h),
              if (currentStep != 13)
                Column(
                  children: [
                    Column(
                      children: List.generate(
                        activityData.consentActivitiesCheck!.length,
                        (index) => _buildConsentActivityItem(
                            activityData.consentActivitiesCheck![index]),
                      ),
                    ),
                    if (currentStep == 11)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const GetTextW5S16('Only in certain situations')
                              .paddingOnly(bottom: 1.h, top: 1.h),
                          GetTextFormField(
                            'Specify here ...',
                            controller: certainSituationController,
                            maxLines: 3,
                          ).paddingOnly(bottom: 1.h),
                          const GetTextW5S16('With specific conditions')
                              .paddingOnly(bottom: 1.h),
                          GetTextFormField(
                            'Specify here ...',
                            controller: specificConditionController,
                            maxLines: 3,
                          ),
                        ],
                      )
                  ],
                )
              else
                GetTextFormField(
                  'Specify here ...',
                  controller: additionalCustomizationController,
                  maxLines: 5,
                ).paddingOnly(top: 1.h),
            ],
          ),
        );
      },
    );
  }

  void _updateActivityCheck(var activity) {
    activity.isCheck!.value = !activity.isCheck!.value;
  }

  Widget _buildConsentActivityItem(var activity) {
    return GetCheckList(
      activity: activity,
      onTap: () => _updateActivityCheck(activity),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return GetButton(
      isEdit! ? 'Save Changes' : 'Next',
      onTap: () {
        if (_isAnyItemChecked() || indexConsentActivities.value == 13) {
          _getConsentActivityData(indexConsentActivities.value).isSkip =
              RxBool(false);
          if (isEdit!) {
            Get.to(() => const ReviewUpdateScreen());
          } else {
            _goNext();
          }
        } else {
          showSnackBar(
            'Please select at least one item before proceeding.',
            false,
          );
        }
      },
    ).paddingOnly(
      right: 3.w,
      left: 3.w,
      bottom: 2.h,
    );
  }

  ConsentActivitiesData _getConsentActivityData(int currentStep) {
    switch (currentStep) {
      case 1:
        return AppData.kissingConsentActivitiesData;
      case 2:
        return AppData.touchingConsentActivitiesData;
      case 3:
        return AppData.sexualTouchingConsentActivitiesData;
      case 4:
        return AppData.oralActivitiesConsentActivitiesData;
      case 5:
        return AppData.intercourseConsentActivitiesData;
      case 6:
        return AppData.kinkConsentActivitiesData;
      case 7:
        return AppData.communicationConsentActivitiesData;
      case 8:
        return AppData.physicalIntimacyConsentActivitiesData;
      case 9:
        return AppData.digitalIntimacyConsentActivitiesData;
      case 10:
        return AppData.experimentalConsentActivitiesData;
      case 11:
        return AppData.conditionsConsentActivitiesData;
      case 12:
        return AppData.comfortConsentActivitiesData;
      default:
        return AppData.customizationConsentActivitiesData;
    }
  }

  bool _isAnyItemChecked() {
    final currentStep = indexConsentActivities.value;
    final activityData = _getConsentActivityData(currentStep);
    return activityData.consentActivitiesCheck!
        .any((activity) => activity.isCheck!.value);
  }

  void _clearSelectedItems() {
    final currentStep = indexConsentActivities.value;
    final activityData = _getConsentActivityData(currentStep);
    activityData.isSkip = RxBool(true);
    for (var activity in activityData.consentActivitiesCheck!) {
      activity.isCheck!.value = false;
    }
  }

  void _goNext() {
    final currentStep = indexConsentActivities.value;
    if (currentStep < 13) {
      indexConsentActivities.value++;
    } else if (indexConsentActivities.value == 13) {
      Get.off(() => const ConsentFormScreen());
    }
  }

  void _goBack() {
    final currentStep = indexConsentActivities.value;
    if (currentStep > 1 && !isEdit!) {
      indexConsentActivities.value--;
    } else {
      Get.back();
    }
  }
}
