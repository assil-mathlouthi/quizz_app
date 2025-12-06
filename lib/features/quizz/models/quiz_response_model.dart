


import 'package:quizz_app/features/quizz/models/quiz_model.dart';

class QuizResponseModel {
  final int responseCode;
  final List<QuizModel> results;

  QuizResponseModel({
    required this.responseCode,
    required this.results,
  });

  factory QuizResponseModel.fromJson(Map<String, dynamic> json) {
    return QuizResponseModel(
      responseCode: json['response_code'] as int,
      results: (json['results'] as List<dynamic>)
          .map((result) => QuizModel.fromJson(result as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'response_code': responseCode,
      'results': results.map((quiz) => quiz.toJson()).toList(),
    };
  }
}

