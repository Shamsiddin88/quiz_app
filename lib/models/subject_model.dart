import 'package:flutter/material.dart';
import 'package:quiz_app/models/level_model.dart';
import 'package:quiz_app/models/quiz_model.dart';
import '../utils/project_extensions.dart';

class SubjectModel {
  final String subjectName;
  final List<QuizModel> questions;
  final LevelModel level;
  final Color color;
  final String description;

  SubjectModel(
      {required this.level,
      required this.questions,
      required this.subjectName,
      required this.color,
      required this.description});

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      level: getLevelFromString(json["level"] as String? ?? "medium"),
      questions: (json["questions"] as List?)
              ?.map((e) => QuizModel.fromJson(e))
              .toList() ??
          [],
      subjectName: json["subject_name"] as String? ?? "",
      color: (json["color"] as String? ?? "F2954D").toColor(),
      description: json["description"] as String? ?? "",
    );
  }
}
