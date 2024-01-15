import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../utils/app_dimensions.dart';

class LoginPasswordField extends StatefulWidget {
  final TextEditingController? controller;
  final Widget? icon;
  final String? hint;
  final Function(String)? onTextChanged;
  final TextInputType? inputType;
  final bool? isEnable;
  final bool? isRequired;
  final int? maxLength;
  final String? guideTitle;
  final bool? shouldRedirectToNextField;
  final int? maxLines;
  final FocusNode? focusNode;
  final Function(String)? onSubmit;
  final TextInputFormatter? textInputFormatter;
  final String? Function(String?)? validator;

  LoginPasswordField({
    this.controller,
    this.icon,
    this.hint,
    this.guideTitle,
    this.maxLength = 128,
    this.maxLines = 1,
    this.onTextChanged,
    this.inputType,
    this.focusNode,
    this.onSubmit,
    this.isEnable = true,
    this.shouldRedirectToNextField = true,
    this.isRequired = false,
    this.textInputFormatter,
    this.validator,
  });

  @override
  State<LoginPasswordField> createState() => _LoginPasswordFieldState();
}

class _LoginPasswordFieldState extends State<LoginPasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 8.h, right: 12.w),
          child: Row(
            children: [
              Text(
                (widget.guideTitle ?? ''),
                style: TextStyle(
                  fontSize: AppDimensions.kFontSize14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.fontColorDark1,
                ),
              ),
              SizedBox(width: 3.w),
              Text(
                (widget.isRequired! ? '*' : ''),
                style: TextStyle(
                  fontSize: AppDimensions.kFontSize14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.fontColorDark1,
                ),
              ),
            ],
          ),
        ),
        TextFormField(
          onChanged: (text) {
            if (widget.onTextChanged != null) {
              widget.onTextChanged!(text);
            }
          },
          onFieldSubmitted: (value) {
            if (widget.onSubmit != null) widget.onSubmit!(value);
          },
          focusNode: widget.focusNode,
          controller: widget.controller,
          obscureText: obscureText,
          textInputAction: widget.shouldRedirectToNextField!
              ? TextInputAction.next
              : TextInputAction.done,
          enabled: widget.isEnable,
          maxLines: widget.maxLines,
          validator: widget.validator,
          textCapitalization: TextCapitalization.none,
          maxLength: widget.maxLength,
          inputFormatters: [
            if (widget.textInputFormatter != null) widget.textInputFormatter!,
          ],
          style: TextStyle(
            fontSize: AppDimensions.kFontSize14,
            fontWeight: FontWeight.w500,
            color: AppColors.fontColorDark1,
          ),
          keyboardType: widget.inputType ?? TextInputType.text,
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.only(left: 12.w, top: 15.5.h, bottom: 15.5.h),
              isDense: true,
              counterText: "",
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.r),
                ),
                borderSide: BorderSide(
                  color: AppColors.disabledBorderColor,
                  width: 1.5.w,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.r),
                ),
                borderSide: BorderSide(
                  color: AppColors.unSelectedColor,
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
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.r),
                ),
                borderSide: BorderSide(
                  color: AppColors.focusedBorderColor,
                  width: 1.5.w,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.r),
                ),
                borderSide: BorderSide(
                  color: AppColors.errorBorderColor,
                  width: 1.5.w,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.r),
                ),
                borderSide: BorderSide(
                  color: AppColors.errorBorderColor,
                  width: 1.5.w,
                ),
              ),
              errorMaxLines: 2,
              errorStyle: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: AppDimensions.kFontSize12,
                fontWeight: FontWeight.w400,
                color: AppColors.errorBorderColor,
              ),
              prefixIcon: widget.icon,
              prefixIconConstraints: BoxConstraints(minWidth: 55.w),
              suffixIconConstraints: BoxConstraints(maxHeight: 48.h),
              suffixIcon: InkResponse(
                onTap: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                child: Container(
                  height: 48.h,
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Icon(
                    !obscureText
                        ? CupertinoIcons.eye
                        : CupertinoIcons.eye_slash,
                    color: !obscureText
                        ? AppColors.eyeColorDark
                        : AppColors.unSelectedColor,
                    size: 24.h,
                  ),
                ),
              ),
              filled: true,
              hintText: widget.hint,
              hintStyle: TextStyle(
                  color: AppColors.hintTextColor,
                  fontSize: AppDimensions.kFontSize14,
                  fontWeight: FontWeight.w400),
              fillColor: Colors.white),
        ),
      ],
    );
  }
}
