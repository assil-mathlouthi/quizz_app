import 'package:get/get.dart';
import 'package:quizz_app/features/home/views/home_view.dart';
import 'package:quizz_app/features/quizz/views/quiz_view.dart';
import 'package:quizz_app/features/result/views/result_view.dart';

abstract class AppRouter {
  static const String homeView = "/";
  static const String quizView = "/quizView";
  static const String resultView = "/resultView";


  static List<GetPage<dynamic>>? getViews() {
    return [
      GetPage(name: homeView, page: () => const HomeView()),
      GetPage(name: quizView, page: () => const QuizView()),
      GetPage(name: resultView, page: () => const ResultView()),

    ];
  }
}
