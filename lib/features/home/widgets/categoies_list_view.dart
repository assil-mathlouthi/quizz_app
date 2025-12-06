import 'package:flutter/material.dart';
import 'package:quizz_app/core/extension/gap_shorthand.dart';
import 'package:quizz_app/core/utils/constants.dart';
import 'package:quizz_app/features/home/widgets/category_list_view_item.dart';

class CategoiesListView extends StatelessWidget {
  const CategoiesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: kCategories.length,
      itemBuilder: (context, index) {
        return CategoryListViewItem(model: kCategories[index]);
      },
      separatorBuilder: (context, index) => 10.h,
    );
  }
}
