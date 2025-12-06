import 'package:flutter/material.dart';
import 'package:quizz_app/core/utils/app_style.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          Text("Quizz App", style: AppStyles.fontBold32(context)),
          Text(
            "Choose quizz to get started",
            style: AppStyles.fontRegular20(context),
          ),
        ],
      ),
    );
  }
}
