import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/custom_icons.dart';
import 'dart:math' as math;

import 'package:system_analysis_and_design_project/app/models/file.dart';
import 'package:system_analysis_and_design_project/app/models/file_size_formatter.dart';
import 'package:system_analysis_and_design_project/app/models/file_types.dart';

class FileListTile extends StatelessWidget {
  final MediaQueryData mq;
  final ThemeData theme;
  final File file;
  const FileListTile({
    required this.mq,
    required this.theme,
    required this.file,
  });

  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      // controller: ExpandableController(),
      theme: ExpandableThemeData(
          expandIcon: Icons.chevron_right,
          iconRotationAngle: math.pi * 0.5,
          animationDuration: Duration(milliseconds: 100),
          headerAlignment: ExpandablePanelHeaderAlignment.center,
          tapBodyToExpand: false,
          tapBodyToCollapse: true,
          tapHeaderToExpand: false,
          iconColor: theme.primaryColor,
          iconPlacement: ExpandablePanelIconPlacement.right),
      header: Padding(
        padding: const EdgeInsets.only(
          left: 10,
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
                            child: Text(
                              DateFormat.yMMMMd().format(file.uploadedDate) +
                                  " | " +
                                  File.formatBytes(file.size, 1),
                              // file.uploadedDate
                              // "2022, 05, 03 | 83.31 MB",
                              style: TextStyle(
                                color: theme.primaryColor,
                                fontWeight: FontWeight.w300,
                                fontSize: 8.5,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              decoration: BoxDecoration(
                                color: theme.cardColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5,
                                  // vertical: 1,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.group_outlined,
                                      size: 13,
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      "Shared With You",
                                      style: TextStyle(
                                        fontSize: 7.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: mq.size.width * 0.2,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xff66DCCC).withOpacity(0.5),
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
                            color: Color(0xff03967F),
                            size: 12.5,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "Uni Docs",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 9),
                          ),
                        ],
                      ),
                      // ),
                    ),
                  ),
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.more_vert,
                    size: 20,
                    color: theme.primaryColor,
                  ),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
      ),
      collapsed: Container(),
      expanded: Text(
        "asdfasdf",
        softWrap: true,
      ),
    );
  }
}
