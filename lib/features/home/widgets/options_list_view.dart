
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
    
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.currentOptions.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            if (controller.showAnswer.isFalse) {
              controller.chooseOption(option: controller.currentOptions[index]);
            }
          },
          child: Obx(() {
            final option = controller.currentOptions[index];
            if (controller.showAnswer.value) {
              if (option == controller.choosedOption.value ||
                  option == controller.currentQuizz.correctAnswer) {
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
