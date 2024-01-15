import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimensions.dart';

class CustomProgressBar extends StatelessWidget {
  final String progressBarDesc;
  final String companyHeader;
  final int currentStep;

  const CustomProgressBar({
    super.key,
    required this.progressBarDesc,
    required this.companyHeader,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          companyHeader,
          style: TextStyle(
            color: AppColors.fontColorDarkBrown,
            fontSize: AppDimensions.kFontSize24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Text(
          progressBarDesc,
          style: TextStyle(
            color: AppColors.colorPrimary,
            fontSize: AppDimensions.kFontSize16,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 6.h),
        LinearProgressBar(
          maxSteps: 3,
          progressType: LinearProgressBar.progressTypeLinear,
          currentStep: currentStep,
          progressColor: AppColors.colorPrimary,
          backgroundColor: AppColors.colorPrimaryLight,
        )
      ],
    );
  }
}
