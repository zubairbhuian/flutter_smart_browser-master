import 'package:dio/dio.dart';
import 'package:smart_browser/common/api/api_url.dart';
import 'package:smart_browser/common/api/api_param.dart';
import 'package:smart_browser/common/api/error_handler.dart';

class ApiService {
  Dio? _dio;

  ApiService() {
    BaseOptions options = BaseOptions(
      baseUrl: urlBase,
      contentType: paramContentType,
      receiveTimeout: const Duration(minutes: 1),
      connectTimeout: const Duration(minutes: 1),
      responseType: ResponseType.plain,
    );
    _dio = Dio(options);
  }

  Future post(
    String endpoint,
    Map<String, dynamic> params, {
    required Function() beforeSend,
    required Function(dynamic data)? onSuccess,
    required Function(dynamic error)? onError,
  }) async {
    _dio!.options.headers[authorization] = "$bearer $secretKey";
    _dio!.post(endpoint, data: params).then((res) {
      if (onSuccess != null) onSuccess(res.data);
    }).catchError((error) {
      if (onError != null) onError(ErrorHandler.handleError(error));
    });
  }
}
