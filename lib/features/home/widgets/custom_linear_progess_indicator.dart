import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_app/core/extension/color_scheme_shorthand.dart';
import 'package:quizz_app/core/extension/gap_shorthand.dart';
import 'package:quizz_app/core/utils/app_style.dart';
import 'package:quizz_app/features/quizz/controllers/quiz_controller.dart';

class CustomLinearProgressInidicator extends GetView<QuizController> {
  const CustomLinearProgressInidicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Question ${controller.currentQuestionIndex.value + 1} of 10",
              style: AppStyles.fontRegular14(context),
            ),
            Text(
              "Score ${controller.score.value}/10",
              style: AppStyles.fontRegular14(context),
            ),
          ],
        ),
        10.h,
        LinearProgressIndicator(
          borderRadius: BorderRadius.circular(12),
          minHeight: 8,
          value: (controller.currentQuestionIndex.value + 1) * .1,
          backgroundColor: context.colors.onSurface,
          valueColor: AlwaysStoppedAnimation(context.colors.primary),
        ),
      ],
    );
  }
}
