import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technical_assesment/utils/app_strings.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_dimensions.dart';

class BottomNavBar extends StatefulWidget {
  int selectedTab;
  final Function(int) callback;

  BottomNavBar({required this.callback, required this.selectedTab});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 82.h,
      decoration: BoxDecoration(
        color: AppColors.colorBackground,
        border: Border(
            top: BorderSide(
          color: AppColors.fontColorLightBrown,
          width: .5.h,
        )),
        boxShadow: [
          BoxShadow(
            color: AppColors.colorPrimary.withOpacity(0.25),
            blurRadius: 0,
            spreadRadius: 0,
            offset: const Offset(0, 0.5),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    widget.callback(1);
                    setState(() {
                      widget.selectedTab = 1;
                    });
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.list_alt_outlined,
                        size: 32.h,
                        color: widget.selectedTab == 1 ? AppColors.colorPrimary : AppColors.fontColorLightBrown,
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        AppStrings.jobListening,
                        style: TextStyle(
                          fontSize: AppDimensions.kFontSize12,
                          fontWeight: FontWeight.w600,
                          color: widget.selectedTab == 1 ? AppColors.colorPrimary : AppColors.fontColorLightBrown,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    widget.callback(2);
                    setState(() {
                      widget.selectedTab = 2;
                    });
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.edit,
                        size: 32.h,
                        color: widget.selectedTab == 2 ? AppColors.colorPrimary : AppColors.fontColorLightBrown,
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        AppStrings.appliedJobs,
                        style: TextStyle(
                          fontSize: AppDimensions.kFontSize12,
                          fontWeight: FontWeight.w600,
                          color: widget.selectedTab == 2 ? AppColors.colorPrimary : AppColors.fontColorLightBrown,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    widget.callback(3);
                    setState(() {
                      widget.selectedTab = 3;
                    });
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.person,
                        size: 32.h,
                        color: widget.selectedTab == 3 ? AppColors.colorPrimary : AppColors.fontColorLightBrown,
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        AppStrings.profile,
                        style: TextStyle(
                          fontSize: AppDimensions.kFontSize12,
                          fontWeight: FontWeight.w600,
                          color: widget.selectedTab == 3 ? AppColors.colorPrimary : AppColors.fontColorLightBrown,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
