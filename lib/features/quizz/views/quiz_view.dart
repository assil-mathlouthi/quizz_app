

import 'package:flutter/material.dart';
import 'package:quizz_app/features/quizz/widgets/quiz_view_body.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: QuizViewBody()),
    );
  }
}