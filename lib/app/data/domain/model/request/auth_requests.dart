import 'dart:convert';

import 'package:system_analysis_and_design_project/app/data/domain/model/request/server_request_model.dart';

class CheckUsernameRequest implements ServerRequestModel {
  final String username;

  CheckUsernameRequest(
    this.username,
  );

  @override
  String toJson() {
    return jsonEncode(<String, dynamic>{
      "username": this.username,
    });
  }
}

class LoginRequest implements ServerRequestModel {
  final String username;
  final String password;

  LoginRequest(this.username, this.password,);

  @override
  String toJson() {
    return jsonEncode(<String, dynamic>{
      "username": this.username,
      "password": this.password,
    });
  }
}


