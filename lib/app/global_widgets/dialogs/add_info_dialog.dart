import 'package:flutter/material.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/custom_icons.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/dialogs/components/dialog_cancel_button.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/dialogs/components/dialog_header.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/dialogs/components/dialog_submit_button.dart';

class AddInfoDialog extends StatefulWidget {
  const AddInfoDialog({Key? key}) : super(key: key);

  @override
  State<AddInfoDialog> createState() => _AddInfoDialogState();
}

class _AddInfoDialogState extends State<AddInfoDialog> {
  final titleFocus = FocusNode();
  @override
  void initState() {
    titleFocus.requestFocus();

    super.initState();
  }

  @override
  void dispose() {
    titleFocus.dispose();
    super.dispose();
  }

  void submit() {}
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        title: DialogHeader(
          icon: CustomIcons.info_i,
          title: "Add Info",
          subtitle:
              "Add a Name and Description for your additional information.",
        ),
        content: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                focusNode: titleFocus,
                // style: TextStyle(
                //   height: 0.9,
                // ),
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                decoration: InputDecoration(
                  hintText: "Title",
                  fillColor: Colors.black,
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (value) => submit(),
                decoration: InputDecoration(
                  hintText: "Description",
                  fillColor: Colors.black,
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
        ),
        actions: [
          DialogCancelButton(),
          DialogSubmitButton(
              text: "Submit",
              buttonColor: theme.primaryColor,
              onPressed: submit)
        ],
      ),
    );
  }
}
