import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/enums.dart';
import '../../../../utils/app_dimensions.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final Widget? icon;
  final Widget? action;
  final String? hint;
  final String? helpText;
  final Function(String)? onTextChanged;
  final String? Function(String?)? validator;
  final TextInputType? inputType;
  final bool? isEnable;
  final bool? isRequired;
  final int? maxLength;
  final String? guideTitle;
  final bool? obscureText;
  final bool? shouldRedirectToNextField;
  final String? initialValue;
  final int? maxLines;
  final FocusNode? focusNode;
  final FilterType? filterType;
  final Function(String)? onSubmit;
  final TextInputFormatter? textInputFormatter;

  AppTextField({
    this.controller,
    this.icon,
    this.action,
    this.hint,
    this.helpText,
    this.guideTitle,
    this.isRequired = false,
    this.maxLength = 100,
    this.maxLines = 1,
    this.onTextChanged,
    this.inputType,
    this.focusNode,
    this.validator,
    this.onSubmit,
    this.initialValue,
    this.filterType,
    this.isEnable = true,
    this.obscureText = false,
    this.shouldRedirectToNextField = true,
    this.textInputFormatter,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  int totalCount = 0;
  TextEditingController? _controller;

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      if (widget.initialValue != null) {
        widget.controller!.text = widget.initialValue!;
      }
      _controller = widget.controller;
    } else {
      if (widget.initialValue != null) {
        _controller = TextEditingController(text: widget.initialValue);
      } else {
        _controller = TextEditingController();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 8.h, right: 12.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
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
            ],
          ),
        ),
        TextFormField(
          onChanged: (text) {
            if (widget.onTextChanged != null) {
              widget.onTextChanged!(text);
            }
          },
          validator: widget.validator,
          onFieldSubmitted: (value) {
            if (widget.onSubmit != null) widget.onSubmit!(value);
          },
          focusNode: widget.focusNode,
          controller: _controller,
          obscureText: widget.obscureText!,
          textInputAction: widget.shouldRedirectToNextField!
              ? TextInputAction.next
              : TextInputAction.done,
          enabled: widget.isEnable,
          maxLines: widget.maxLines,
          textCapitalization: TextCapitalization.sentences,
          maxLength: widget.maxLength,
          inputFormatters: [
            if (widget.textInputFormatter != null) widget.textInputFormatter!,
            if (widget.filterType == FilterType.TYPE1)
              FilteringTextInputFormatter.allow(
                RegExp(r'^[0-9,.]*$'), // Allow digits, dots, and commas.
              ),
            if (widget.filterType == FilterType.TYPE2)
              FilteringTextInputFormatter.allow(
                RegExp(
                    r'[a-zA-Z\s]'), // Allow only, a to z, A to Z or a whitespace.
              ),
            if (widget.filterType == FilterType.TYPE3)
              FilteringTextInputFormatter.allow(
                RegExp(
                    r'[a-zA-Z0-9\s]'), // Allow only, a to z, A to Z or a whitespace and digits.
              ),
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
              suffixIcon: widget.action,
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
