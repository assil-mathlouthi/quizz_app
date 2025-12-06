import 'dart:developer';

import 'package:get/get.dart';
import 'package:quizz_app/core/interface/quiz_repo.dart';
import 'package:quizz_app/features/quizz/models/quiz_model.dart';

class QuizController extends GetxController {
  QuizController({required this.quizService});
  final QuizRepo quizService;

  // Observable state
  final RxList<QuizModel> questions = <QuizModel>[].obs;
  final RxInt currentQuestionIndex = 0.obs;
  final RxInt score = 0.obs;
  final RxBool isLoading = false.obs;
  final RxBool showAnswer = false.obs;

  final RxString choosedOption = "".obs;

  QuizModel get currentQuizz => questions[currentQuestionIndex.value];

  void chooseOption({required String option}) {
    choosedOption.value = option;
  }

  void goToNext() {
    showAnswer.value = false;
  }

  void validateQuestion() {
    showAnswer.value = true;
    if (choosedOption.value == currentQuizz.correctAnswer) {
      score.value++;
    }
    choosedOption.value = "";
  }

  // start the quiz
  Future<void> startQuiz({required int categoryId}) async {
    isLoading.value = true;
    currentQuestionIndex.value = 0;
    score.value = 0;
    questions.clear();

    try {
      final result = await quizService.fetchQuizByCategoryId(id: categoryId);

      result.fold(
        (failure) {
          isLoading.value = false;
          log(failure.errorMessage);
        },
        (quizList) {
          questions.value = quizList;
          log(questions.first.toString());
          isLoading.value = false;
        },
      );
    } catch (e) {
      log(e.toString());
      isLoading.value = false;
    }
  }
}
