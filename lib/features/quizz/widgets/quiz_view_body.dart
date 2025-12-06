import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_app/core/extension/gap_shorthand.dart';
import 'package:quizz_app/core/models/quizz_category_model.dart';
import 'package:quizz_app/core/utils/app_style.dart';
import 'package:quizz_app/features/home/widgets/category_logo.dart';
import 'package:quizz_app/features/home/widgets/custom_button.dart';
import 'package:quizz_app/features/home/widgets/custom_linear_progess_indicator.dart';
import 'package:quizz_app/features/home/widgets/question_section.dart';
import 'package:quizz_app/features/quizz/controllers/quiz_controller.dart';

class QuizViewBody extends GetView<QuizController> {
  const QuizViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final category = Get.arguments as QuizzCategoryModel;
    controller.startQuiz(categoryId: category.categoryId);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return Column(
          children: [
            20.h,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CategoryLogo(image: category.image, color: category.color),
              ],
            ),
            10.h,
            Text(category.title, style: AppStyles.fontMedium18(context)),
            60.h,
            CustomLinearProgressInidicator(),
            20.h,
            QuestionSection(quizModel: controller.currentQuizz),
            40.h,
            Row(
              children: [
                Expanded(
                  child: Obx(() {
                    return Opacity(
                      opacity: controller.choosedOption.value.isEmpty ? .5 : 1,
                      child: CustomButton(
                        text: "Submit answer",
                        onPressed: controller.choosedOption.value.isEmpty
                            ? () {}
                            : () {
                                controller.validateQuestion();
                              },
                      ),
                    );
                  }),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
