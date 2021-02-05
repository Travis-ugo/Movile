import 'package:dio/dio.dart';

class MovieException implements Exception {
  MovieException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.CANCEL:
        message = 'Request to API server was cancelled';
        break;
      case DioErrorType.CONNECT_TIMEOUT:
        message = "connection timeout with API server";
        break;
      case DioErrorType.SEND_TIMEOUT:
        message = 'send timeout in connection with API server';
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        message = "recieve timeout in connection with API server";
        break;
      case DioErrorType.RESPONSE:
        message = _handleError(dioError.response.statusCode);
        break;
      case DioErrorType.DEFAULT:
        message = "connection to API server failed due to internet connection";
        break;
      default:
        message = 'something went wrong';
        break;
    }
  }

  String message;

  String _handleError(int statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 404:
        return 'The request resource was not found';
      case 500:
        return 'Internet server error';
      default:
        return 'oops something went wrong';
    }
  }
}
