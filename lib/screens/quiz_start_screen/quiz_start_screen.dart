import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/screens/quiz_page_screen/quiz_page_screen.dart';
import 'package:quiz_app/screens/quiz_start_screen/widgets/title_items.dart';
import 'package:quiz_app/utils/colors/app_colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/utils/styles/app_text_style.dart';

import '../../utils/images/app_images.dart';

class QuizStartScreen extends StatefulWidget {
  const QuizStartScreen({super.key});

  @override
  State<QuizStartScreen> createState() => _QuizStartScreenState();
}

class _QuizStartScreenState extends State<QuizStartScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(statusBarColor: AppColors.transparent),
      child: Scaffold(
        backgroundColor: AppColors.c_273032,
        body: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Row(
                children: [
                  InkWell(
                    customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r)),
                    onTap: () {},
                    child: Container(
                      height: 48.h,
                      width: 48.w,
                      decoration: BoxDecoration(
                          color: AppColors.c_162023,
                          borderRadius: BorderRadius.circular(8.r),
                          border:
                              Border.all(width: 1, color: AppColors.c_2F3739),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              spreadRadius: 0,
                              blurRadius: 12.r,
                              offset:
                                  Offset(0, 5), // changes position of shadow
                            ),
                          ]),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 12.h),
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
                    "Start Quiz",
                    style: AppTextStyle.poppinsMedium.copyWith(fontSize: 20.sp),
                  )
                ],
              ),
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 32.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Put your understanding of this concept to test by answering a few MCQs.",
                          style:
                              AppTextStyle.poppinsRegular.copyWith(fontSize: 14.sp),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Stack(
                          children: [
                            Container(
                              height: 220.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                border:
                                    Border.all(width: 1, color: AppColors.c_F2954D),
                              ),
                            ),
                            Container(
                              height: 154.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColors.c_F2954D,
                                borderRadius: BorderRadius.circular(16.r),
                                border:
                                    Border.all(width: 1, color: AppColors.c_F2954D),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    right:0,
                                    bottom: 0,
                                    child: Image.asset(
                                      AppImages.wallpaper,
                                      height: 140,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                                top: 35.h,
                                left: 16.w,
                                bottom: 35.h,
                                right: 125.w,
                                child: Text("Pair of Linear Equation in Two Variables ", style: AppTextStyle.poppinsBold.copyWith(fontSize: 19.sp),)),
                            Positioned(
                                left: 16.w,
                                bottom: 9.h,
                                child:
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TitleItem(title: "Subject: ", subtitle: "Maths"),
                                    TitleItem(title: "Chapter: ", subtitle: "Real Numbers"),
                                  ],
                                ))
                          ],
                        ),
                        SizedBox(height: 25.h,),
                        TitleItem(title: "Total Questions: ", subtitle: "05"),
                        SizedBox(height: 12.h,),
                        TitleItem(title: "Total Time: ", subtitle: "15 min"),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(text: "Instructions:\n", style: AppTextStyle.poppinsBold.copyWith(fontSize: 14.sp)),
                              TextSpan(text: 'The quizzes consists of questions carefully designed to help you self-assess your comprehension of the information presented on the topics covered in the module. After responding to a question, click on the "Next Question" button at the bottom to go to the next questino. After responding to the 8th question, click on "Close" on the top of the window to exit the quiz. If you select an incorrect response for a question, you can try again until you get the correct response. If you retake the quiz, the questions and their respective responses will be randomized.'
                                  , style: AppTextStyle.poppinsRegular.copyWith(fontSize: 14.sp))
                            ],
                          ), maxLines: 3, overflow: TextOverflow.ellipsis ,
                        ),



                      ],
                    ),
                  ),

                  Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    height: 86.h,
                    width: double.infinity,
                    decoration: BoxDecoration(color: AppColors.c_273032, borderRadius: BorderRadius.circular(40.r)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Container(
                      decoration:BoxDecoration(borderRadius: BorderRadius.circular(8.r),border: Border.all(width: 1, color: AppColors.c_F2F2F2)),
                      margin: EdgeInsets.symmetric(vertical: 20.h),
                      padding: EdgeInsets.all(12),
                      child: Row(
                      children: [SvgPicture.asset(AppImages.timer),
                        SizedBox(width: 5.w,),
                        Text("15:00", style: AppTextStyle.poppinsMedium.copyWith(fontSize: 16),),
                      ],
                    ),),
                    GestureDetector(
                      onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>QuizPageScreen()));},
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 20.h),
                        padding: EdgeInsets.symmetric(horizontal: 55.w, vertical: 12.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: AppColors.c_F2954D,
                        ),
                        child: Center(
                            child: Text("Start Quiz", style: AppTextStyle.poppinsSemiBold)),
                      ),
                    ),

                  ],),)

                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
