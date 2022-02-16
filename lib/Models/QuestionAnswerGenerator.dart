import 'dart:io';

import 'package:excel/excel.dart';

class QuestionOptionsGenerator {
  String? question;
  String? c1;
  String? c2;
  String? c3;
  String? c4;
  String? c5;
  QuestionOptionsGenerator(
      {this.question, this.c1, this.c2, this.c3, this.c4, this.c5});

  Map<String, dynamic> toQuestionOptionMap() {
    return {
      "question": question,
      "choices": [c1, c2, c3, c4]
    };
  }

  Map<String, dynamic> toQuestionAnswerMap() {
    return {"question": question, "correctChoice": c5};
  }
}



