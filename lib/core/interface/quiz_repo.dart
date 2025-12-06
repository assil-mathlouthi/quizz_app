import 'package:dartz/dartz.dart';
import 'package:quizz_app/core/error/failure.dart';
import 'package:quizz_app/features/quizz/models/quiz_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<QuizModel>>> fetchQuizByCategoryId({
    required int id,
  });
}
