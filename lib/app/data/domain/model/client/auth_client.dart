import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:system_analysis_and_design_project/app/core/values/configs.dart';

class AuthClient {
  Dio init() {
    Dio _dio = Dio();
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
    _dio.options.connectTimeout = 60 * 1000;
    _dio.options.receiveTimeout = 60 * 1000;
    _dio.options.sendTimeout = 60 * 1000;
    _dio.options.baseUrl = Configs.getAuthUrl;
    return _dio;
  }
}

// class AppClientInterceptors extends Interceptor {
//   @override
//   Future<dynamic> onRequest(RequestOptions options) async {
//     // do something before request is sent
//   }
//
//   @override
//   Future<dynamic> onError(DioError dioError) {
//     // do something to error
//   }
//
//   @override
//   Future<dynamic> onResponse(Response response) async {
//     // do something before response
//   }
// }
