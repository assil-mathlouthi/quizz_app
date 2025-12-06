import 'package:flutter/widgets.dart';

class QuizzCategoryModel {
  final String title;
  final String description;
  final String image;
  final Color color;
  final int categoryId;

  QuizzCategoryModel({
    required this.title,
    required this.description,
    required this.image,
    required this.categoryId,
    required this.color,
  });
}
