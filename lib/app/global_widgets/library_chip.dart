import 'package:flutter/material.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/custom_icons.dart';
import 'package:system_analysis_and_design_project/app/models/file_types.dart';

class LibraryChip extends StatelessWidget {
  final MediaQueryData mq;
  final String libraryName;
  final FileType type;

  const LibraryChip({
    Key? key,
    required this.mq,
    required this.libraryName,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: mq.size.width * 0.2,
        ),
        decoration: BoxDecoration(
          color: type.secondaryColor.withOpacity(0.5),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 6.5,
          vertical: 3.5,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              CustomIcons.library_icon,
              color: type.primaryColor,
              size: 12,
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              libraryName,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 8),
            ),
          ],
        ),
        // ),
      ),
    );
  }
}
