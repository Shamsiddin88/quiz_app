import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/styles/app_text_style.dart';

class ResultItem extends StatelessWidget {
  const ResultItem(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.color});

  final String title;
  final String subTitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return
      Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: color,
        border: Border.all(color: AppColors.c_2F3739, width: 1.w),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 12.r,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyle.poppinsSemiBold.copyWith(fontSize: 20),
          ),
          Text(
            subTitle,
            style: AppTextStyle.poppinsMedium.copyWith(fontSize: 13),
          ),
        ],
      ),
    );
  }
}
