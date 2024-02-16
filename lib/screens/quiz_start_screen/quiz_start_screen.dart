import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/models/subject_model.dart';
import 'package:quiz_app/screens/quiz_page_screen/quiz_page_screen.dart';
import 'package:quiz_app/screens/quiz_start_screen/widgets/title_items.dart';
import 'package:quiz_app/utils/colors/app_colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/utils/styles/app_text_style.dart';
import '../../utils/images/app_images.dart';
import '../widgets/global_appbar.dart';

class QuizStartScreen extends StatefulWidget {
  const QuizStartScreen({super.key, required this.subjectModel});

  final SubjectModel subjectModel;

  @override
  State<QuizStartScreen> createState() => _QuizStartScreenState();
}

class _QuizStartScreenState extends State<QuizStartScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(statusBarColor: AppColors.transparent),
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: GlobalAppbar(title: "Testni boshlash"),
            ),
            SizedBox(
              height: 22.h,
            ),
            Container(
              width: double.infinity,
              height: 570.h,
              decoration: BoxDecoration(
                  color: AppColors.c_162023,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.r),
                      topRight: Radius.circular(40.r))),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 32.w, vertical: 32.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Test qoidalari bilan tanishib chiqing va testni boshlang",
                              style: AppTextStyle.poppinsRegular
                                  .copyWith(fontSize: 14.sp),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Container(
                              height: 220.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                border: Border.all(
                                    width: 1, color: AppColors.c_F2954D),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(16.r),
                                      child: Image.asset(
                                          widget.subjectModel.imagePath,
                                          height: 154.h)),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: TitleItem(
                                        title: "Fan: ",
                                        subtitle:
                                            widget.subjectModel.subjectName),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: TitleItem(
                                        title: "Qiyinligi: ",
                                        subtitle:
                                            widget.subjectModel.level.name),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                            TitleItem(
                                title: "Savollar soni: ",
                                subtitle: widget.subjectModel.questions.length
                                    .toString()),
                            SizedBox(
                              height: 12.h,
                            ),
                            TitleItem(
                                title: "Ajratilgan vaqt: ",
                                subtitle:
                                    "${widget.subjectModel.questions.length * 3}:00 min"),
                            SizedBox(
                              height: 12.h,
                            ),
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: "Yo'riqnoma:\n",
                                      style: AppTextStyle.poppinsBold
                                          .copyWith(fontSize: 14.sp)),
                                  TextSpan(
                                      text: widget.subjectModel.description,
                                      style: AppTextStyle.poppinsRegular
                                          .copyWith(fontSize: 14.sp))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    height: 86.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColors.c_273032,
                        borderRadius: BorderRadius.circular(40.r)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                  width: 1, color: AppColors.c_F2F2F2)),
                          margin: EdgeInsets.symmetric(vertical: 20.h),
                          padding: EdgeInsets.all(12),
                          child: Row(
                            children: [
                              SvgPicture.asset(AppImages.timer),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                "${widget.subjectModel.questions.length * 3}:00",
                                style: AppTextStyle.poppinsMedium
                                    .copyWith(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuizPageScreen(
                                  subjectModel: widget.subjectModel,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 20.h),
                            padding: EdgeInsets.symmetric(
                                horizontal: 55.w, vertical: 12.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              color: AppColors.c_F2954D,
                            ),
                            child: Center(
                                child: Text("Boshlash",
                                    style: AppTextStyle.poppinsSemiBold)),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
