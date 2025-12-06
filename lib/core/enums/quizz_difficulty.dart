enum QuizDifficulty {
  easy,
  medium,
  hard;

  static QuizDifficulty fromString(String value) {
    return QuizDifficulty.values.firstWhere(
      (e) => e.name == value.toLowerCase(),
      orElse: () => QuizDifficulty.easy,
    );
  }
}
