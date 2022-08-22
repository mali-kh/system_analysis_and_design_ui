import 'package:dio/dio.dart';
import 'package:system_analysis_and_design_project/app/data/domain/model/client/content_client.dart';
import 'package:system_analysis_and_design_project/app/data/domain/model/request/content_requests.dart';
import 'package:system_analysis_and_design_project/app/data/domain/model/response/content_responses.dart';
import 'package:system_analysis_and_design_project/app/data/providers/api_provider.dart';
import 'dart:convert';

class ContentService {
  Dio _client = ContentClient().init();

  Future<AddLibraryResponse> addLibrary(AddLibraryRequest request) async {
    try {
      final Response response = await ApiProvider().post(
        _client,
        'library/',
        request.toJson(),
        authorization: true,
        showLoading: false,
      );
      return AddLibraryResponse.fromJson(response.data);
    } on DioError {
      rethrow;
    }
  }

  Future<LibrariesInfoResponse> getLibraries() async {
    try {
      final Response response = await ApiProvider().get(
        _client,
        'library/',
        authorization: true,
        showLoading: false,
      );
      return LibrariesInfoResponse.fromJson(response.data);
    } on DioError {
      rethrow;
    }
  }

  Future<FilesResponse> getFiles(Map<String, dynamic> parameters) async {
    try {
      final Response response = await ApiProvider().get(
        _client,
        'content/',
        authorization: true,
        showLoading: false,
        parameters: parameters,
      );
      return FilesResponse.fromJson(response.data);
    } on DioError {
      rethrow;
    }
  }

  Future<AddContentToLibraryResponse> addContentToLibrary(AddContentToLibraryRequest request) async {
    try {
      final Response response = await ApiProvider().post(
        _client,
        'add-content-to-library/',
        request.toJson(),
        authorization: true,
        showLoading: false,
      );
      return AddContentToLibraryResponse.fromJson(response.data);
    } on DioError {
      rethrow;
    }
  }

  Future<AddContentInfoResponse> addInfoToContent(AddInfoToContentRequest request) async {
    try {
      final Response response = await ApiProvider().put(
        _client,
        'edit-info-content/',
        request.toJson(),
        authorization: true,
        showLoading: false,
      );
      return AddContentInfoResponse.fromJson(response.data);
    } on DioError {
      rethrow;
    }
  }

  Future<dynamic> editContentName(EditContentNameRequest request) async {
    try {
      final Response response = await ApiProvider().put(
        _client,
        'content/',
        FormData.fromMap(json.decode(request.toJson())),
        authorization: true,
        showLoading: false,
      );
      return response.data;
    } on DioError {
      rethrow;
    }
  }

  Future<GrantPermissionResponse> grantPermissionContent(GrantPermissionContentRequest request) async {
    try {
      final Response response = await ApiProvider().post(
        _client,
        'grant-permission/',
        request.toJson(),
        authorization: true,
        showLoading: false,
      );
      return GrantPermissionResponse.fromJson(response.data);
    } on DioError {
      rethrow;
    }
  }

  ///delete template
// Future<dynamic> deleteAllOtherSessions(String sessionId) async {
//   try {
//     final Response response = await ApiProvider().delete(
//       _client,
//       'auth/users/sessions/current/all/$sessionId',
//       authorization: true,
//       showLoading: true,
//     );
//     return response.data;
//   } on DioError {
//     rethrow;
//   }
// }

  ///get template
// Future<dynamic> fetchUserData() async {
//   try {
//     final Response response = await ApiProvider().get(
//       _client,
//       'auth/users/current',
//       authorization: true,
//       showLoading: true,
//     );
//     // return response.data;
//     return UserDataResponse.fromJson(response.data);
//   } on DioError {
//     rethrow;
//   }
// }

  ///put template
// Future<UpdateProfileResponse> updateProfile(UpdateProfileRequest request) async {
//   try {
//     final Response response = await ApiProvider().put(
//       _client,
//       'auth/users/current',
//       request.toJson(),
//       authorization: true,
//       showLoading: true,
//     );
//     return UpdateProfileResponse.fromJson(response.data);
//   } on DioError {
//     rethrow;
//   }
// }
}
