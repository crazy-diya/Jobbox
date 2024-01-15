import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technical_assesment/features/presentation/views/dashboard_view/job_listing_view/recent_jobs_bean.dart';
import 'package:technical_assesment/features/presentation/views/widgets/app_button.dart';
import 'package:technical_assesment/utils/app_colors.dart';
import 'package:technical_assesment/utils/app_dimensions.dart';
import 'package:technical_assesment/utils/app_strings.dart';
import 'package:technical_assesment/utils/enums.dart';
import 'package:technical_assesment/utils/navigation_routes.dart';

class CustomBottomSheetContent extends StatelessWidget {
  final RecentJobsBean? job;

  const CustomBottomSheetContent({this.job, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.sw,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 35.h,
                      ),
                      Image.asset(
                        job!.logo!,
                        height: 90.h,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        job!.companyName!,
                        style: TextStyle(
                          fontSize: AppDimensions.kFontSize18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.colorPrimary,
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Text(
                        job!.designation!,
                        style: TextStyle(fontSize: AppDimensions.kFontSize24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Text(
                        job!.location!,
                        style: TextStyle(
                          fontSize: AppDimensions.kFontSize18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.fontColorLightBrown,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Text(
                            AppStrings.jobDescription,
                            style: TextStyle(
                              fontSize: AppDimensions.kFontSize20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.fontColorDarkBrown,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        softWrap: true,
                        job!.jobDescription!,
                        style: TextStyle(
                          fontSize: AppDimensions.kFontSize18,
                          color: AppColors.fontColorDarkBrown,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Text(
                            AppStrings.jobRequirements,
                            style: TextStyle(
                              fontSize: AppDimensions.kFontSize20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.fontColorDarkBrown,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Column(
                        children: job!.requirement!
                            .map((item) => Text(
                                  item,
                                  style: TextStyle(
                                    fontSize: AppDimensions.kFontSize18,
                                    color: AppColors.fontColorDarkBrown,
                                  ),
                                  textAlign: TextAlign.justify,
                                ))
                            .toList(),
                      ),
                      SizedBox(
                        height: 90.h,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 85.h,
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.white10,
                  offset: Offset(0, -90),
                  blurRadius: 2,
                ),
                BoxShadow(
                  color: Colors.white24,
                  offset: Offset(0, -70),
                  blurRadius: 2,
                ),
                BoxShadow(
                  color: Colors.white38,
                  offset: Offset(0, -50),
                  blurRadius: 5,
                ),
                BoxShadow(
                  color: Colors.white54,
                  offset: Offset(0, -35),
                  blurRadius: 5,
                ),
              ]),
              padding: EdgeInsets.only(bottom: 25.h),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Wrap(
                      children: [
                        AppButton(
                          buttonText: AppStrings.applyButton,
                          onTapButton: () {
                            Navigator.pushNamed(
                              context,
                              Routes.kUploadDocumentScreen,
                              arguments: job,
                            );
                          },
                          buttonColor: AppColors.colorPrimary,
                          buttonType: ButtonType.ENABLED,
                          fontSize: AppDimensions.kFontSize18,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 18.w,
                  ),
                  Expanded(
                    flex: 1,
                    child: Wrap(
                      children: [
                        AppButton(
                          buttonText: "",
                          onTapButton: () {},
                          buttonColor: AppColors.colorPrimaryLight,
                          prefixIcon: const Icon(
                            Icons.bookmark_outline,
                            color: AppColors.colorPrimary,
                            size: 26,
                          ),
                          buttonType: ButtonType.ENABLED,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 120.w,
                child: const Divider(
                  thickness: 5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
