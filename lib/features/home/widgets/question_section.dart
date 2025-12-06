import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_app/core/extension/color_scheme_shorthand.dart';
import 'package:quizz_app/core/extension/gap_shorthand.dart';
import 'package:quizz_app/core/utils/app_style.dart';
import 'package:quizz_app/features/home/widgets/options_list_view.dart';
import 'package:quizz_app/features/quizz/controllers/quiz_controller.dart';
import 'package:quizz_app/features/quizz/models/quiz_model.dart';

class QuestionSection extends GetView<QuizController> {
  const QuestionSection({super.key, required this.quizModel});
  final QuizModel quizModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: context.colors.onSurface,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(quizModel.question, style: AppStyles.fontRegular16(context)),
          30.h,
          OptionsListView(quizModel: quizModel),
        ],
      ),
    );
  }
}
