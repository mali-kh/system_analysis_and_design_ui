import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/dialogs/components/dialog_cancel_button.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/dialogs/components/dialog_header.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/dialogs/components/dialog_submit_button.dart';

class ShareDialog extends StatefulWidget {
  @override
  State<ShareDialog> createState() => _ShareDialogState();
}

class _ShareDialogState extends State<ShareDialog> {
  late TextEditingController _controller = TextEditingController();
  final _focusNode = FocusNode();
  initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      title: DialogHeader(
        icon: FontAwesomeIcons.shareNodes,
        title: "Share File",
        subtitle:
            "Enter the destination user's email address to share the file with them.",
      ),
      content: TextField(
          controller: _controller,
          focusNode: _focusNode,
          maxLines: 1,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
              icon: Icon(
            Icons.person,
          ))),
      actions: [
        DialogCancelButton(),
        DialogSubmitButton(
          text: "Share",
          buttonColor: theme.primaryColor,
          onPressed: () {},
        ),
      ],
    );
  }
}
