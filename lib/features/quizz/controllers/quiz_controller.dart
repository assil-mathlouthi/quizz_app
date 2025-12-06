import 'dart:developer';

import 'package:get/get.dart';
import 'package:quizz_app/core/interface/quiz_repo.dart';
import 'package:quizz_app/core/utils/app_router.dart';
import 'package:quizz_app/features/quizz/models/quiz_model.dart';

class QuizController extends GetxController {
  QuizController({required this.quizService});
  final QuizRepo quizService;
  int? _currentCategoryId;

  // Observable state
  final RxList<QuizModel> questions = <QuizModel>[].obs;
  final RxInt currentQuestionIndex = 0.obs;
  final RxInt score = 0.obs;
  final RxBool isLoading = false.obs;
  final RxBool showAnswer = false.obs;

  final RxList<String> currentOptions = <String>[].obs;

  final RxString choosedOption = "".obs;

  QuizModel get currentQuizz => questions[currentQuestionIndex.value];

  void chooseOption({required String option}) {
    choosedOption.value = option;
  }

  List<String> getCurrentOptions() {
    if (questions.isEmpty) return [];

    /// just shuffle the order of optoins each time
    /// I know there are more better to do it but it's just test
    /// so I try to finish as soon as possible
    List<String> options = [
      currentQuizz.correctAnswer,
      ...currentQuizz.incorrectAnswers,
    ];
    options.shuffle();
    return options;
  }

  void goToNext() {
    if (questions.isEmpty) return;
    if (currentQuestionIndex.value >= questions.length - 1) {
      Get.toNamed(AppRouter.resultView);
      return;
    }

    showAnswer.value = false;
    choosedOption.value = "";
    currentQuestionIndex.value++;
    currentOptions.value = getCurrentOptions();
  }

  bool isOptionCorrect({required String option}) =>
      option == currentQuizz.correctAnswer;

  void validateQuestion() {
    if (questions.isEmpty) return;
    showAnswer.value = true;
    if (choosedOption.value == currentQuizz.correctAnswer) {
      score.value++;
    }
  }

  // start the quiz
  Future<void> startQuiz({required int categoryId}) async {
    if (_currentCategoryId == categoryId && questions.isNotEmpty) return;
    if (isLoading.value) return;
    _currentCategoryId = categoryId;
    isLoading.value = true;
    currentQuestionIndex.value = 0;
    score.value = 0;
    showAnswer.value = false;
    choosedOption.value = "";
    questions.clear();
    currentOptions.clear();

    try {
      final result = await quizService.fetchQuizByCategoryId(id: categoryId);

      result.fold(
        (failure) {
          isLoading.value = false;
          log(failure.errorMessage);
        },
        (quizList) {
          questions.value = quizList;
          if (questions.isNotEmpty) {
            currentOptions.value = getCurrentOptions();
          }
          if (questions.isNotEmpty) {
            log(questions.first.toString());
          }
          isLoading.value = false;
        },
      );
    } catch (e) {
      log(e.toString());
      isLoading.value = false;
    }
  }
}
