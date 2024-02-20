import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/data/data_repository.dart';
import 'package:quiz_app/screens/subjects_screen/subject_screen.dart';
import 'package:quiz_app/utils/images/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() async {
    DataRepository.instance.loadSubjects();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const SubjectsScreen()));
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Lottie.asset(AppImages.testAnimation),),
    );
  }
}
