import 'dart:math' as math;

import 'package:dotted_border/dotted_border.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/custom_icons.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/list_tile/file_list_tile_info_text.dart';

import 'package:system_analysis_and_design_project/app/models/file.dart';
import 'package:system_analysis_and_design_project/app/models/file_types.dart';
import 'package:system_analysis_and_design_project/app/modules/home/controller.dart';
import 'package:get/get.dart';

import './file_list_tile_header.dart';

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
    final ThemeData theme = Theme.of(context);
    final MediaQueryData mq = MediaQuery.of(context);
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
        collapsed: Container(),
        expanded: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Container(
            // height: 100,

            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  widget.file.type.secondaryColor.withAlpha(150),
                  widget.file.type.secondaryColor.withAlpha(90),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: 40,
                top: 7,
                bottom: 7,
              ),
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  if (index == widget.file.attachments.length) {
                    return Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            HomePageController controller = Get.find();
                            controller.uploadAttachment(widget.file.id);
                          },
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            radius: Radius.circular(7),
                            padding: EdgeInsets.symmetric(
                              vertical: 3,
                              horizontal: 10,
                            ),
                            dashPattern: [3],
                            color: theme.primaryColor,
                            child: Icon(
                              Icons.add_rounded,
                              color: Colors.black,
                              // size: 10,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 13,
                        ),
                        Text(
                          "Add More Attachments...",
                          style: TextStyle(
                            color: theme.primaryColor,
                            fontSize: 13,
                          ),
                        )
                      ],
                    );
                  } else {
                    final file = widget.file.attachments.elementAt(index);
                    return Padding(
                      padding: const EdgeInsets.only(
                        right: 20,
                      ),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    7,
                                  ),
                                  color: Color(
                                    0xff92F99B,
                                  ).withAlpha(200),
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 11,
                                ),
                                child: Icon(
                                  CustomIcons.file_type,
                                  color: Color(0xff25B832),
                                  size: 23,
                                ),
                              ),
                              SizedBox(
                                width: 13,
                              ),
                              Column(
                                children: [
                                  Container(
                                    constraints: BoxConstraints(maxWidth: mq.size.width * 0.5),
                                    child: Text(
                                      file.name,
                                      style: TextStyle(
                                        color: theme.primaryColor,
                                        fontSize: 14,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  FileListtileInfoText(
                                    size: file.size,
                                    uploadedDate: file.uploadedDate,
                                    theme: theme,
                                  ),
                                ],
                                crossAxisAlignment: CrossAxisAlignment.start,
                              ),
                            ],
                          ),
                          GestureDetector(
                            child: Icon(
                              FontAwesomeIcons.trashCan,
                              size: 18,
                              color: Colors.red,
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                    );
                  }
                },
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: 30,
                      // right: 5,
                    ),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  );
                },
                itemCount: widget.file.attachments.length + 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
