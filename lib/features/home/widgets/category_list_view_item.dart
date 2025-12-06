import 'package:flutter/material.dart';
import 'package:quizz_app/core/extension/color_scheme_shorthand.dart';
import 'package:quizz_app/core/models/quizz_category_model.dart';
import 'package:quizz_app/core/utils/app_style.dart';
import 'package:quizz_app/features/home/widgets/category_logo.dart';
import 'package:quizz_app/features/home/widgets/custom_button.dart';

class CategoryListViewItem extends StatelessWidget {
  const CategoryListViewItem({super.key, required this.model});
  final QuizzCategoryModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: _buildDecoration(context),
      child: Row(
        spacing: 15,
        children: [
          CategoryLogo(image: model.image, color: model.color),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(model.title, style: AppStyles.fontMedium18(context)),
                Text(
                  model.description,
                  style: AppStyles.fontRegular14(context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "10 questions",
                      style: AppStyles.fontRegular14(context),
                    ),
                    CustomButton(categoryId: model.categoryId),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration _buildDecoration(BuildContext context) {
    return BoxDecoration(
      color: context.colors.onSurface,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(offset: Offset(0, 2), blurRadius: 4, color: Colors.black26),
      ],
    );
  }
}
