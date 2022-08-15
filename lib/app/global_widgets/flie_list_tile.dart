import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import 'package:system_analysis_and_design_project/app/global_widgets/file_list_tile_header.dart';
import 'dart:math' as math;

import 'package:system_analysis_and_design_project/app/models/file.dart';

class FileListTile extends StatefulWidget {
  final MediaQueryData mq;
  final ThemeData theme;
  final File file;
  const FileListTile({
    required this.mq,
    required this.theme,
    required this.file,
  });

  @override
  State<FileListTile> createState() => _FileListTileState();
}

class _FileListTileState extends State<FileListTile> {
  late ExpandableController controller;
  @override
  void initState() {
    controller = ExpandableController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: ExpandablePanel(
        controller: controller,
        theme: ExpandableThemeData(
          expandIcon: Icons.chevron_right,
          iconRotationAngle: math.pi * 0.5,
          animationDuration: Duration(milliseconds: 100),
          headerAlignment: ExpandablePanelHeaderAlignment.center,
          tapBodyToExpand: false,
          tapBodyToCollapse: true,
          tapHeaderToExpand: false,

          hasIcon: false,
          // iconColor: theme.primaryColor,
          // iconPlacement: ExpandablePanelIconPlacement.right,
        ),
        header: FileListTileHeader(
          file: widget.file,
          mq: widget.mq,
          theme: widget.theme,
          controller: controller,
        ),
        collapsed: Container(
            // child: Text("jhasdf"),
            ),
        expanded: Text(
          "asdfasdf",
          softWrap: true,
        ),
      ),
    );
  }
}
