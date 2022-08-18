import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/buttons.dart';
import 'package:system_analysis_and_design_project/app/models/file.dart';

import 'components/dialog_cancel_button.dart';
import 'components/dialog_header.dart';
import 'components/dialog_submit_button.dart';

class FileRenameDialog extends StatefulWidget {
  final String fileName;
  const FileRenameDialog({
    Key? key,
    required this.fileName,
  }) : super(key: key);

  @override
  State<FileRenameDialog> createState() => _FileRenameDialogState();
}

class _FileRenameDialogState extends State<FileRenameDialog> {
  late TextEditingController _controller;
  final _focusNode = FocusNode();
  initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.fileName,
    );
    _focusNode.requestFocus();
    // _controller.addListener(() {
    //   final newText = _controller.text.toLowerCase();
    //   _controller.value = _controller.value.copyWith(
    //     text: newText,
    //     selection: TextSelection(
    //         baseOffset: newText.length, extentOffset: newText.length),
    //     composing: TextRange.empty,
    //   );
    // });
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
      alignment: Alignment.center,
      content: TextField(
        controller: _controller,
        focusNode: _focusNode,
      ),
      actions: [
        DialogCancelButton(),
        DialogSubmitButton(
          onPressed: () {},
          text: "Rename",
          buttonColor: theme.primaryColor,
        ),
      ],
    );
  }
}
