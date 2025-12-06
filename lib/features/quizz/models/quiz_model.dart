import 'package:quizz_app/core/enums/quizz_difficulty.dart';

class QuizModel {
  final String type;
  final QuizDifficulty difficulty;
  final String category;
  final String question;
  final String correctAnswer;
  final List<String> incorrectAnswers;

  QuizModel({
    required this.type,
    required this.difficulty,
    required this.category,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      type: json['type'] as String,
      difficulty: QuizDifficulty.fromString(json['difficulty'] as String),
      category: _decodeHtmlEntities(json['category'] as String),
      question: _decodeHtmlEntities(json['question'] as String),
      correctAnswer: _decodeHtmlEntities(json['correct_answer'] as String),
      incorrectAnswers: (json['incorrect_answers'] as List<dynamic>)
          .map((answer) => _decodeHtmlEntities(answer as String))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'difficulty': difficulty.name,
      'category': category,
      'question': question,
      'correct_answer': correctAnswer,
      'incorrect_answers': incorrectAnswers,
    };
  }

  /// Returns all answers (correct + incorrect) shuffled
  List<String> getShuffledAnswers() {
    final allAnswers = [correctAnswer, ...incorrectAnswers];
    allAnswers.shuffle();
    return allAnswers;
  }

  /// Decodes HTML entities like &amp;, &quot;, &eacute;, etc.
  static String _decodeHtmlEntities(String text) {
    return text
        .replaceAll('&amp;', '&')
        .replaceAll('&quot;', '"')
        .replaceAll('&#039;', "'")
        .replaceAll('&eacute;', 'é')
        .replaceAll('&aacute;', 'á')
        .replaceAll('&iacute;', 'í')
        .replaceAll('&oacute;', 'ó')
        .replaceAll('&uacute;', 'ú')
        .replaceAll('&ntilde;', 'ñ')
        .replaceAll('&uuml;', 'ü')
        .replaceAll('&ouml;', 'ö')
        .replaceAll('&auml;', 'ä')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>');
  }

  @override
  String toString() {
    return 'QuizModel(type: $type, difficulty: ${difficulty.name}, category: $category, '
        'question: $question, correctAnswer: $correctAnswer, '
        'incorrectAnswers: $incorrectAnswers)';
  }
}
