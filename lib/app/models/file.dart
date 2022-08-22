import 'dart:math';

import 'package:system_analysis_and_design_project/app/models/file_types.dart';
import 'package:system_analysis_and_design_project/app/models/library.dart';

class File {
  int id;
  String name;
  DateTime uploadedDate;
  Library? library;
  int size;
  FileType type;
  Map additionalInfos;
  bool isAttachment;
  bool hasAttachments;
  List attachments;
  bool isSharedWithMe;
  int? fatherId;

  File({
    required this.id,
    required this.name,
    required this.uploadedDate,
    this.library,
    required this.size,
    required this.type,
    required this.additionalInfos,
    required this.isAttachment,
    required this.hasAttachments,
    required this.attachments,
    required this.isSharedWithMe,
    this.fatherId,
  });

  static String formatBytes(int bytes, int decimals) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) +
        ' ' +
        suffixes[i];
  }

  static String getWOExtension(String fileName) {
    final length = fileName.length;
    final splits = fileName.split(".");
    return fileName.substring(0, length - splits[splits.length - 1].length - 1);
  }
}
