import 'package:flutter/material.dart';
import 'package:quizz_app/core/utils/assets.dart';
import '../models/quizz_category_model.dart';

final List<QuizzCategoryModel> kCategories = [
  QuizzCategoryModel(
    title: 'General Knowledge',
    description: 'Test your broad knowledge across various topics',
    image: Assets.imagesTablerBrain,
    categoryId: 9,
    color: Color(0xFF6A1B9A),
  ),
  QuizzCategoryModel(
    title: 'Science',
    description: 'Explore biology, chemistry, physics and natural wonders',
    image: Assets.imagesScience,
    categoryId: 17,
    color: Color(0xFF2196F3),
  ),
  QuizzCategoryModel(
    title: 'History',
    description: 'Discover ancient civilizations and historical milestones',
    image: Assets.imagesHistory,
    categoryId: 23,
    color: Color(0xFFFF6F00),
  ),
  QuizzCategoryModel(
    title: 'Geography',
    description: 'Master countries, capitals and world landmarks',
    image: Assets.imagesGeography,
    categoryId: 22,
    color: Color(0xFF388E3C),
  ),
  QuizzCategoryModel(
    title: 'Sports',
    description: 'Challenge yourself with athletes, teams and sporting events',
    image: Assets.imagesSports,
    categoryId: 21,
    color: Color(0xFFD32F2F),
  ),
  QuizzCategoryModel(
    title: 'Animals',
    description: 'Learn about wildlife, species and the animal kingdom',
    image: Assets.imagesAnimals,
    categoryId: 27,
    color: Color(0xFF7B1FA2),
  ),
];
