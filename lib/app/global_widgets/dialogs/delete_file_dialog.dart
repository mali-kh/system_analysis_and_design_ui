import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/dialogs/components/dialog_cancel_button.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/dialogs/components/dialog_header.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/dialogs/components/dialog_submit_button.dart';

class DeleteFileDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      title: DialogHeader(
        icon: FontAwesomeIcons.trashCan,
        title: "Delete File",
        subtitle: "Are you sure you want to delete this file?",
      ),
      actions: [
        DialogCancelButton(),
        DialogSubmitButton(
          onPressed: () {},
          text: "Delete",
          buttonColor: Colors.red,
        )
      ],
    );
  }
}
