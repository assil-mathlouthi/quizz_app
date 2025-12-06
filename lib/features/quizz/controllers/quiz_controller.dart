import 'dart:developer';

import 'package:get/get.dart';
import 'package:quizz_app/core/interface/quiz_repo.dart';
import 'package:quizz_app/core/services/quiz_service.dart';
import 'package:quizz_app/features/quizz/models/quiz_model.dart';

class QuizController extends GetxController {
  final QuizRepo _quizRepo = QuizService();

  // Observable state
  final RxList<QuizModel> questions = <QuizModel>[].obs;
  final RxInt currentQuestionIndex = 0.obs;
  final RxInt score = 0.obs;
  final RxBool isLoading = false.obs;



  // start the quiz
  Future<void> startQuiz({required int categoryId}) async {
    isLoading.value = true;
    currentQuestionIndex.value = 0;
    score.value = 0;
    questions.clear();

    try {
      final result = await _quizRepo.fetchQuizByCategoryId(id: categoryId);

      result.fold(
        (failure) {
          isLoading.value = false;
          log(failure.errorMessage);
        },
        (quizList) {
          questions.value = quizList;

          isLoading.value = false;
        },
      );
    } catch (e) {
      log(e.toString());
      isLoading.value = false;
    }
  }
}
