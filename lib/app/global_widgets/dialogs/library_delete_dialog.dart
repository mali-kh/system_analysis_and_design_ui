import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/dialogs/components/dialog_header.dart';

import 'components/dialog_cancel_button.dart';
import 'components/dialog_submit_button.dart';

class LibraryDeleteDialog extends StatelessWidget {
  const LibraryDeleteDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      title: DialogHeader(
        icon: FontAwesomeIcons.trashCan,
        title: "Delete Library",
        subtitle: "Are you sure you want to delete this library?",
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
