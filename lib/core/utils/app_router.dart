import 'package:get/get.dart';
import 'package:quizz_app/features/home/views/home_view.dart';

abstract class AppRouter {
  static const String homeView = "/";

  static List<GetPage<dynamic>>? getViews() {
    return [GetPage(name: homeView, page: () => const HomeView())];
  }
}
