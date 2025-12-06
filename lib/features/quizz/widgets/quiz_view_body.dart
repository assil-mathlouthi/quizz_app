


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_app/features/quizz/controllers/quiz_controller.dart';

class QuizViewBody extends GetView<QuizController> {
  const QuizViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryId = Get.arguments as int;
    controller.startQuiz(categoryId: categoryId);
    return const Column(
      children: [
        
      ],
    );
  }
}