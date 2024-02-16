import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/images/app_images.dart';
import '../../../utils/styles/app_text_style.dart';

class ResultTime extends StatelessWidget {
  const ResultTime(
      {super.key,
      required this.color,
      required this.iconPath,
      required this.title,
      required this.subtitle});

  final Color color;
  final String iconPath;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          SvgPicture.asset(
            iconPath,
            height: 30.h,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            title,
            style: AppTextStyle.poppinsSemiBold,
          ),
          Text(
            subtitle,
            style: AppTextStyle.poppinsMedium.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
