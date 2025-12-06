

import 'package:get/get.dart';
import 'package:quizz_app/core/services/quiz_service.dart';
import 'package:quizz_app/features/quizz/controllers/quiz_controller.dart';


class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuizController(quizService: QuizService()), fenix: true);

  }
}