import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/file_list_tile_icon.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/file_list_tile_info_text.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/file_list_tile_more_action.dart';

import 'package:system_analysis_and_design_project/app/global_widgets/library_chip.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/shared_with_you_chip.dart';
import 'package:system_analysis_and_design_project/app/models/file_types.dart';

import '../models/file.dart';

class FileListTileHeader extends StatelessWidget {
  final MediaQueryData mq;
  final ThemeData theme;
  final File file;
  final ExpandableController controller;
  const FileListTileHeader({
    required this.mq,
    required this.theme,
    required this.file,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 5,
      ),
      child: Row(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  decoration: BoxDecoration(
                    // color: Color(0xff66DCCC).withOpacity(0.5),
                    color: file.type.secondaryColor.withOpacity(0.5),
                  ),
                  height: 35,
                  width: 35,
                  child: Icon(
                    file.type.icon,
                    color: file.type.primaryColor,
                    size: 18,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 8,
                ),
                child: Column(
                  children: [
                    Container(
                      constraints:
                          BoxConstraints(maxWidth: mq.size.width * 0.5),
                      child: Text(
                        file.name,
                        style: TextStyle(
                          color: theme.primaryColor,
                          fontSize: 14,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        Container(
                          constraints:
                              BoxConstraints(maxWidth: mq.size.width * 0.3),
                          child: FileListtileInfoText(
                            size: file.size,
                            uploadedDate: file.uploadedDate,
                            theme: theme,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        if (file.isSharedWithMe)
                          SharedWithYouChip(theme: theme),
                      ],
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              )
            ],
          ),
          Row(
            children: [
              if (file.library != null)
                LibraryChip(
                  mq: mq,
                  libraryName: file.library!.name,
                  type: file.library!.type,
                ),
              FileListTileMoreAction(
                theme: theme,
                mq: mq,
                file: file,
              ),
              FileListTileIcon(
                hasAttachments: file.hasAttachments,
                controller: controller,
                theme: theme,
              )
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
    );
  }
}
