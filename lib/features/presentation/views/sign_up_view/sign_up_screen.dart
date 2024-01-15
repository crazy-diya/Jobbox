import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:technical_assesment/utils/app_strings.dart';

import '../../../../core/services/app_permission.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimensions.dart';
import '../../../../utils/enums.dart';
import '../../../../utils/navigation_routes.dart';
import '../../../../utils/validator.dart';
import '../widgets/app_button.dart';
import '../widgets/app_password_field.dart';
import '../widgets/app_text_field.dart';
import '../widgets/appbar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  XFile? imgFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JobBoxAppBar(
        title: AppStrings.signUp,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 33.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(height: 30.h),
                          InkWell(
                            child: Container(
                              width: 100.h,
                              height: 100.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.fontColorBlack,
                                ),
                              ),
                              child: CircleAvatar(
                                backgroundColor: AppColors.fontColorWhite,
                                child: imgFile == null
                                    ? Center(
                                        child: Text(
                                          AppStrings.addPhoto,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: AppColors.fontColorBlack,
                                            fontSize: AppDimensions.kFontSize16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(50.r),
                                        child: Image.file(
                                          File(
                                            imgFile!.path,
                                          ),
                                          fit: BoxFit.fill,
                                          width: 100.h,
                                          height: 100.h,
                                        ),
                                      ),
                              ),
                            ),
                            onTap: () {
                              _captureImage();
                            },
                          ),
                          SizedBox(height: 30.h),
                          AppTextField(
                            guideTitle: AppStrings.email,
                            hint: AppStrings.emailHint,
                            controller: _emailController,
                            inputType: TextInputType.emailAddress,
                            maxLines: 1,
                            maxLength: 100,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppStrings.emailValidateEmpty;
                              } else if (!Validator.validateEmail(value)) {
                                return AppStrings.emailInvalid;
                              }
                              return null;
                            },
                            onTextChanged: (value) {
                              setState(() {});
                            },
                          ),
                          SizedBox(height: 24.h),
                          LoginPasswordField(
                            guideTitle: AppStrings.newPassword,
                            hint: AppStrings.passwordHint,
                            controller: _passwordController,
                            maxLines: 1,
                            maxLength: 128,
                            validator: (value) {
                              if (_passwordController.text.length < 6) {
                                return AppStrings.passwordChar;
                              } else if (_passwordController.text != _confirmController.text) {
                                return AppStrings.passwordMatch;
                              }
                              return null;
                            },
                            onTextChanged: (value) {
                              setState(() {});
                            },
                          ),
                          SizedBox(height: 24.h),
                          LoginPasswordField(
                            guideTitle: AppStrings.reTypePassword,
                            hint: AppStrings.passwordHint,
                            controller: _confirmController,
                            maxLines: 1,
                            maxLength: 128,
                            validator: (value) {
                              if (_confirmController.text.length < 6) {
                                return AppStrings.passwordChar;
                              } else if (_confirmController.text != _confirmController.text) {
                                return AppStrings.passwordMatch;
                              }
                              return null;
                            },
                            onTextChanged: (value) {
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40.h),
                    AppButton(
                      buttonText: AppStrings.createAccount,
                      buttonType: (_emailController.text.isEmpty ||
                              _passwordController.text.isEmpty ||
                              _confirmController.text.isEmpty)
                          ? ButtonType.DISABLED
                          : ButtonType.ENABLED,
                      onTapButton: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.alreadyHaveAnAccount,
                          style: TextStyle(
                            color: AppColors.fontColorDark1,
                            fontSize: AppDimensions.kFontSize14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(context, Routes.kSignInView, (route) => false);
                          },
                          child: Text(
                            AppStrings.loginButton,
                            style: TextStyle(
                              color: AppColors.colorPrimary,
                              fontSize: AppDimensions.kFontSize14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SafeArea(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: AppStrings.signUpBottomLineOne,
                  style: TextStyle(
                    color: AppColors.fontColorBlack.withOpacity(.7),
                    fontSize: AppDimensions.kFontSize12,
                    fontWeight: FontWeight.w600,
                  ),
                  children: [
                    TextSpan(
                      text: AppStrings.termOfUse,
                      style: TextStyle(
                        color: AppColors.colorPrimary,
                        fontSize: AppDimensions.kFontSize12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: AppStrings.and,
                      style: TextStyle(
                        color: AppColors.fontColorBlack.withOpacity(.7),
                        fontSize: AppDimensions.kFontSize12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: AppStrings.privacyPolicy,
                      style: TextStyle(
                        color: AppColors.colorPrimary,
                        fontSize: AppDimensions.kFontSize12,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
            ),
            // SizedBox(height: 20.h),
          ],
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
