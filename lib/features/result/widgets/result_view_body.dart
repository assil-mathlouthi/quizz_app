import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_app/core/extension/color_scheme_shorthand.dart';
import 'package:quizz_app/core/extension/gap_shorthand.dart';
import 'package:quizz_app/core/utils/app_router.dart';
import 'package:quizz_app/core/utils/app_style.dart';
import 'package:quizz_app/features/home/widgets/custom_button.dart';
import 'package:quizz_app/features/quizz/controllers/quiz_controller.dart';

class ResultViewBody extends GetView<QuizController> {
  const ResultViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final int correctAnswers = controller.score.value;
    final int totalQuestions = 10;

    final double ratio = totalQuestions == 0
        ? 0
        : (correctAnswers / totalQuestions).clamp(0, 1);

    final String headline = ratio >= .8
        ? 'Excellent work!'
        : ratio >= .5
        ? 'Nice job, keep practicing!'
        : 'Keep practicing!';

    final Color trophyColor = ratio >= .5 ? Colors.green : Colors.blue;
    final int filledStars = (ratio * 5).round().clamp(0, 5);

    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48),
        margin: const EdgeInsets.symmetric(horizontal: 24.0),
        decoration: BoxDecoration(
          color: context.colors.onSurface,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            CircleAvatar(
              radius: 44,
              backgroundColor: trophyColor.withValues(alpha: .15),
              child: Icon(Icons.emoji_events, color: trophyColor, size: 40),
            ),
            16.h,
            Text('Quiz Complete!', style: AppStyles.fontRegular20(context)),
            8.h,
            Text(headline, style: AppStyles.fontMedium18(context)),
            24.h,
            Text(
              '$correctAnswers/$totalQuestions',
              style: AppStyles.fontMedium28(context),
            ),
            6.h,
            Text('Correct answers', style: AppStyles.fontMedium18(context)),
            16.h,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                final bool filled = index < filledStars;
                return Icon(
                  filled ? Icons.star_rounded : Icons.star_border_rounded,
                  color: filled
                      ? Colors.amber
                      : context.colors.onSurfaceVariant,
                  size: 28,
                );
              }),
            ),
            32.h,
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    onPressed: () {
                      Get.back();
                    },
                    text: "Reset",
                  ),
                ),
              ],
            ),
            12.h,
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    reverse: true,
                    onPressed: () {
                      Get.offNamed(AppRouter.homeView);
                    },
                    text: "Go Home",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
