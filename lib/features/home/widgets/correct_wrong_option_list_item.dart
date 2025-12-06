import 'package:flutter/material.dart';
import 'package:quizz_app/core/utils/app_style.dart';

class CorrectWrongOptionListItem extends StatelessWidget {
  const CorrectWrongOptionListItem({
    super.key,
    required this.option,
    required this.isCorrect,
  });
  final String option;
  final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: isCorrect ? const Color(0xff00c951) : Color(0xfffb2c36),
        ),
        borderRadius: BorderRadius.circular(15),
        color: isCorrect
            ? Color(0xff00c951).withAlpha(30)
            : Color(0xfffb2c36).withAlpha(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(option, style: AppStyles.fontRegular14(context)),
          ),
          Icon(
            isCorrect ? Icons.check_circle_outline : Icons.cancel_outlined,
            color: isCorrect ? const Color(0xff00c951) : Color(0xfffb2c36),
          ),
        ],
      ),
    );
  }
}
