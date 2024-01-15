import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technical_assesment/features/presentation/views/dashboard_view/job_listing_view/recent_jobs.dart';
import 'package:technical_assesment/utils/app_colors.dart';
import 'package:technical_assesment/utils/app_dimensions.dart';
import 'package:technical_assesment/utils/app_strings.dart';

import 'near_you.dart';

class JobListingsScreen extends StatefulWidget {
  const JobListingsScreen({Key? key}) : super(key: key);

  @override
  State<JobListingsScreen> createState() => _JobListingsScreenState();
}

class _JobListingsScreenState extends State<JobListingsScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this, // For animation (usually in a StatefulWidget)
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              color: AppColors.colorPrimary,
              width: 100.sh,
              child: SafeArea(
                minimum: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Hi Mark ",
                          style: TextStyle(fontSize: AppDimensions.kFontSize16, fontWeight: FontWeight.w500),
                        ),
                        const Icon(
                          Icons.waving_hand,
                          color: AppColors.colorBackground,
                          size: 16,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      AppStrings.jobListingTitle,
                      style: TextStyle(
                          fontSize: AppDimensions.kFontSize24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.fontColorDarkBrown),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                      decoration: BoxDecoration(
                        color: AppColors.colorWhite.withOpacity(0.09),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            size: 32,
                            color: AppColors.fontColorDarkBrown.withOpacity(0.4),
                          ),
                          border: InputBorder.none,
                          hintText: AppStrings.jobListingSearchBarHint,
                          hintStyle: TextStyle(
                              color: AppColors.fontColorDarkBrown.withOpacity(0.4),
                              fontSize: AppDimensions.kFontSize20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
                  ],
                ),
              ),
            ),
             SizedBox(
              height: 10.h,
            ),
            TabBar(
              controller: _tabController,
              dividerHeight: 0,
              unselectedLabelStyle: TextStyle(
                  color: AppColors.fontColorLightBrown,
                  fontWeight: FontWeight.bold,
                  fontSize: AppDimensions.kFontSize20),
              labelStyle: TextStyle(
                color: AppColors.colorPrimary,
                fontWeight: FontWeight.bold,
                fontSize: AppDimensions.kFontSize20,
              ),
              indicatorColor: AppColors.colorPrimary,
              indicatorWeight: 5,
              tabs: [
                Tab(
                  text: AppStrings.jobListingTabNames[0],
                ),
                Tab(
                  text: AppStrings.jobListingTabNames[1],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  RecentJobs(),
                  NearYou(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
