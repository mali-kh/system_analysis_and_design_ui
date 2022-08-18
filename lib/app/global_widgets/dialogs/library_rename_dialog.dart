import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'components/dialog_cancel_button.dart';
import 'components/dialog_header.dart';
import 'components/dialog_submit_button.dart';

class LibraryRenameDialog extends StatefulWidget {
  final String libraryName;
  const LibraryRenameDialog({
    Key? key,
    required this.libraryName,
  }) : super(key: key);

  @override
  State<LibraryRenameDialog> createState() => _LibraryRenameDialogState();
}

class _LibraryRenameDialogState extends State<LibraryRenameDialog> {
  late final _controller;
  final _focusNode = FocusNode();
  initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.libraryName,
    );
    _focusNode.requestFocus();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _controller.selection = TextSelection(
          baseOffset: 0,
          extentOffset: widget.libraryName.length,
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
          title: "Rename Library",
          subtitle: "Enter new name for the library"),
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
