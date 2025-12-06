import 'package:flutter/material.dart';
import 'package:quizz_app/core/extension/color_scheme_shorthand.dart';
import 'package:quizz_app/core/utils/app_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.text});

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        backgroundColor: context.colors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
      ),
      onPressed: onPressed,
      child: Text(text, style: AppStyles.fontBold14(context)),
    );
  }
}
