import 'package:dio/dio.dart' as dio;

class ResponseHandler {
  static String errorResponse(dio.Response response) {
    String errorResponse = "";
    switch (response.statusCode) {
      case 400:
        errorResponse = "Sorry! invalid request";
        break;
      case 401:
        errorResponse = "Unauthorized user";
        break;
      case 403:
        errorResponse = "Sorry, we couldn't complete the request";
        break;
      case 404:
        errorResponse = "Sorry, we couldn't complete the request";
        break;
      case 406:
        errorResponse = "Sorry! the request isn't acceptable";
        break;
      case 500:
      case 503:
      case 504:
        errorResponse = "Sorry! we're having trouble loading data";
        break;
      case 502:
        errorResponse = "Sorry! we're encountered a temporary";
        break;
      default:
        errorResponse = "Sorry! unknown error occurred";
        break;
    }
    return errorResponse;
  }
}
