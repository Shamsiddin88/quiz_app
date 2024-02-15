import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/images/app_images.dart';
import '../../utils/styles/app_text_style.dart';
import '../quiz_result_screen/quiz_result_screen.dart';
import '../widgets/global_appbar.dart';

class QuizPageScreen extends StatefulWidget {
  const QuizPageScreen({super.key});

  @override
  State<QuizPageScreen> createState() => _QuizPageScreenState();
}

class _QuizPageScreenState extends State<QuizPageScreen> {
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
            GlobalAppbar(title: "Quiz", onTab: (){}, button: "Submit",),
            SizedBox(height: 32.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Text("Pair of Linear Equation in Two Variables ", style: AppTextStyle.poppinsRegular.copyWith(fontSize: 20),),
            ),
            SizedBox(height: 7.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Row(children: [
                Text("Maths / Real Numbers", style: AppTextStyle.poppinsRegular.copyWith(color: AppColors.c_F2F2F2.withOpacity(0.5), fontSize: 16),),
                Spacer(),
                SvgPicture.asset(AppImages.timer),
                SizedBox(width: 5.w,),
                Text("07:28", style: AppTextStyle.poppinsMedium,)
              ],),
            ),
            SizedBox(height: 10.h,),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 32.w),
                  height: 9.h,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColors.c_162023),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 32.w),
                  width: 192.w,
                  height: 9.h,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColors.c_F2954D),
                )
              ],
            ),
            SizedBox(height: 25.h,),
            Container(
              width: double.infinity,
              height: 420.h,
              decoration: BoxDecoration(border: Border.all(color: AppColors.c_2F3739, width: 1),
                  color: AppColors.c_162023,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.r),
                      topRight: Radius.circular(40.r))),

            ),






          ],
        ),
      ),
    );
  }
}
