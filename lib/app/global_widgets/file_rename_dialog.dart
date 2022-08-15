import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/buttons.dart';
import 'package:system_analysis_and_design_project/app/models/file.dart';

class FileRenameDialog extends StatefulWidget {
  final Color buttonColor;
  final String fileName;
  const FileRenameDialog({
    Key? key,
    required this.buttonColor,
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
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FaIcon(
            FontAwesomeIcons.pen,
            size: 20,
            color: widget.buttonColor,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Rename File",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                "Enter new name for the file",
                style: TextStyle(fontSize: 13, color: Colors.grey),
              )
            ],
          ),
        ],
      ),
      alignment: Alignment.center,
      content: TextField(
        controller: _controller,
        focusNode: _focusNode,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "Cancel",
            style: TextStyle(
              color: Colors.red,
              fontSize: 12,
            ),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: widget.buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                7,
              ),
            ),
            // padding: EdgeInsets.all(),
          ),
          onPressed: () {},
          child: Text(
            "Rename",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        )
      ],
    );
  }
}
