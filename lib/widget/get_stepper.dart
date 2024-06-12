import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_consent/constants/color.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StepperBar extends StatelessWidget {
  const StepperBar(this.index, {super.key});

  final RxInt index;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        width: double.infinity,
        height: 1.h,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: AppColor.lightGreyColor)),
            ),
            FractionallySizedBox(
              widthFactor: index.value.toDouble() / 13,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.horizontal(
                      left: const Radius.circular(15),
                      right: Radius.circular(
                        index.value.toDouble() == 13 ? 15 : 0,
                      )),
                ),
              ),
            ),
          ],
        ),
      ).paddingSymmetric(horizontal: 2.h),
    );
  }
}
