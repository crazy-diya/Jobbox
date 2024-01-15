import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimensions.dart';
import '../../../../utils/enums.dart';

class JobBoxAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final bool? goBackEnabled;
  final bool? centerTitle;
  final VoidCallback? onBackPressed;
  final BackButtonType backButtonType;
  final double? size;
  final double? paddingLeft;

  JobBoxAppBar({
    this.title,
    this.actions,
    this.goBackEnabled = true,
    this.centerTitle = true,
    this.onBackPressed,
    this.backButtonType = BackButtonType.ARROW,
    this.size = 24,
    this.paddingLeft = 25,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super();

  @override
  final Size preferredSize;

  @override
  State<JobBoxAppBar> createState() => _JobBoxAppBarState();
}

class _JobBoxAppBarState extends State<JobBoxAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: widget.title != null
          ? Text(
              widget.title!,
              style: TextStyle(
                color: AppColors.fontColorBlack,
                fontWeight: FontWeight.w700,
                fontSize: AppDimensions.kFontSize18,
              ),
            )
          : const SizedBox.shrink(),
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: widget.actions,
      centerTitle: widget.centerTitle,
      leadingWidth: 35.w,
      leading: widget.goBackEnabled!
          ? InkWell(
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                if (widget.onBackPressed != null) {
                  widget.onBackPressed!();
                } else {
                  Navigator.pop(context);
                }
              },
              child: Padding(
                padding: EdgeInsets.only(left: widget.paddingLeft!.h),
                child: Icon(
                  widget.backButtonType == BackButtonType.ARROW
                      ? Icons.arrow_back_ios
                      : Icons.close,
                  color: AppColors.fontColorDarkBrown,
                  size: widget.size,
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
