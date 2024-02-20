import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/styles/app_text_style.dart';

class VariantItemView extends StatelessWidget {
  const VariantItemView(
      {super.key, required this.onTap, required this.isSelected, required this.variantText, required this.caption,});

  final VoidCallback onTap;
  final bool isSelected;
  final String variantText;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Material(
          color: AppColors.transparent,
          child: Ink(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.sp), color:isSelected? AppColors.c_F2954D:AppColors.c_273032,),

      child: InkWell(
        borderRadius: BorderRadius.circular(16.sp),
        onTap: onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.sp)),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 13.h),
          child: Row(
            children: [
              Text(
                caption, style: AppTextStyle.poppinsBold.copyWith(fontSize: 14.sp),),
              SizedBox(width: 12.w,),
              Expanded(
                child: Text(variantText,
                  style: AppTextStyle.poppinsMedium
                      .copyWith(fontSize: 14.sp),
                ),
              ),
            ],
          ),
        ),
      ))),
    )
    ;
  }
}
