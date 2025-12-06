import 'package:flutter/material.dart';
import 'package:quizz_app/core/extension/color_scheme_shorthand.dart';
import 'package:quizz_app/core/utils/app_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.reverse = false,
  });

  final VoidCallback onPressed;
  final String text;
  final bool reverse;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        backgroundColor: reverse
            ? context.colors.onSurface
            : context.colors.primary,
        shape: RoundedRectangleBorder(
          side: reverse ? BorderSide() : BorderSide.none,
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: AppStyles.fontBold14(
          context,
        ).copyWith(color: reverse ? context.colors.primary : null),
      ),
    );
  }
}
