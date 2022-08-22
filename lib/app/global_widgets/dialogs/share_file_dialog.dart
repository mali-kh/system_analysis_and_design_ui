import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/dialogs/components/dialog_cancel_button.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/dialogs/components/dialog_header.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/dialogs/components/dialog_submit_button.dart';
import 'package:system_analysis_and_design_project/app/models/file.dart';
import 'package:system_analysis_and_design_project/app/modules/home/controller.dart';

class ShareDialog extends StatefulWidget {
  final File file;

  ShareDialog(this.file);

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

  String username = '';

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      //todo: fix the fucking alignment
      // alignment: Alignment.center,
      title: DialogHeader(
        icon: FontAwesomeIcons.shareNodes,
        title: "Share File",
        subtitle: "Enter the destination user's email address to share the file with them.",
      ),
      content: TextField(
          onChanged: (value) {
            username = value;
          },
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
          onPressed: () {
            HomePageController homePageController = Get.find();
            homePageController.grantPermission(username, widget.file.id);
          },
        ),
      ],
    );
  }
}
