import 'package:flutter/material.dart';
import 'package:quizz_app/core/extension/color_scheme_shorthand.dart';
import 'package:quizz_app/core/utils/app_style.dart';

class OptionsListItem extends StatelessWidget {
  const OptionsListItem({
    super.key,
    required this.option,
    required this.isSelected,
  });

  final String option;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: isSelected
              ? const Color(0xff0091FF)
              : context.colors.secondary,
        ),
        borderRadius: BorderRadius.circular(15),
        color: isSelected ? Color(0xff0091FF).withAlpha(30) : null,
      ),
      child: Text(option, style: AppStyles.fontRegular14(context)),
    );
  }
}
