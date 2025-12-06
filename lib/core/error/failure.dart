import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;
  const Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with api Server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout with api Server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout with apiS Server');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate with api Server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response?.statusCode ?? 100,
            dioException.response?.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to the api Server was canceld');
      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');
      case DioExceptionType.unknown:
        return ServerFailure('Unexpected Error, Please try again!');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if ([400, 401, 403].contains(statusCode)) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try again later');
    } else if (statusCode == 500) {
      return ServerFailure('Internal sever error, Please try again later');
    } else {
      return ServerFailure('Opps there was an Error, Please try again later');
    }
  }
}
