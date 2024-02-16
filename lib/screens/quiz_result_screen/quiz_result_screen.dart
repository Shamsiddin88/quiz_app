import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/models/subject_model.dart';
import 'package:quiz_app/screens/quiz_result_screen/widgets/result_items.dart';
import 'package:quiz_app/screens/quiz_result_screen/widgets/result_time.dart';
import 'package:quiz_app/screens/widgets/global_appbar.dart';
import 'package:quiz_app/utils/colors/app_colors.dart';
import 'package:quiz_app/utils/images/app_images.dart';
import 'package:quiz_app/utils/styles/app_text_style.dart';
import 'package:flutter_svg/svg.dart';

class QuizResultScreen extends StatefulWidget {
  const QuizResultScreen({super.key, required this.subjectModel, required this.selections});
  final SubjectModel subjectModel;
  final Map selections;

  @override
  State<QuizResultScreen> createState() => _QuizResultScreenState();
}

class _QuizResultScreenState extends State<QuizResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50.h,
          ),
          GlobalAppbar(title: "Test natijasi"),
          SizedBox(
            height: 22.h,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: AppColors.c_162023,
                border: Border.all(color: AppColors.c_2F3739, width: 1.w),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    spreadRadius: 0,
                    blurRadius: 12.r,
                    offset: Offset(0, 5), // changes position of shadow
                  ),
                ]),
            child: Text(
              "Maths/Real Numbers",
              style: AppTextStyle.poppinsRegular.copyWith(
                  fontSize: 13, color: AppColors.c_F2F2F2.withOpacity(.5)),
            ),
          ),
          SizedBox(
            height: 19.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: AppColors.c_162023,
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
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: "Tabriklaymiz! Siz bu testni ",
                      style: AppTextStyle.poppinsBold),
                  TextSpan(
                      text: "80% ",
                      style: AppTextStyle.poppinsBold
                          .copyWith(color: AppColors.c_6FCF97)),
                  TextSpan(text: "bilan ", style: AppTextStyle.poppinsBold),
                  TextSpan(
                      text: "tugatdingiz",
                      style: AppTextStyle.poppinsBold
                          .copyWith(color: AppColors.c_F2954D)),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 19.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ResultItem(
                  title: "4",
                  subTitle: "To'g'ri javoblar",
                  color: AppColors.c_27AE60),
              ResultItem(
                  title: "5",
                  subTitle: "Xato javoblar",
                  color: AppColors.c_EB5757)
            ],
          ),
          SizedBox(
            height: 19.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ResultTime(
                  color: AppColors.c_F2954D,
                  iconPath: AppImages.timer,
                  title: "12m 20sec",
                  subtitle: "Jami vaqt"),
              ResultTime(
                  color: AppColors.c_0E81B4,
                  iconPath: AppImages.clock,
                  title: "2m 28sec",
                  subtitle: "Sarflangan vaqt"),
            ],
          ),
          SizedBox(
            height: 19.h,
          ),
          Material(
            color: AppColors.transparent,
            child: Ink(
              decoration: BoxDecoration(
                  color: AppColors.c_F2954D,
                  borderRadius: BorderRadius.circular(16.r)),
              child: InkWell(
                borderRadius: BorderRadius.circular(16.r),
                onTap: () {},
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 55.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(AppImages.refresh),
                          Text("Qayta urinib ko'rish",
                              style: AppTextStyle.poppinsSemiBold),
                        ],
                      )),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
