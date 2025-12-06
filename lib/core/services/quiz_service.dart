import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quizz_app/core/error/failure.dart';
import 'package:quizz_app/core/interface/quiz_repo.dart';
import 'package:quizz_app/core/utils/api_service.dart';
import 'package:quizz_app/features/quizz/models/quiz_model.dart';
import 'package:quizz_app/features/quizz/models/quiz_response_model.dart';

class QuizService implements QuizRepo {
  final ApiServices _apiServices;

  QuizService() : _apiServices = ApiServices(Dio());

  @override
  Future<Either<Failure, List<QuizModel>>> fetchQuizByCategoryId({
    required int id,
  }) async {
    try {
      final endPoint = '?amount=10&category=$id&type=multiple';
      log(endPoint);
      final response = await _apiServices.get(endPoint: endPoint);

      final quizResponse = QuizResponseModel.fromJson(response);

      if (quizResponse.responseCode == 0) {
        return Right(quizResponse.results);
      } else {
        return Left(
          ServerFailure(
            'Failed to fetch quiz questions. Response code: ${quizResponse.responseCode}',
          ),
        );
      }
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: $e'));
    }
  }
}
