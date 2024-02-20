import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/screens/quiz_page_screen/widgets/quiz_screen_bottom.dart';
import 'package:quiz_app/screens/quiz_page_screen/widgets/variant_item_view.dart';
import '../../data/answer_report.dart';
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
  int count = 0;

  List<QuizModel> questions = [];

  int activeIndex = 0;
  int selectedIndex = 0; //selectedIndex oladigan qiymatlari: 0,1,2,3,4

  Map<int, int> selectedAnswers = {};

  Future<void> _timerLogic() async {
    for (int i = questions.length * 10; i > 0; i--) {
      setState(() {
        count = i;
      });
      await Future.delayed(const Duration(seconds: 1));
    }

    _navigateToResultScreen();
  }

  @override
  void initState() {
    questions = widget.subjectModel.questions;

    for (int i = 0; i < questions.length; i++) {
      selectedAnswers[i] = 0;
    }

    _timerLogic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(statusBarColor: AppColors.transparent),
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
                onTab:_navigateToResultScreen,
                button: "Submit",
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Row(
                children: [
                  const Spacer(),
                  SvgPicture.asset(AppImages.timer, height: 22.h,),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    getMinutelyText(count),
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
                value:  count / (questions.length * 10),
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
                            else _navigateToResultScreen();

                            setState(() {

                            });
                          },
                          nextButtonVisibility: activeIndex != questions.length,
                          previousButtonVisibility: activeIndex != 0)
                    ],
                  ),
                ))

          ],
        ),
      ),
    );
  }
  void _navigateToResultScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return QuizResultScreen(
            answerReport: AnswerReport(
              subjectModel: widget.subjectModel,
              selectedAnswers: selectedAnswers,
              spentTime: questions.length * 10 - count,
            ),
          );
        },
      ),
    );
  }

}



String getMinutelyText(int timeInSeconds) {
  //"01:10"
  //1 hour > seconds > 0
  int min = timeInSeconds ~/ 60;
  int sec = timeInSeconds % 60;

  String minute = min.toString().length <= 1 ? "0$min" : "$min";
  String second = sec.toString().length <= 1 ? "0$sec" : "$sec";

  return "$minute : $second";
}

