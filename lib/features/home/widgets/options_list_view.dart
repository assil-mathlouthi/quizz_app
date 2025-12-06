import 'package:flutter/material.dart';
import 'package:quizz_app/features/home/widgets/option_list_item.dart';
import 'package:quizz_app/features/quizz/models/quiz_model.dart';

class OptionsListView extends StatelessWidget {
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
        return OptionsListItem(option: options[index]);
      },
    );
  }
}
