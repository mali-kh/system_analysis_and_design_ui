import 'package:system_analysis_and_design_project/app/models/file_types.dart';

class LibrariesInfoResponse {
  final List<dynamic> info;
  final String code;

  LibrariesInfoResponse(
    this.info,
    this.code,
  );

  static LibrariesInfoResponse fromJson(Map<String, dynamic> json) {
    return LibrariesInfoResponse(
      json['info'].map((library) => LibraryInfo.fromJson(library)).toList(),
      json['code'],
    );
  }
}

class LibraryFilesResponse {
  final List<dynamic> info;
  final String code;

  LibraryFilesResponse(
    this.info,
    this.code,
  );

  static LibraryFilesResponse fromJson(Map<String, dynamic> json) {
    return LibraryFilesResponse(
      json['info'].map((info) => Info.fromJson(info)).toList(),
      json['code'],
    );
  }
}

class GrantPermissionResponse {
  final String code;

  GrantPermissionResponse(this.code);

  static GrantPermissionResponse fromJson(Map<String, dynamic> json) {
    return GrantPermissionResponse(
      json['code'],
    );
  }
}

class FilesResponse {
  final List<dynamic> info;
  final String code;

  FilesResponse(
    this.info,
    this.code,
  );

  static FilesResponse fromJson(Map<String, dynamic> json) {
    return FilesResponse(
      json['info'].map((info) => Info.fromJson(info)).toList(),
      json['code'],
    );
  }
}

class AddContentToLibraryResponse {
  final String code;

  AddContentToLibraryResponse(this.code);

  static AddContentToLibraryResponse fromJson(Map<String, dynamic> json) {
    return AddContentToLibraryResponse(
      json['code'],
    );
  }
}

class RemoveContentFromLibraryResponse {
  final String code;

  RemoveContentFromLibraryResponse(this.code);

  static RemoveContentFromLibraryResponse fromJson(Map<String, dynamic> json) {
    return RemoveContentFromLibraryResponse(
      json['code'],
    );
  }
}

class AddContentResponse {
  final Info info;
  final String code;

  AddContentResponse(
    this.info,
    this.code,
  );

  static AddContentResponse fromJson(Map<String, dynamic> json) {
    return AddContentResponse(
      Info.fromJson(json['info']),
      json['code'],
    );
  }
}

class Info {
  final int id;
  final String name;
  final DateTime dateCreated;
  final String file;
  final Map<String, dynamic> info;
  final int member;
  final int type;
  final int? library;
  final int? fatherContent;
  final String fileDownloadName;
  final String typeCategory;
  final bool hasAttachment;

  Info(
    this.id,
    this.name,
    this.dateCreated,
    this.file,
    this.info,
    this.member,
    this.type,
    this.library,
    this.fatherContent,
    this.fileDownloadName,
    this.typeCategory,
    this.hasAttachment,
  );

  static Info fromJson(Map<String, dynamic> json) {
    return Info(
      json['id'],
      json['name'],
      DateTime.parse(json['date_created']),
      json['file'],
      json['info'],
      json['member'],
      json['type'],
      json['library'],
      json['father_content'],
      json['file_download_name'],
      json['type_category'],
      json['has_attachment'],
    );
  }
}

class AddLibraryResponse {
  final LibraryInfo library;
  final String code;

  AddLibraryResponse(
    this.library,
    this.code,
  );

  static AddLibraryResponse fromJson(Map<String, dynamic> json) {
    return AddLibraryResponse(
      LibraryInfo.fromJson(json['info']),
      json['code'],
    );
  }
}

class AddContentInfoResponse {
  final String code;

  AddContentInfoResponse(
    this.code,
  );

  static AddContentInfoResponse fromJson(Map<String, dynamic> json) {
    return AddContentInfoResponse(
      json['code'],
    );
  }
}

class LibraryInfo {
  final int id;
  final String name;
  final DateTime dateCreated;
  final String type;
  final int member;

  LibraryInfo(this.id, this.name, this.dateCreated, this.type, this.member);

  static LibraryInfo fromJson(Map<String, dynamic> json) {
    return LibraryInfo(
      json['id'],
      json['name'],
      DateTime.parse(json['date_created']),
      json['type'],
      json['member'],
    );
  }
}
