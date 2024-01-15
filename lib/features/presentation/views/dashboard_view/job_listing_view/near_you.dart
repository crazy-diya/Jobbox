import 'package:flutter/material.dart';
import 'package:technical_assesment/features/presentation/views/dashboard_view/job_listing_view/recent_jobs_bean.dart';

import '../../../../../utils/app_constant.dart';
import '../../widgets/job_card.dart';
import 'custom_bottom_sheet.dart';

class NearYou extends StatelessWidget {
  const NearYou({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      itemCount: jobs.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () => showCustomBottomSheet(context, jobs[index]),
        child: JobCard(job: jobs[index]),
      ),
    );
  }

  void showCustomBottomSheet(context, RecentJobsBean job) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => CustomBottomSheetContent(job: job),
    );
  }
}
