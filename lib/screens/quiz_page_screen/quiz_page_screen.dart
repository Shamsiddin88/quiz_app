import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:quiz_app/screens/quiz_page_screen/widgets/quiz_screen_bottom.dart';
import 'package:quiz_app/screens/quiz_page_screen/widgets/variant_item_view.dart';
import '../../models/quiz_model.dart';
import '../../models/subject_model.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/images/app_images.dart';
import '../../utils/styles/app_text_style.dart';
import '../quiz_result_screen/quiz_result_screen.dart';
import '../widgets/global_appbar.dart';

class QuizPageScreen extends StatefulWidget {
  const QuizPageScreen({super.key, required this.subjectModel});

  final SubjectModel subjectModel;

  @override
  State<QuizPageScreen> createState() => _QuizPageScreenState();
}

class _QuizPageScreenState extends State<QuizPageScreen> {
  List<QuizModel> questions = [];

  int activeIndex = 0;
  int selectedIndex = 0;

  Map<int, int> selectedAnswers = {};

  @override
  void initState() {
    questions = widget.subjectModel.questions;
    for (int i = 0; i < questions.length; i++) {
      selectedAnswers[i] = 0;
    }
    super.initState();
  }

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
              child: GlobalAppbar(
                title: widget.subjectModel.subjectName,
                onTab: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              QuizResultScreen(
                                selections:selectedAnswers,
                                subjectModel:widget.subjectModel
                              )));
                },
                button: "Submit",
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            SizedBox(
              height: 7.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Row(
                children: [
                  Text(
                    "Maths / Real Numbers",
                    style: AppTextStyle.poppinsRegular.copyWith(
                        color: AppColors.c_F2F2F2.withOpacity(0.5),
                        fontSize: 16),
                  ),
                  Spacer(),
                  SvgPicture.asset(AppImages.timer),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "07:28",
                    style: AppTextStyle.poppinsMedium,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: LinearProgressIndicator(
                value: 0.5,
                minHeight: 12.h,
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.c_F2954D,
                backgroundColor: AppColors.c_162023,
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.c_162023,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.r),
                          topRight: Radius.circular(40.r))),
                  child: Column(
                    children: [
                      Expanded(
                          child: ListView(
                            padding:
                            EdgeInsets.symmetric(
                                vertical: 36.h, horizontal: 24.w),
                            children: [
                              RichText(
                                  text: TextSpan(
                                      text: "Q.${activeIndex + 1}",
                                      style: AppTextStyle.poppinsSemiBold
                                          .copyWith(fontSize: 20.sp),
                                      children: [
                                        TextSpan(
                                            text: "/${questions.length}",
                                            style: AppTextStyle.poppinsMedium
                                                .copyWith(fontSize: 14.sp))
                                      ])),
                              SizedBox(
                                height: 12.h,
                              ),
                              Text(
                                questions[activeIndex].questionText,
                                style: AppTextStyle.poppinsSemiBold
                                    .copyWith(fontSize: 17.sp),
                              ),
                              SizedBox(
                                height: 14.h,
                              ),
                              VariantItemView(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = 1;
                                  });
                                },
                                isSelected: selectedIndex == 1,
                                variantText: questions[activeIndex].variant1,
                                caption: "A",
                              ),
                              VariantItemView(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = 2;
                                  });
                                },
                                isSelected: selectedIndex == 2,
                                variantText: questions[activeIndex].variant2,
                                caption: "B",
                              ),
                              VariantItemView(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = 3;
                                  });
                                },
                                isSelected: selectedIndex == 3,
                                variantText: questions[activeIndex].variant3,
                                caption: "C",
                              ),
                              VariantItemView(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = 4;
                                  });
                                },
                                isSelected: selectedIndex == 4,
                                variantText: questions[activeIndex].variant4,
                                caption: "D",
                              ),
                            ],
                          )),
                      QuizScreenBottom(onPrevious: () {
                        if (activeIndex >= 1) {
                          activeIndex--;
                          selectedIndex = selectedAnswers[activeIndex]!;
                          setState(() {});
                        }
                      },
                          onNext: () {
                            selectedAnswers[activeIndex] = selectedIndex;
                            if (activeIndex < questions.length - 1) {
                              selectedIndex = 0;
                              activeIndex++;
                            }
                            setState(() {

                            });
                          },
                          nextButtonVisibility: activeIndex != questions.length,
                          previousButtonVisibility: activeIndex != 0)
                    ],
                  ),
                ))

            // Container(
            //   padding: EdgeInsets.only(top: 40.h, left: 32.w, right: 32.w),
            //   width: double.infinity,
            //   height: 420.h,
            //   decoration: BoxDecoration(
            //       border: Border.all(color: AppColors.c_2F3739, width: 1),
            //       color: AppColors.c_162023,
            //       borderRadius: BorderRadius.only(
            //           topLeft: Radius.circular(40.r),
            //           topRight: Radius.circular(40.r))),
            //   child: Expanded(
            //     child: PageView(
            //       //    physics: const NeverScrollableScrollPhysics(),
            //       scrollDirection: Axis.horizontal,
            //       children: [
            //         ...List.generate(
            //           widget.subjectModel.questions.length,
            //           (index) => Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               RichText(
            //                 text: TextSpan(
            //                   children: <TextSpan>[
            //                     TextSpan(text: "Q ", style: AppTextStyle.poppinsSemiBold.copyWith(fontSize: 20.sp)),
            //                     TextSpan(text: "${(widget.subjectModel.questions.length - (widget.subjectModel.questions.length - (index + 1))).toString()}/", style: AppTextStyle.poppinsSemiBold.copyWith(fontSize: 20.sp)),
            //                     TextSpan(text: widget.subjectModel.questions.length.toString(), style: AppTextStyle.poppinsRegular.copyWith(fontSize: 14.sp))
            //                   ],
            //                 ),
            //               ),
            //              SizedBox(height: 12.h,),
            //              Text(
            //                 widget.subjectModel.questions[index].questionText
            //                     .toString(),
            //                 style: AppTextStyle.poppinsSemiBold
            //                     .copyWith(fontSize: 17),
            //               ),
            //               SizedBox(height: 24.h,),
            //
            //               Material(
            //                 color: AppColors.transparent,
            //                 child: Ink(
            //                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.sp), color: AppColors.c_273032,),
            //
            //                   child: InkWell(
            //                     borderRadius: BorderRadius.circular(16.sp),
            //                     onTap: (){},
            //                     child: Container(
            //                       width: double.infinity,
            //                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.sp)),
            //                       padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 13.h),
            //                       child: Row(
            //                         children: [
            //                           Text("A.", style: AppTextStyle.poppinsBold.copyWith(fontSize: 14.sp),),
            //                           SizedBox(width: 12.w,),
            //                           Text(
            //                             widget.subjectModel.questions[index].variant1
            //                                 .toString(),
            //                             style: AppTextStyle.poppinsMedium
            //                                 .copyWith(fontSize: 14),
            //                           ),
            //                         ],
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //               Text(
            //                 widget.subjectModel.questions[index].variant2
            //                     .toString(),
            //                 style: AppTextStyle.poppinsSemiBold
            //                     .copyWith(fontSize: 17),
            //               ),
            //               Text(
            //                 widget.subjectModel.questions[index].variant3
            //                     .toString(),
            //                 style: AppTextStyle.poppinsSemiBold
            //                     .copyWith(fontSize: 17),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
