import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technical_assesment/core/services/app_permission.dart';
import 'package:technical_assesment/features/presentation/views/widgets/app_button.dart';
import 'package:technical_assesment/features/presentation/views/widgets/appbar.dart';
import 'package:technical_assesment/utils/app_strings.dart';
import 'package:technical_assesment/utils/enums.dart';
import 'package:technical_assesment/utils/navigation_routes.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimensions.dart';
import '../dashboard_view/job_listing_view/recent_jobs_bean.dart';
import '../widgets/custom_progress_bar.dart';

class UploadDocumentScreen extends StatefulWidget {
  final RecentJobsBean? job;

  const UploadDocumentScreen({this.job, Key? key}) : super(key: key);

  @override
  State<UploadDocumentScreen> createState() => _UploadDocumentScreenState();
}

class _UploadDocumentScreenState extends State<UploadDocumentScreen> {
  String? resumePdfName;

  String? coverLetterPdfName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JobBoxAppBar(
        goBackEnabled: true,
        onBackPressed: () {
          Navigator.pop(context);
        },
        backButtonType: BackButtonType.CROSS,
        size: 32,
        paddingLeft: 12,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomProgressBar(
              companyHeader: "${AppStrings.applyTo} ${widget.job!.companyName}",
              progressBarDesc: AppStrings.uploadingOfDoc,
              currentStep: 1,
            ),
            SizedBox(
              height: 18.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppStrings.resume,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppDimensions.kFontSize24,
                    color: AppColors.fontColorDarkBrown,
                  ),
                ),
                InkWell(
                  onTap: () {
                    pickPDF(true);
                  },
                  child: const Icon(
                    Icons.add,
                    size: 32,
                    color: AppColors.fontColorDarkBrown,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              AppStrings.resumeDesc,
              style: TextStyle(
                color: AppColors.fontColorLightBrown,
                fontSize: AppDimensions.kFontSize14,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: AppColors.colorPrimary,
                borderRadius: BorderRadius.circular(9.r),
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.file_present_rounded,
                  color: AppColors.colorWhite,
                  size: 36,
                ),
                title: Text(
                  resumePdfName ?? "My Resume.pdf",
                  style: TextStyle(
                    color: AppColors.colorWhite,
                    fontSize: AppDimensions.kFontSize18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "11/06/20",
                  style: TextStyle(
                    color: AppColors.colorWhite,
                    fontSize: AppDimensions.kFontSize14,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 18.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppStrings.coverLetter,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppDimensions.kFontSize24,
                    color: AppColors.fontColorDarkBrown,
                  ),
                ),
                InkWell(
                  onTap: () {
                    pickPDF(false);
                  },
                  child: const Icon(
                    Icons.add,
                    size: 32,
                    color: AppColors.fontColorDarkBrown,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              AppStrings.coverLetterDesc,
              style: TextStyle(
                color: AppColors.fontColorLightBrown,
                fontSize: AppDimensions.kFontSize14,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: AppColors.colorPrimary,
                borderRadius: BorderRadius.circular(9.r),
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.file_present_rounded,
                  color: AppColors.colorWhite,
                  size: 36,
                ),
                title: Text(
                  coverLetterPdfName ?? "My Cover letter final.pdf",
                  style: TextStyle(
                    color: AppColors.colorWhite,
                    fontSize: AppDimensions.kFontSize18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "11/06/20",
                  style: TextStyle(
                    color: AppColors.colorWhite,
                    fontSize: AppDimensions.kFontSize14,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: AppColors.colorSecondaryLight,
                borderRadius: BorderRadius.circular(9.r),
                border: Border.all(color: AppColors.colorPrimary),
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.file_present_rounded,
                  color: AppColors.colorPrimary,
                  size: 36,
                ),
                title: Text(
                  "My Cover letter final.pdf",
                  style: TextStyle(
                      color: AppColors.colorPrimary, fontSize: AppDimensions.kFontSize18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "11/06/20",
                  style: TextStyle(
                    color: AppColors.colorPrimary,
                    fontSize: AppDimensions.kFontSize14,
                  ),
                ),
              ),
            ),
            const Spacer(),
            SafeArea(
              child: AppButton(
                buttonText: AppStrings.proceedButtonText,
                fontSize: AppDimensions.kFontSize16,
                fontWeight: FontWeight.bold,
                onTapButton: () => Navigator.pushNamed(
                  context,
                  Routes.kEmploymentInformationScreen,
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

  Future<void> pickPDF(bool isResume) async {
    AppPermissionManager.requestExternalStoragePermission(context, () async {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        PlatformFile file = result.files.first;

        if (isResume) {
          setState(() {
            resumePdfName = file.name;
          });
        } else {
          setState(() {
            coverLetterPdfName = file.name;
          });
        }
      }
    });
  }
}
