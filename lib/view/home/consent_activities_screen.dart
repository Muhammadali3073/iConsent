import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:i_consent/constants/data.dart';
import 'package:i_consent/controller/consent_activities_controller.dart';
import 'package:i_consent/utils/size_config/size_config.dart';
import 'package:i_consent/widget/get_app_bar.dart';
import 'package:i_consent/widget/get_button.dart';
import 'package:i_consent/widget/get_check_list.dart';
import 'package:i_consent/widget/get_stepper.dart';
import 'package:i_consent/widget/get_text.dart';
import 'package:i_consent/widget/get_text_form_field.dart';
import 'package:i_consent/widget/get_toast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ConsentActivitiesScreen extends StatelessWidget {
  ConsentActivitiesScreen({super.key});

  static var stepConsentActivitiesData = 1.obs;

  final ConsentActivitiesController controller =
      Get.put(ConsentActivitiesController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PopScope(
        canPop: stepConsentActivitiesData.value == 1,
        onPopInvoked: (didPop) {
          if (!didPop && stepConsentActivitiesData.value > 1) {
            stepConsentActivitiesData.value--;
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
      centerTitle: false,
      leading: IconButton(
        onPressed: _goBack,
        icon: Icon(
          Theme.of(context).platform == TargetPlatform.iOS
              ? CupertinoIcons.back
              : Icons.arrow_back_rounded,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: StepperBar(RxInt(stepConsentActivitiesData.value)),
      ),
      actions: [
        TextButton(
          onPressed: _goNext,
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
        final currentStep = stepConsentActivitiesData.value;
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
                            controller: controller.certainSituationController,
                            maxLines: 3,
                          ).paddingOnly(bottom: 1.h),
                          const GetTextW5S16('With specific conditions')
                              .paddingOnly(bottom: 1.h),
                          GetTextFormField(
                            'Specify here ...',
                            controller: controller.specificConditionController,
                            maxLines: 3,
                          ),
                        ],
                      )
                  ],
                )
              else
                GetTextFormField(
                  'Specify here ...',
                  controller: controller.additionalCustomizationController,
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
    return Obx(
      () => GetButton(
        stepConsentActivitiesData.value == 13 ? 'Review' : 'Next',
        onTap: () {
          if (_isAnyItemChecked() || stepConsentActivitiesData.value == 13) {
            _goNext();
          } else {
            showToast(
                context, 'Please select at least one item before proceeding.');
          }
        },
      ).paddingOnly(
        right: 3.w,
        left: 3.w,
        bottom: 2.h,
      ),
    );
  }

  bool _isAnyItemChecked() {
    final currentStep = stepConsentActivitiesData.value;
    final activityData = _getConsentActivityData(currentStep);
    return activityData.consentActivitiesCheck!
        .any((activity) => activity.isCheck!.value);
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

  void _goNext() {
    final currentStep = stepConsentActivitiesData.value;
    if (currentStep < 13) {
      stepConsentActivitiesData.value++;
    }
  }

  void _goBack() {
    final currentStep = stepConsentActivitiesData.value;
    if (currentStep > 1) {
      stepConsentActivitiesData.value--;
    } else {
      Get.back();
    }
  }
}
