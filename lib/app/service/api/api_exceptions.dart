import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  String message = "";
  DioExceptions.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.cancel:
        message = ApiErrors.requestCanceled;
        break;
      case DioExceptionType.connectionTimeout:
        message = ApiErrors.connectionTimeout;
        break;
      case DioExceptionType.receiveTimeout:
        message = ApiErrors.receiveTimeout;
        break;
      case DioExceptionType.sendTimeout:
        message = ApiErrors.sendTimeout;
        break;
      case DioExceptionType.badResponse:
        message = _handleError(dioException.response!.statusCode!.toInt(), dioException.response!.data);
        break;
      case DioExceptionType.unknown:
        message = ApiErrors.connectionProblem;
        break;
      default:
        message = ApiErrors.somethingWrong;
        break;
    }
  }

  String _handleError(int statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return error['error'] ?? error["message"] ?? ApiErrors.badRequest;
      case 404:
        return error['error'] ?? error["message"] ?? ApiErrors.urlIncorrect;
      case 500:
        return error['error'] ?? error["message"] ?? ApiErrors.internalServerError;
      default:
        return error['error'] ?? error["message"] ?? ApiErrors.somethingWrong;
    }
  }

  @override
  String toString() => message;
}

class ApiErrors {
  /// API EXCEPTIONS
  static const String requestCanceled = "Request cancelled!";
  static const String connectionTimeout = "Connection timeout!";
  static const String receiveTimeout = "Receive timeout!";
  static const String sendTimeout = "Send timeout!";
  static const String connectionProblem = "Connection problem!";
  static const String somethingWrong = "Something went wrong!";
  static const String badRequest = "Bad request";
  static const String urlIncorrect = "Api Url Incorrect";
  static const String internalServerError = "Internal Server Error";
}
