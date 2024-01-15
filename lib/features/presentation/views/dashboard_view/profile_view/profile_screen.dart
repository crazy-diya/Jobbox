import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:technical_assesment/utils/app_images.dart';

import '../../../../../core/services/app_permission.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_dimensions.dart';
import '../../../../../utils/app_strings.dart';
import '../../widgets/app_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  XFile? imgFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      AppStrings.yourProfile,
                      style: TextStyle(
                        fontSize: AppDimensions.kFontSize26,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Icon(
                      Icons.person,
                      size: 30.h,
                      color: AppColors.fontColorDarkBrown,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 120.h,
                          height: 120.h,
                          decoration: const BoxDecoration(shape: BoxShape.circle, border: null),
                          child: imgFile == null
                              ? const CircleAvatar(
                                  backgroundImage: AssetImage(AppImages.imgProfile),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(70.r),
                                  child: Image.file(
                                    File(
                                      imgFile!.path,
                                    ),
                                    fit: BoxFit.fill,
                                    width: 120.h,
                                    height: 120.h,
                                  ),
                                ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: InkWell(
                            child: Container(
                              width: 34.h,
                              height: 34.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.fontColorWhite,
                                  width: 2,
                                ),
                              ),
                              child: const CircleAvatar(
                                backgroundColor: AppColors.fontColorDarkBrown,
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    color: AppColors.colorWhite,
                                    size: 26,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              _captureImage();
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.contactInfo,
                      style: TextStyle(
                          fontSize: AppDimensions.kFontSize22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.fontColorDarkBrown),
                    ),
                    Icon(
                      Icons.edit,
                      size: 28.h,
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
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
                    fontSize: AppDimensions.kFontSize16,
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
                    fontSize: AppDimensions.kFontSize16,
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
                    fontSize: AppDimensions.kFontSize16,
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
                SizedBox(
                  height: 16.h,
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
                      size: 28.h,
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
                SizedBox(
                  height: 16.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _captureImage() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0.r),
          topRight: Radius.circular(20.0.r),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20.0),
          child: Wrap(
            spacing: 15.h,
            children: [
              AppButton(
                textColor: AppColors.fontColorDark,
                buttonText: AppStrings.camera,
                onTapButton: () {
                  AppPermissionManager.requestCameraPermission(context, () {
                    _saveImage();
                  });
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 15.h),
              AppButton(
                textColor: AppColors.fontColorDark,
                buttonText: AppStrings.upload,
                onTapButton: () {
                  AppPermissionManager.requestGalleryPermission(context, () {
                    _saveImage(isFromCamera: false);
                  });
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 15.h),
              AppButton(
                onTapButton: () {
                  Navigator.pop(context);
                },
                buttonText: AppStrings.cancel,
              ),
            ],
          ),
        );
      },
    );
  }

  ///SaveImage
  _saveImage({bool isFromCamera = true}) async {
    final XFile? file = await ImagePicker().pickImage(
        source: isFromCamera ? ImageSource.camera : ImageSource.gallery,
        imageQuality: 25,
        maxHeight: 480,
        maxWidth: 480);
    if (file != null) {
      setState(() {
        imgFile = file;
      });
    }
  }
}
