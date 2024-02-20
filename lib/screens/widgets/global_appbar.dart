import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/images/app_images.dart';
import '../../utils/styles/app_text_style.dart';

class GlobalAppbar extends StatelessWidget {
  const GlobalAppbar(
      {super.key, required this.title, this.button = "", this.onTab});

  final String title;
  final String button;
  final VoidCallback? onTab;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r)),
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 48.h,
            width: 48.w,
            decoration: BoxDecoration(
                color: AppColors.c_162023,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(width: 1, color: AppColors.c_2F3739),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    spreadRadius: 0,
                    blurRadius: 12.r,
                    offset: const Offset(0, 5), // changes position of shadow
                  ),
                ]),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              child: SvgPicture.asset(
                AppImages.arrowBack,
                height: 24.h,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 16.w,
        ),
        Text(
          title,
          style: AppTextStyle.poppinsMedium.copyWith(fontSize: 20.sp),
        ),
        const Spacer(),
        onTab != null
            ? GestureDetector(
                onTap: onTab,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 13.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                          color: AppColors.c_F2954D,
                          width: 2), boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius: 0,
                      blurRadius: 12.r,
                      offset: const Offset(0, 5), // changes position of shadow
                    ),
                  ]),
                  child: Center(
                      child:
                          Text(button, style: AppTextStyle.poppinsSemiBold)),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
