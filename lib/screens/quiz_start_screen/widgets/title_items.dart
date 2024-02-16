import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/styles/app_text_style.dart';

class TitleItem extends StatelessWidget {
  const TitleItem({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;


  @override
  Widget build(BuildContext context) {
    return
      RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(text: title, style: AppTextStyle.poppinsRegular.copyWith(fontSize: 14.sp)),
          TextSpan(text: subtitle, style: AppTextStyle.poppinsBold.copyWith(fontSize: 14.sp))
        ],
      ),
    );
  }
}
