import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technical_assesment/features/presentation/views/dashboard_view/job_listing_view/recent_jobs_bean.dart';
import 'package:technical_assesment/features/presentation/views/widgets/app_button.dart';
import 'package:technical_assesment/utils/navigation_routes.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimensions.dart';
import '../../../../utils/app_images.dart';
import '../../../../utils/app_strings.dart';
import '../../../../utils/enums.dart';
import '../widgets/appbar.dart';
import '../widgets/custom_progress_bar.dart';

class ReviewInformationScreen extends StatefulWidget {
  final RecentJobsBean? job;

  const ReviewInformationScreen({Key? key, required this.job}) : super(key: key);

  @override
  State<ReviewInformationScreen> createState() => _ReviewInformationScreenState();
}

class _ReviewInformationScreenState extends State<ReviewInformationScreen> {
  List? skills = ["Flutter", "Dart", "Git"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JobBoxAppBar(
        goBackEnabled: true,
        onBackPressed: () {
          Navigator.pop(context);
        },
        backButtonType: BackButtonType.ARROW,
        size: 32,
        paddingLeft: 18,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            CustomProgressBar(
              companyHeader: "${AppStrings.applyTo} ${widget.job!.companyName}",
              progressBarDesc: AppStrings.reviewInformation,
              currentStep: 3,
            ),
            const SizedBox(
              height: 18,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppStrings.contactInfo,
                          style: TextStyle(
                              fontSize: AppDimensions.kFontSize24,
                              fontWeight: FontWeight.bold,
                              color: AppColors.fontColorDarkBrown),
                        ),
                        Icon(
                          Icons.edit,
                          size: 30.h,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 90.h,
                          height: 90.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            border: null,
                          ),
                          child: const CircleAvatar(
                            backgroundImage: AssetImage(AppImages.imgProfile),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      AppStrings.fullName,
                      style: TextStyle(
                          fontSize: AppDimensions.kFontSize18,
                          fontWeight: FontWeight.w500,
                          color: AppColors.fontColorLightBrown),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Adrien Severin",
                      style: TextStyle(
                        fontSize: AppDimensions.kFontSize18,
                        fontWeight: FontWeight.w900,
                        color: AppColors.fontColorDarkBrown,
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      AppStrings.email,
                      style: TextStyle(
                          fontSize: AppDimensions.kFontSize18,
                          fontWeight: FontWeight.w500,
                          color: AppColors.fontColorLightBrown),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Adrienseverin@gmail.com",
                      style: TextStyle(
                        fontSize: AppDimensions.kFontSize18,
                        fontWeight: FontWeight.w900,
                        color: AppColors.fontColorDarkBrown,
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      AppStrings.mobileNumber,
                      style: TextStyle(
                          fontSize: AppDimensions.kFontSize18,
                          fontWeight: FontWeight.w500,
                          color: AppColors.fontColorLightBrown),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "+65867453789",
                      style: TextStyle(
                        fontSize: AppDimensions.kFontSize18,
                        fontWeight: FontWeight.w900,
                        color: AppColors.fontColorDarkBrown,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Divider(
                      color: AppColors.fontColorLightBrown,
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppStrings.employmentInfo,
                          style: TextStyle(
                              fontSize: AppDimensions.kFontSize22,
                              fontWeight: FontWeight.bold,
                              color: AppColors.fontColorDarkBrown),
                        ),
                        Icon(
                          Icons.edit,
                          size: 30.h,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Text(
                      AppStrings.resume,
                      style: TextStyle(
                          fontSize: AppDimensions.kFontSize18,
                          fontWeight: FontWeight.w500,
                          color: AppColors.fontColorLightBrown),
                    ),
                    ListTile(
                      title: Text(
                        "My Resume.pdf",
                        style: TextStyle(
                            fontSize: AppDimensions.kFontSize18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.fontColorDarkBrown),
                      ),
                      subtitle: Text(
                        "11/06/20",
                        style: TextStyle(
                            fontSize: AppDimensions.kFontSize14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.fontColorDarkBrown),
                      ),
                      leading: const Icon(
                        Icons.note_add,
                        color: AppColors.fontColorDarkBrown,
                        size: 36,
                      ),
                      contentPadding: EdgeInsets.zero,
                    ),
                    Text(
                      AppStrings.coverLetter,
                      style: TextStyle(
                          fontSize: AppDimensions.kFontSize18,
                          fontWeight: FontWeight.w500,
                          color: AppColors.fontColorLightBrown),
                    ),
                    ListTile(
                      title: Text(
                        "My cover letter final.pdf",
                        style: TextStyle(
                            fontSize: AppDimensions.kFontSize18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.fontColorDarkBrown),
                      ),
                      subtitle: Text(
                        "11/06/20",
                        style: TextStyle(
                            fontSize: AppDimensions.kFontSize14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.fontColorDarkBrown),
                      ),
                      leading: const Icon(
                        Icons.note_add,
                        color: AppColors.fontColorDarkBrown,
                        size: 36,
                      ),
                      contentPadding: EdgeInsets.zero,
                    ),
                    Text(
                      AppStrings.additionalSkills,
                      style: TextStyle(
                          fontSize: AppDimensions.kFontSize18,
                          fontWeight: FontWeight.w500,
                          color: AppColors.fontColorLightBrown),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Wrap(
                      children: skills!.map((skill) {
                        return Container(
                          width: 100.w,
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: AppColors.fontColorDarkBrown)),
                          child: Center(
                            child: Text(
                              skill,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: AppDimensions.kFontSize18,
                                color: AppColors.fontColorDarkBrown,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                  ],
                ),
              ),
            ),
            AppButton(
              buttonText: AppStrings.submitButtonText,
              onTapButton: () => Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.kDashBoardView,
                (route) => false,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
          ],
        ),
      ),
    );
  }
}
