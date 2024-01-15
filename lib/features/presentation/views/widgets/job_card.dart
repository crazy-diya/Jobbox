import 'package:flutter/material.dart';
import 'package:technical_assesment/features/presentation/views/dashboard_view/job_listing_view/recent_jobs_bean.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimensions.dart';

class JobCard extends StatelessWidget {
  final RecentJobsBean? job;

  const JobCard({this.job, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
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
                  job!.companyName!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppDimensions.kFontSize16,
                    color: AppColors.colorPrimary,
                  ),
                ),
                Text(
                  job!.date!,
                  style: TextStyle(
                    color: AppColors.fontColorLightBrown,
                    fontSize: AppDimensions.kFontSize14,
                  ),
                ),
              ],
            ),
            Text(
              job!.designation!,
              style: TextStyle(fontSize: AppDimensions.kFontSize20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(
                  Icons.ac_unit,
                  color: AppColors.fontColorLightBrown,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  job!.amount!,
                  style: TextStyle(
                    color: AppColors.fontColorLightBrown,
                    fontSize: AppDimensions.kFontSize14,
                  ),
                ),
                const SizedBox(width: 40),
                Text(
                  job!.location!,
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
    );
  }
}
