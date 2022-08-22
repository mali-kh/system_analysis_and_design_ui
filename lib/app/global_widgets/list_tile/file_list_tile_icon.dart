import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:system_analysis_and_design_project/app/modules/home/controller.dart';

class FileListTileIcon extends StatefulWidget {
  final bool hasAttachments;
  final ExpandableController controller;
  final ThemeData theme;
  final int id;
  const FileListTileIcon({
    Key? key,
    required this.hasAttachments,
    required this.controller,
    required this.theme,
    required this.id,
  }) : super(key: key);

  @override
  State<FileListTileIcon> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<FileListTileIcon> {
  @override
  Widget build(BuildContext context) {
    return widget.hasAttachments
        ? AnimatedSwitcher(
            duration: Duration(milliseconds: 100),
            child: !widget.controller.expanded
                ? GestureDetector(
                    onTap: () {
                      print("alan${widget.controller.expanded}");
                      widget.controller.toggle();
                      setState(() {});
                      print("hala${widget.controller.expanded}");
                    },
                    child: Icon(
                      Icons.chevron_right,
                      size: 20,
                      color: widget.theme.primaryColor,
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      widget.controller.toggle();
                      setState(() {});
                    },
                    child: Icon(
                      Icons.expand_more,
                      size: 20,
                      color: widget.theme.primaryColor,
                    ),
                  ),
          )
        : GestureDetector(
            onTap: () {
              HomePageController controller = Get.find();
              controller.uploadAttachment(widget.id);
            },
            child: Icon(
              Icons.attach_file,
              size: 20,
              color: widget.theme.primaryColor,
            ),
          );
  }
}
