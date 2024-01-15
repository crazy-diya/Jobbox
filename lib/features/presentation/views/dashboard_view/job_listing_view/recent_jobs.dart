import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technical_assesment/features/presentation/views/dashboard_view/job_listing_view/recent_jobs_bean.dart';
import 'package:technical_assesment/utils/app_colors.dart';
import 'package:technical_assesment/utils/app_dimensions.dart';

import '../../../../../utils/app_constant.dart';
import 'custom_bottom_sheet.dart';

class RecentJobs extends StatelessWidget {
  const RecentJobs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      itemCount: jobs.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () => showCustomBottomSheet(context, jobs[index]),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          borderOnForeground: false,
          color: AppColors.colorWhite,
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      jobs[index].companyName!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppDimensions.kFontSize14,
                        color: AppColors.colorPrimary,
                      ),
                    ),
                    Text(
                      jobs[index].date!,
                      style: TextStyle(
                        color: AppColors.fontColorLightBrown,
                        fontSize: AppDimensions.kFontSize14,
                      ),
                    ),
                  ],
                ),
                Text(
                  jobs[index].designation!,
                  style: TextStyle(fontSize: AppDimensions.kFontSize20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    const Icon(
                      Icons.ac_unit,
                      color: AppColors.fontColorLightBrown,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      jobs[index].amount!,
                      style: TextStyle(
                        color: AppColors.fontColorLightBrown,
                        fontSize: AppDimensions.kFontSize14,
                      ),
                    ),
                    SizedBox(width: 35.w),
                    Text(
                      jobs[index].location!,
                      style: TextStyle(
                        color: AppColors.fontColorLightBrown,
                        fontSize: AppDimensions.kFontSize14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showCustomBottomSheet(context, RecentJobsBean job) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.r),
        ),
      ),
      builder: (context) => CustomBottomSheetContent(job: job),
    );
  }
}
