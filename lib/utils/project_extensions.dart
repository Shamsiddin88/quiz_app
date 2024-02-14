import 'package:flutter/cupertino.dart';

double height = 0.0;
double width = 0.0;

extension Size on int {
  double h() {
    return (this / 844) * height;
  }

  double w() {
    return (this / 390) * width;
  }

  SizedBox getH() {
    return SizedBox(
      height: (this / 844) * height,
    );
  }

  SizedBox getW() {
    return SizedBox(
      width: (this / 390) * width,
    );
  }
}