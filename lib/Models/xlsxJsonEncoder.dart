import 'dart:typed_data';

import 'package:collegebuddyweb/Models/QuestionAnswerGenerator.dart';
import 'package:excel/excel.dart';

class XlsxEncoder {
  static xlsxjsonEncoder(Uint8List? bytes) {
    var excel = Excel.decodeBytes(bytes!);
    List jsonQuestionOption = [];
    List jsonQuestionAnswer = [];
    List mixing = [];
    String? question;
    String? c1;
    String? c2;
    String? c3;
    String? c4;
    String? c5;
    for (var table in excel.tables.keys) {
      int rows = excel.tables[table]!.maxRows;

      for (int i = 1; i < rows; i++) {
        excel.tables[table]!.rows[i].forEach((element) {
          if (element!.colIndex == 0) {
            question = element.value;
          } else {
            if (element.colIndex == 1) {
              c1 = element.value;
            }
            if (element.colIndex == 2) {
              c2 = element.value;
            }
            if (element.colIndex == 3) {
              c3 = element.value;
            }
            if (element.colIndex == 4) {
              c4 = element.value;
            }
            if (element.colIndex == 5) {
              c5 = element.value;
            }
          }
        });

        QuestionOptionsGenerator questionOptionsGenerator =
            QuestionOptionsGenerator(
                question: question, c1: c1, c2: c2, c3: c3, c4: c4, c5: c5);
        jsonQuestionOption.add(questionOptionsGenerator.toQuestionOptionMap());
        jsonQuestionAnswer.add(questionOptionsGenerator.toQuestionAnswerMap());
      }
    }
    mixing = [jsonQuestionOption, jsonQuestionAnswer];
    return mixing;
  }
}
