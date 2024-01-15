import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technical_assesment/utils/app_colors.dart';
import 'package:technical_assesment/utils/app_dimensions.dart';
import 'package:technical_assesment/utils/app_strings.dart';

import '../../../../../utils/app_constant.dart';
import '../../widgets/job_card.dart';

class AppliedJobScreen extends StatefulWidget {
  const AppliedJobScreen({Key? key}) : super(key: key);

  @override
  State<AppliedJobScreen> createState() => _AppliedJobScreenState();
}

class _AppliedJobScreenState extends State<AppliedJobScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    AppStrings.appliedJob,
                    style: TextStyle(
                      fontSize: AppDimensions.kFontSize26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  const Icon(
                    Icons.mode_edit_outline_rounded,
                    size: 30,
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "You applied for 3 jobs",
                style: TextStyle(
                    fontSize: AppDimensions.kFontSize16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.fontColorLightBrown),
              ),
              SizedBox(
                height: 14.h,
              ),
              Expanded(
                child: Column(
                  children: jobs.map(
                    (item) {
                      return item.applied!
                          ? JobCard(
                              job: item,
                            )
                          : const SizedBox.shrink();
                    },
                  ).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
