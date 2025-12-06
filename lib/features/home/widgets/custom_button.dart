
import 'package:flutter/material.dart';
import 'package:quizz_app/core/extension/color_scheme_shorthand.dart';
import 'package:quizz_app/core/utils/app_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        backgroundColor: context.colors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(15),
        ),
      ),
      onPressed: () {},
      child: Text(
        "Start Quiz",
        style: AppStyles.fontBold14(context),
      ),
    );
  }
}
