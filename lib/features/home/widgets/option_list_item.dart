import 'package:flutter/material.dart';
import 'package:quizz_app/core/extension/color_scheme_shorthand.dart';
import 'package:quizz_app/core/utils/app_style.dart';

class OptionsListItem extends StatelessWidget {
  const OptionsListItem({super.key, required this.option});

  final String option;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: context.colors.secondary),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(option, style: AppStyles.fontRegular14(context)),
    );
  }
}
