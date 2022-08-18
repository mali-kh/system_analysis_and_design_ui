import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:system_analysis_and_design_project/app/models/file.dart';

class FileListtileInfoText extends StatelessWidget {
  final int size;
  final DateTime uploadedDate;
  final ThemeData theme;
  const FileListtileInfoText({
    Key? key,
    required this.size,
    required this.uploadedDate,
    required this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      DateFormat.yMMMMd().format(uploadedDate) +
          " | " +
          File.formatBytes(size, 1),
      style: TextStyle(
        color: theme.primaryColor,
        fontWeight: FontWeight.w300,
        fontSize: 8.5,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}
