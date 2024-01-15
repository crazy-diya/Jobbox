import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimensions.dart';
import '../../../../utils/enums.dart';

class AppButton extends StatefulWidget {
  final String buttonText;
  final Function onTapButton;
  final double width;
  final ButtonType buttonType;
  final Widget? prefixIcon;
  final FontWeight? fontWeight;
  final double? fontSize;

  final Color buttonColor;
  final Color textColor;

  AppButton(
      {required this.buttonText,
      required this.onTapButton,
      this.width = 0,
      this.prefixIcon,
      this.buttonColor = AppColors.colorPrimary,
      this.textColor = AppColors.fontColorWhite,
      this.buttonType = ButtonType.ENABLED,
      this.fontWeight,
      this.fontSize});

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  Color _buttonColor = AppColors.colorPrimary;

  @override
  void initState() {
    super.initState();
    setState(() {
      _buttonColor = AppColors.fontColorWhite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.h),
        width: widget.width == 0 ? double.infinity : widget.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          color: widget.buttonType == ButtonType.ENABLED ? widget.buttonColor : widget.buttonColor.withAlpha(150),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.prefixIcon ?? const SizedBox.shrink(),
              widget.prefixIcon != null ? SizedBox(width: 5.w) : const SizedBox.shrink(),
              Text(
                widget.buttonText,
                style: TextStyle(
                  color: widget.buttonType == ButtonType.ENABLED ? widget.textColor : widget.textColor.withAlpha(180),
                  fontWeight: widget.fontWeight ?? FontWeight.w700,
                  fontSize: widget.fontSize ?? AppDimensions.kFontSize14,
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        if (widget.buttonType == ButtonType.ENABLED) {
          widget.onTapButton();
        }
      },
    );
  }
}
