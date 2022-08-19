import 'package:flutter/material.dart';

import 'package:system_analysis_and_design_project/app/models/file_types.dart';

class FileTypeContainer extends StatelessWidget {
  final FileType fileType;
  final double backgroundSize;
  final double iconSize;
  const FileTypeContainer({
    Key? key,
    required this.fileType,
    this.backgroundSize = 35,
    this.iconSize = 18,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        decoration: BoxDecoration(
          color: fileType.secondaryColor.withOpacity(0.5),
        ),
        height: backgroundSize,
        width: backgroundSize,
        child: Icon(
          fileType.icon,
          color: fileType.primaryColor,
          size: iconSize,
        ),
      ),
    );
  }
}
