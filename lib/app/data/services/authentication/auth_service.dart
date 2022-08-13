// import 'package:dio/dio.dart';
// import 'package:system_analysis_and_design_project/app/data/domain/model/client/auth_client.dart';
// import 'package:system_analysis_and_design_project/app/data/domain/model/request/auth_requests.dart';
// import 'package:system_analysis_and_design_project/app/data/domain/model/response/auth_reponses.dart';
// import 'package:system_analysis_and_design_project/app/data/providers/api_provider.dart';

// class AuthService {
//   Dio _client = AuthClient().init();

//   Future<CheckUsernameResponse> checkUsername(CheckUsernameRequest request) async {
//     try {
//       final Response response = await ApiProvider().post(
//         _client,
//         'check-username',
//         request.toJson(),
//         authorization: false,
//         showLoading: true,
//       );
//       return CheckUsernameResponse.fromJson(response.data);
//     } on DioError {
//       rethrow;
//     }
//   }

//   ///delete template
// // Future<dynamic> deleteAllOtherSessions(String sessionId) async {
// //   try {
// //     final Response response = await ApiProvider().delete(
// //       _client,
// //       'auth/users/sessions/current/all/$sessionId',
// //       authorization: true,
// //       showLoading: true,
// //     );
// //     return response.data;
// //   } on DioError {
// //     rethrow;
// //   }
// // }

//   ///get template
// // Future<dynamic> fetchUserData() async {
// //   try {
// //     final Response response = await ApiProvider().get(
// //       _client,
// //       'auth/users/current',
// //       authorization: true,
// //       showLoading: true,
// //     );
// //     // return response.data;
// //     return UserDataResponse.fromJson(response.data);
// //   } on DioError {
// //     rethrow;
// //   }
// // }

//   ///put template
// // Future<UpdateProfileResponse> updateProfile(UpdateProfileRequest request) async {
// //   try {
// //     final Response response = await ApiProvider().put(
// //       _client,
// //       'auth/users/current',
// //       request.toJson(),
// //       authorization: true,
// //       showLoading: true,
// //     );
// //     return UpdateProfileResponse.fromJson(response.data);
// //   } on DioError {
// //     rethrow;
// //   }
// // }
// }
