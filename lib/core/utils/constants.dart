import 'package:flutter/material.dart';
import '../models/quizz_category_model.dart';

final List<QuizzCategoryModel> kCategories = [
  QuizzCategoryModel(
    title: 'General Knowledge',
    description: 'Dive into the digital world',
    image: 'assets/images/technology.png',
    categoryId: 6,
    color: Colors.teal,
  ),
  QuizzCategoryModel(
    title: 'Science',
    description: 'Test your knowledge of the natural world',
    image: 'assets/images/science.png',
    categoryId: 1,
    color: Colors.blue,
  ),
  QuizzCategoryModel(
    title: 'History',
    description: 'Journey through time and historical events',
    image: 'assets/images/history.png',
    categoryId: 2,
    color: Colors.orange,
  ),
  QuizzCategoryModel(
    title: 'Geography',
    description: 'Explore the world and its wonders',
    image: 'assets/images/geography.png',
    categoryId: 3,
    color: Colors.green,
  ),
  QuizzCategoryModel(
    title: 'Sports',
    description: 'Challenge yourself with sports trivia',
    image: 'assets/images/sports.png',
    categoryId: 4,
    color: Colors.red,
  ),
  QuizzCategoryModel(
    title: 'Animals',
    description: 'Test your cinema knowledge',
    image: 'assets/images/movies.png',
    categoryId: 5,
    color: Colors.purple,
  ),
];
