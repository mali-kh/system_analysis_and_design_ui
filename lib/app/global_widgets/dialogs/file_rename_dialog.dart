import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/buttons.dart';
import 'package:system_analysis_and_design_project/app/models/file.dart';
import 'package:system_analysis_and_design_project/app/models/file_types.dart';
import 'package:system_analysis_and_design_project/app/modules/home/controller.dart';

import 'components/dialog_cancel_button.dart';
import 'components/dialog_header.dart';
import 'components/dialog_submit_button.dart';

class FileRenameDialog extends StatefulWidget {
  final String fileName;
  final File file;

  const FileRenameDialog({
    Key? key,
    required this.fileName,
    required this.file,
  }) : super(key: key);

  @override
  State<FileRenameDialog> createState() => _FileRenameDialogState();
}

class _FileRenameDialogState extends State<FileRenameDialog> {
  late TextEditingController _controller;
  final _focusNode = FocusNode();
  String newName = '';

  initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.fileName,
    );
    _focusNode.requestFocus();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _controller.selection = TextSelection(
          baseOffset: 0,
          extentOffset: File.getWOExtension(widget.fileName).length,
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: DialogHeader(
          // iconColor: theme.primaryColor,
          icon: FontAwesomeIcons.pen,
          title: "Rename File",
          subtitle: "Enter new name for the file"),
      //todo: fix the fucking alignment
      // alignment: Alignment.center,
      content: TextField(
        onChanged: (value) {
          newName = value;
        },
        controller: _controller,
        focusNode: _focusNode,
      ),
      actions: [
        DialogCancelButton(),
        DialogSubmitButton(
          onPressed: () {
            // String reversedName = widget.fileName.split("").reversed.join("");
            // String extension = reversedName.split("\.")[0];
            // extension = extension.split("").reversed.join("");
            HomePageController controller = Get.find();
            controller.rename(widget.file.id, newName);
          },
          text: "Rename",
          buttonColor: theme.primaryColor,
        ),
      ],
    );
  }
}
