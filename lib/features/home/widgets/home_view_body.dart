import 'package:flutter/material.dart';
import 'package:quizz_app/core/extension/gap_shorthand.dart';
import 'package:quizz_app/core/utils/app_style.dart';
import 'package:quizz_app/features/home/widgets/categoies_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            20.h,
            Text("Quizz App", style: AppStyles.fontBold32(context)),
            Text(
              "Choose quizz to get started",
              style: AppStyles.fontRegular20(context),
            ),
            32.h,
            CategoiesListView(),
          ],
        ),
      ),
    );
  }
}
