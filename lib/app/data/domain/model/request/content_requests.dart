import 'dart:convert';

import 'package:system_analysis_and_design_project/app/data/domain/model/request/server_request_model.dart';
import 'package:system_analysis_and_design_project/app/models/file_types.dart';

class AddLibraryRequest implements ServerRequestModel {
  final String name;
  final FileType type;

  AddLibraryRequest(
    this.name,
    this.type,
  );

  @override
  String toJson() {
    return jsonEncode(<String, dynamic>{
      "name": this.name,
      "type": this.type.name.toLowerCase(),
    });
  }
}

class AddContentToLibraryRequest implements ServerRequestModel {
  final String libraryName;
  final int contentId;

  AddContentToLibraryRequest(
    this.libraryName,
    this.contentId,
  );

  @override
  String toJson() {
    return jsonEncode(<String, dynamic>{
      "library_name": this.libraryName,
      "content_id": this.contentId,
    });
  }
}

class AddInfoToContentRequest implements ServerRequestModel {
  final int id;
  final Map<String, String> info;

  AddInfoToContentRequest(
    this.id,
    this.info,
  );

  @override
  String toJson() {
    return jsonEncode(<String, dynamic>{
      "id": this.id,
      "info": json.encode(this.info),
    });
  }
}

class RemoveContentFromLibraryRequest implements ServerRequestModel {
  final int contentId;

  RemoveContentFromLibraryRequest(
    this.contentId,
  );

  @override
  String toJson() {
    return jsonEncode(<String, dynamic>{
      "content_id": this.contentId,
    });
  }
}

class GrantPermissionContentRequest implements ServerRequestModel {
  final String username;
  final int contentId;

  GrantPermissionContentRequest(
    this.username,
    this.contentId,
  );

  @override
  String toJson() {
    return jsonEncode(<String, dynamic>{
      "username": this.username,
      "content_id": this.contentId,
    });
  }
}

class GrantPermissionLibraryRequest implements ServerRequestModel {
  final String username;
  final int libraryName;

  GrantPermissionLibraryRequest(
    this.username,
    this.libraryName,
  );

  @override
  String toJson() {
    return jsonEncode(<String, dynamic>{
      "username": this.username,
      "library_name": this.libraryName,
    });
  }
}

class EditLibraryRequest implements ServerRequestModel {
  final int id;
  final String name;
  final FileType type;

  EditLibraryRequest(
    this.id,
    this.name,
    this.type,
  );

  @override
  String toJson() {
    return jsonEncode(<String, dynamic>{
      "id": this.id,
      "name": this.name,
      "type": this.type,
    });
  }
}

class EditContentNameRequest implements ServerRequestModel {
  final int id;
  final String name;

  EditContentNameRequest(
    this.id,
    this.name,
  );

  @override
  String toJson() {
    return jsonEncode(<String, dynamic>{
      "id": this.id,
      "name": this.name,
    });
  }
}
