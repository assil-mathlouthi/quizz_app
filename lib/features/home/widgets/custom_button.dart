import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_app/core/extension/color_scheme_shorthand.dart';
import 'package:quizz_app/core/models/quizz_category_model.dart';
import 'package:quizz_app/core/utils/app_router.dart';
import 'package:quizz_app/core/utils/app_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.categoryModel});

  final QuizzCategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        backgroundColor: context.colors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(15),
        ),
      ),
      onPressed: () {
        Get.toNamed(AppRouter.quizView, arguments: categoryModel);
      },
      child: Text("Start Quiz", style: AppStyles.fontBold14(context)),
    );
  }
}
