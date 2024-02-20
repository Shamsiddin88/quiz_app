import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quiz_app/models/subject_model.dart';
import 'package:quiz_app/screens/quiz_result_screen/widgets/result_items.dart';
import 'package:quiz_app/screens/quiz_result_screen/widgets/result_time.dart';
import 'package:quiz_app/screens/widgets/global_appbar.dart';
import 'package:quiz_app/utils/colors/app_colors.dart';
import 'package:quiz_app/utils/images/app_images.dart';
import 'package:quiz_app/utils/styles/app_text_style.dart';
import 'package:flutter_svg/svg.dart';
import '../../data/answer_report.dart';
import '../../models/quiz_model.dart';
import '../quiz_page_screen/quiz_page_screen.dart';

class QuizResultScreen extends StatefulWidget {
  const QuizResultScreen({super.key,required this.answerReport});

  final AnswerReport answerReport;


  @override
  State<QuizResultScreen> createState() => _QuizResultScreenState();
}

class _QuizResultScreenState extends State<QuizResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50.h,
            ),
            const GlobalAppbar(title: "Test natijasi"),
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
                      offset: const Offset(0, 5), // changes position of shadow
                    ),
                  ]),
              child: Text(
                "${widget.answerReport.subjectModel.subjectName}/${widget.answerReport.subjectModel.level.name}",
                style: AppTextStyle.poppinsRegular.copyWith(
                    fontSize: 13.sp, color: AppColors.c_F2F2F2.withOpacity(.5)),
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
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularPercentIndicator(
                    radius: 60.r,
                    reverse: true,
                    lineWidth: 7.h,
                    circularStrokeCap: CircularStrokeCap.round,
                    backgroundColor: AppColors.c_F2954D.withOpacity(.2),
                    percent: widget.answerReport.trueAnswersCount/widget.answerReport.totalQuestionsCount,
                    center: Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: widget.answerReport.trueAnswersCount.toString(),
                                style: AppTextStyle.poppinsBold.copyWith(fontSize: 25.sp)),
                            TextSpan(
                               text: "/${widget.answerReport.totalQuestionsCount.toString()} \nnatijangiz",
                                style: AppTextStyle.poppinsRegular
                                    .copyWith(color: AppColors.c_F2F2F2.withOpacity(0.75), fontSize: 12.sp)),
                          ],
                        ),
                      ),
                    ),
                    progressColor: AppColors.c_F2954D,
                  ),
                  SizedBox(width: 20.w,),
                  Expanded(
                    child:
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "Siz bu testni \n",
                              style: AppTextStyle.poppinsBold),
                          TextSpan(
                              text: "${((widget.answerReport.trueAnswersCount/widget.answerReport.subjectModel.questions.length)*100).toInt()} %",
                              style: AppTextStyle.poppinsBold
                                  .copyWith(color: AppColors.c_6FCF97)),
                          TextSpan(text: " natija bilan ", style: AppTextStyle.poppinsBold),
                          TextSpan(
                              text: "tugatdingiz",
                              style: AppTextStyle.poppinsBold
                                  .copyWith(color: AppColors.c_F2954D)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 19.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ResultItem(
                    title: widget.answerReport.trueAnswersCount.toString(),
                    subTitle: "To'g'ri javoblar",
                    color: AppColors.c_27AE60),
                ResultItem(
                    title: widget.answerReport.trueAnswersCount.toString(),
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
                    title: getMinutelyText(widget.answerReport.spentTime),
                    subtitle: "Jami vaqt"),
                ResultTime(
                    color: AppColors.c_0E81B4,
                    iconPath: AppImages.clock,
                    title: getMinutelyText(
                        widget.answerReport.averageTimeForEachAnswer),
                    subtitle: "O'rtacha vaqt"),
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
                  onTap: () {Navigator.pop(context);},
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 50.w, vertical: 12.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Center(
                        child: Row(
                          children: [
                            SvgPicture.asset(AppImages.refresh, height: 20.h,),
                            SizedBox(width: 10.w,),
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
      ),
    ));
  }
}
