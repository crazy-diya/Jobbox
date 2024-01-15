import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technical_assesment/features/presentation/bloc/sign_in/sign_in_bloc.dart';
import 'package:technical_assesment/utils/navigation_routes.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimensions.dart';
import '../../../../utils/app_strings.dart';
import '../../../../utils/enums.dart';
import '../../../../utils/validator.dart';
import '../widgets/app_button.dart';
import '../widgets/app_password_field.dart';
import '../widgets/app_text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _bloc = SignInBloc();
  final _loginForm = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => _bloc,
        child: BlocListener<SignInBloc, SignInState>(
          bloc: _bloc,
          listener: (context, state) {
            if (state is SignInSuccessState) {
              Navigator.pushNamed(context, Routes.kDashBoardView);
            } else if (state is SignInFailState) {
            } else if (state is SignInLoadingState) {}
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.5.w),
            child: Column(
              children: [
                SizedBox(height: 100.h),
                Wrap(
                  children: [
                    Text(
                      AppStrings.splashWord[0],
                      style: TextStyle(
                        fontSize: AppDimensions.kFontSize32,
                        color: AppColors.colorPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      AppStrings.splashWord[1],
                      style: TextStyle(
                        fontSize: AppDimensions.kFontSize32,
                        color: AppColors.fontColorDarkBrown,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 80.h),
                Form(
                  key: _loginForm,
                  child: Column(
                    children: [
                      AppTextField(
                        guideTitle: AppStrings.email,
                        hint: AppStrings.emailHint,
                        controller: _emailController,
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
                      SizedBox(height: 20.h),
                      LoginPasswordField(
                        guideTitle: AppStrings.password,
                        hint: AppStrings.passwordHint,
                        controller: _passwordController,
                        maxLines: 1,
                        maxLength: 128,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppStrings.passwordEmpty;
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
                SizedBox(height: 25.h),
                InkWell(
                  onTap: () {},
                  child: Text(
                    AppStrings.forgotPassword,
                    style: TextStyle(
                      color: AppColors.fontColorDarkBrown,
                      fontSize: AppDimensions.kFontSize14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 50.h),
                AppButton(
                  buttonText: AppStrings.loginButton,
                  buttonType: (_passwordController.text.isEmpty || _emailController.text.isEmpty)
                      ? ButtonType.DISABLED
                      : ButtonType.ENABLED,
                  onTapButton: () {
                    if (_loginForm.currentState!.validate()) {
                      _bloc.add(
                        LoginEvent(
                          email: _emailController.text,
                          password: _passwordController.text,
                        ),
                      );
                    }
                  },
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.dontHaveAcc,
                      style: TextStyle(
                        color: AppColors.colorPrimary,
                        fontSize: AppDimensions.kFontSize14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.kSignUpScreen);
                      },
                      child: Text(
                        AppStrings.signUp,
                        style: TextStyle(
                          color: AppColors.colorPrimary,
                          fontSize: AppDimensions.kFontSize14,
                          fontWeight: FontWeight.w500,
                        ),
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
}
