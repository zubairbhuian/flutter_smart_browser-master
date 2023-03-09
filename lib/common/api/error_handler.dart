import 'package:dio/dio.dart';
import 'package:smart_browser/common/api/response_handler.dart';

class ErrorHandler {
  static String handleError(dynamic error) {
    String errorDescription = "";

    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.cancel:
          errorDescription = "Sorry! the request to server was cancelled";
          break;
        case DioErrorType.connectionTimeout:
          errorDescription = "Sorry! the connection has timed out";
          break;
        case DioErrorType.badCertificate:
          errorDescription =
              "Sorry! info not synced. Turn on internet & refresh";
          break;
        case DioErrorType.badResponse:
          errorDescription = ResponseHandler.errorResponse(error.response!);
          break;
        case DioErrorType.connectionError:
          errorDescription =
              "Sorry! info not synced. Turn on internet & refresh";
          break;
        case DioErrorType.unknown:
          errorDescription = "Sorry! unknown error occurred";
          break;
        case DioErrorType.receiveTimeout:
          errorDescription = "Sorry! the connection has timed out";
          break;
        case DioErrorType.sendTimeout:
          errorDescription = "Sorry! the connection has timed out";
          break;
      }
    } else {
      errorDescription = "Sorry! unknown error occurred";
    }
    return errorDescription;
  }
}
