import 'dart:convert';

class QuestionAnswerChecker {
  String? question;
  String? choice;
  QuestionAnswerChecker({
    this.question,
    this.choice,
  });
  

  QuestionAnswerChecker copyWith({
    String? question,
    String? choice,
  }) {
    return QuestionAnswerChecker(
      question: question ?? this.question,
      choice: choice ?? this.choice,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'choice': choice,
    };
  }

  factory QuestionAnswerChecker.fromMap(Map<String, dynamic> map) {
    return QuestionAnswerChecker(
      question: map['question'],
      choice: map['choice'],
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionAnswerChecker.fromJson(String source) => QuestionAnswerChecker.fromMap(json.decode(source));

  @override
  String toString() => 'QuestionAnswerChecker(question: $question, choice: $choice)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is QuestionAnswerChecker &&
      other.question == question &&
      other.choice == choice;
  }

  @override
  int get hashCode => question.hashCode ^ choice.hashCode;
}
