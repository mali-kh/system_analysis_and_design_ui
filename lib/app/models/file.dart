import 'dart:math';

import 'package:system_analysis_and_design_project/app/models/file_types.dart';
import 'package:system_analysis_and_design_project/app/models/library.dart';

class File {
  String name;
  DateTime uploadedDate;
  Library? library;
  int size;
  FileType type;
  Map additionalInfos;

  File({
    required this.name,
    required this.uploadedDate,
    this.library,
    required this.size,
    required this.type,
    required this.additionalInfos,
  });

  static String formatBytes(int bytes, int decimals) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) +
        ' ' +
        suffixes[i];
  }
}
