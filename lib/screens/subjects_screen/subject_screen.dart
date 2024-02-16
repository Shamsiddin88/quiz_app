import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiz_app/data/data_repository.dart';
import 'package:quiz_app/models/subject_model.dart';
import 'package:quiz_app/screens/quiz_start_screen/quiz_start_screen.dart';
import 'package:quiz_app/screens/subjects_screen/widgets/subject_item.dart';
import 'package:quiz_app/screens/widgets/global_appbar.dart';

class SubjectsScreen extends StatefulWidget {
  const SubjectsScreen({super.key});

  @override
  State<SubjectsScreen> createState() => _SubjectsScreenState();
}

class _SubjectsScreenState extends State<SubjectsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 35.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: GlobalAppbar(title: "Fanni tanlang"),
        ),
        Expanded(
          child: ListView(
            children: [
              ...List.generate(DataRepository().allSubjects.length, (index) {
                SubjectModel subject = DataRepository().allSubjects[index];
                return SubjectItem(
                  time: "12:00",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuizStartScreen(
                                  subjectModel: subject,
                                )));
                  },
                  subjectModel: subject,
                );
              })
            ],
          ),
        ),
      ],
    ));
  }
}
