import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:technical_assesment/features/presentation/views/widgets/app_button.dart';
import 'package:technical_assesment/features/presentation/views/widgets/app_text_field.dart';
import 'package:technical_assesment/features/presentation/views/widgets/custom_progress_bar.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimensions.dart';
import '../../../../utils/app_strings.dart';
import '../../../../utils/enums.dart';
import '../../../../utils/navigation_routes.dart';
import '../dashboard_view/job_listing_view/recent_jobs_bean.dart';
import '../widgets/appbar.dart';

class EmploymentInformationScreen extends StatefulWidget {
  final RecentJobsBean? job;

  const EmploymentInformationScreen({this.job, Key? key}) : super(key: key);

  @override
  State<EmploymentInformationScreen> createState() => _EmploymentInformationScreenState();
}

class _EmploymentInformationScreenState extends State<EmploymentInformationScreen> {
  List<String> skills = [];
  bool eduIncludedInResume = false;
  bool workXpIncludedInResume = false;

  TextEditingController skillController = TextEditingController();

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomProgressBar(
              companyHeader: "${AppStrings.applyTo} ${widget.job!.companyName}",
              progressBarDesc: AppStrings.employmentInfo,
              currentStep: 2,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    Text(
                      AppStrings.education,
                      style: TextStyle(
                        color: AppColors.fontColorDarkBrown,
                        fontSize: AppDimensions.kFontSize20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppStrings.includedInResume,
                          style: TextStyle(
                            color: AppColors.fontColorDark,
                            fontSize: AppDimensions.kFontSize14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        FlutterSwitch(
                          width: 55.w,
                          height: 35.h,
                          value: eduIncludedInResume,
                          borderRadius: 40.0,
                          padding: 2.0,
                          activeSwitchBorder: Border.all(
                            color: AppColors.colorBlack,
                          ),
                          inactiveSwitchBorder: Border.all(
                            color: AppColors.unSelectedColor,
                          ),
                          activeColor: AppColors.fontColorWhite,
                          activeToggleColor: AppColors.fontColorDarkBrown,
                          inactiveColor: AppColors.fontColorWhite,
                          inactiveToggleColor: AppColors.unSelectedColor,
                          onToggle: (val) {
                            setState(() {
                              eduIncludedInResume = val;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    AppTextField(
                      guideTitle: AppStrings.schoolName,
                      maxLines: 1,
                      maxLength: 100,
                      onTextChanged: (value) {
                        setState(() {});
                      },
                    ),
                    SizedBox(height: 20.h),
                    AppTextField(
                      guideTitle: AppStrings.courseOfStudy,
                      maxLines: 1,
                      maxLength: 100,
                      onTextChanged: (value) {
                        setState(() {});
                      },
                    ),
                    SizedBox(height: 20.h),
                    AppTextField(
                      guideTitle: AppStrings.graduationDate,
                      maxLines: 1,
                      maxLength: 100,
                      onTextChanged: (value) {
                        setState(() {});
                      },
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      AppStrings.workExp,
                      style: TextStyle(
                        color: AppColors.fontColorDarkBrown,
                        fontSize: AppDimensions.kFontSize20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppStrings.includedInResume,
                          style: TextStyle(
                            color: AppColors.fontColorDark,
                            fontSize: AppDimensions.kFontSize14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        FlutterSwitch(
                          width: 55.w,
                          height: 35.h,
                          value: workXpIncludedInResume,
                          borderRadius: 40.0,
                          padding: 2.0,
                          activeSwitchBorder: Border.all(
                            color: AppColors.colorBlack,
                          ),
                          inactiveSwitchBorder: Border.all(
                            color: AppColors.unSelectedColor,
                          ),
                          activeColor: AppColors.fontColorWhite,
                          activeToggleColor: AppColors.fontColorDarkBrown,
                          inactiveColor: AppColors.fontColorWhite,
                          inactiveToggleColor: AppColors.unSelectedColor,
                          onToggle: (val) {
                            setState(() {
                              workXpIncludedInResume = val;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      AppStrings.additionalSkills,
                      style: TextStyle(
                        color: AppColors.fontColorDarkBrown,
                        fontSize: AppDimensions.kFontSize20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    TextField(
                      controller: skillController,
                      onSubmitted: (value) {
                        setState(() {
                          skills.add(value);
                        });
                        skillController.clear();
                      },
                      textInputAction: TextInputAction.done,
                      textCapitalization: TextCapitalization.sentences,
                      style: TextStyle(
                        fontSize: AppDimensions.kFontSize14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.fontColorDark1,
                      ),
                      maxLines: null,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 12.w, top: 15.5.h, bottom: 15.5.h),
                          isDense: true,
                          counterText: "",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.r),
                            ),
                            borderSide: BorderSide(
                              color: AppColors.fontColorDark,
                              width: 1.5.w,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.r),
                            ),
                            borderSide: BorderSide(
                              color: AppColors.unSelectedColor,
                              width: 1.5.w,
                            ),
                          ),
                          prefixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 12.w),
                                child: const Icon(
                                  Icons.search,
                                  color: AppColors.unSelectedColor,
                                  size: 30,
                                ),
                              ),
                              Flexible(
                                child: Wrap(
                                  children: skills.map((skill) {
                                    return SkillChip(
                                      onTapCross: () {
                                        setState(() {
                                          skills.removeWhere((element) => element == skill);
                                        });
                                      },
                                      title: skill,
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                          prefixIconConstraints: BoxConstraints(minWidth: 55.w),
                          filled: true,
                          hintStyle: TextStyle(
                            color: AppColors.hintTextColor,
                            fontSize: AppDimensions.kFontSize14,
                            fontWeight: FontWeight.w400,
                          ),
                          fillColor: Colors.white),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
            SafeArea(
              child: AppButton(
                buttonText: AppStrings.proceedButtonText,
                fontSize: AppDimensions.kFontSize16,
                fontWeight: FontWeight.bold,
                onTapButton: () => Navigator.pushNamed(
                  context,
                  Routes.kReviewInformationScreen,
                  arguments: widget.job,
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}

class SkillChip extends StatelessWidget {
  final VoidCallback onTapCross;
  final String title;

  const SkillChip({
    super.key,
    required this.onTapCross,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.w,
      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
      decoration: BoxDecoration(
        color: AppColors.colorPrimary,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: onTapCross,
            child: const Icon(
              Icons.close,
              color: AppColors.colorWhite,
              size: 20,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: AppDimensions.kFontSize18,
                fontWeight: FontWeight.w500,
                color: AppColors.colorWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
