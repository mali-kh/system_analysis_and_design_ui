import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:dio/dio.dart';
import 'package:system_analysis_and_design_project/app/core/values/strings.dart';
import 'package:system_analysis_and_design_project/app/data/providers/storage_provider.dart';

class ApiProvider {
  ///customized get request
  Future<Response> get(
    Dio client,
    String endPoint, {
    bool showLoading = true,
    String contentType = 'application/json',
    bool authorization = true,
  }) async {
    try {
      if (showLoading) {
        EasyLoading.show(status: Strings.LOADING, maskType: EasyLoadingMaskType.black, dismissOnTap: true);
      }
      final Response response = await client.get(
        endPoint,
        options: Options(
          headers: await getHeaders(contentType, authorization),
        ),
      );
      return response;
    } on DioError catch (ex) {
      rethrow;
    } finally {
      if (showLoading) {
        EasyLoading.dismiss();
      }
    }
  }

  ///customized post request
  Future<Response> post(
    Dio client,
    String endPoint,
    dynamic body, {
    bool showLoading = true,
    String contentType = 'application/json',
    bool authorization = true,
  }) async {
    try {
      if (showLoading) {
        EasyLoading.show(status: Strings.LOADING, maskType: EasyLoadingMaskType.black, dismissOnTap: true);
      }
      final Response response = await client.post(
        endPoint,
        data: body,
        options: Options(
          headers: await getHeaders(contentType, authorization),
        ),
      );
      return response;
    } on DioError catch (ex) {
      rethrow;
    } finally {
      if (showLoading) {
        EasyLoading.dismiss();
      }
    }
  }

  ///customized get request
  Future<Response> delete(
    Dio client,
    String endPoint, {
    bool showLoading = true,
    String contentType = 'application/json',
    bool authorization = true,
  }) async {
    try {
      if (showLoading) {
        EasyLoading.show(status: Strings.LOADING, maskType: EasyLoadingMaskType.black, dismissOnTap: true);
      }
      final Response response = await client.delete(
        endPoint,
        options: Options(
          headers: await getHeaders(contentType, authorization),
        ),
      );
      return response;
    } on DioError catch (ex) {
      rethrow;
    } finally {
      if (showLoading) {
        EasyLoading.dismiss();
      }
    }
  }

  ///customized post request
  Future<Response> put(
    Dio client,
    String endPoint,
    dynamic body, {
    bool showLoading = true,
    String contentType = 'application/json',
    bool authorization = true,
  }) async {
    try {
      if (showLoading) {
        EasyLoading.show(status: Strings.LOADING, maskType: EasyLoadingMaskType.black, dismissOnTap: true);
      }
      final Response response = await client.put(
        endPoint,
        data: body,
        options: Options(
          headers: await getHeaders(contentType, authorization),
        ),
      );
      return response;
    } on DioError catch (ex) {
      rethrow;
    } finally {
      if (showLoading) {
        EasyLoading.dismiss();
      }
    }
  }

  ///get headers for requests
  Future<Map<String, String>> getHeaders(String contentType, bool authorization) async {
    Map<String, String> headers = {};
    headers['Content-Type'] = contentType;
    if (authorization) {
      String? accessToken = await StorageProvider.getAccessToken();
      headers['authorization'] = 'Bearer $accessToken';
    }
    return headers;
  }
}
