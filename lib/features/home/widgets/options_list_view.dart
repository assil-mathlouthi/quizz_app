import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_app/features/home/widgets/correct_wrong_option_list_item.dart';
import 'package:quizz_app/features/home/widgets/option_list_item.dart';
import 'package:quizz_app/features/quizz/controllers/quiz_controller.dart';
import 'package:quizz_app/features/quizz/models/quiz_model.dart';

class OptionsListView extends GetView<QuizController> {
  const OptionsListView({super.key, required this.quizModel});
  final QuizModel quizModel;

  @override
  Widget build(BuildContext context) {
    /// just shuffle the order of optoins each time
    /// I know there are more better to do it but it's just test
    /// so I try to finish as soon as possible
    List<String> options = [
      quizModel.correctAnswer,
      ...quizModel.incorrectAnswers,
    ];
    options.shuffle();
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: options.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            if (controller.showAnswer.isFalse) {
              controller.chooseOption(option: options[index]);
            }
          },
          child: Obx(() {
            final option = options[index];
            if (controller.showAnswer.value) {
              if (option == controller.choosedOption.value ||
                  option == controller.currentQuizz.correctAnswer) {
                log(option);
                return CorrectWrongOptionListItem(
                  option: option,
                  isCorrect: controller.isOptionCorrect(option: option),
                );
              } else {
                return OptionsListItem(option: option, isSelected: false);
              }
            }
            return OptionsListItem(
              option: option,
              isSelected: controller.choosedOption.value == option,
            );
          }),
        );
      },
    );
  }
}
