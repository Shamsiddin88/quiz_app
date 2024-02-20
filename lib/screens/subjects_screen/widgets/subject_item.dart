import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/models/subject_model.dart';
import '../../../utils/styles/app_text_style.dart';

class SubjectItem extends StatelessWidget {
  const SubjectItem(
      {super.key,
      required this.onTap,
      required this.subjectModel});

  final VoidCallback onTap;
  final SubjectModel subjectModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 55.w, vertical: 12.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: subjectModel.color,
          ),
          child:
          Column(
            children: [
              Row(
                children: [
                  Text(subjectModel.subjectName, style: AppTextStyle.poppinsSemiBold),
                  const Spacer(),
                ],
              ),
              SizedBox(height: 30.h,),
              Row(
                children: [
                  Text(subjectModel.level.name, style: AppTextStyle.poppinsSemiBold),
                  const Spacer(),
                  Text(subjectModel.questions.length.toString(), style: AppTextStyle.poppinsSemiBold),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
