import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/custom_icons.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/dialogs/components/dialog_cancel_button.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/dialogs/components/dialog_header.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/dialogs/components/dialog_submit_button.dart';
import 'package:system_analysis_and_design_project/app/models/file.dart';
import 'package:system_analysis_and_design_project/app/modules/home/controller.dart';

class AddInfoDialog extends StatefulWidget {
  final File file;
  const AddInfoDialog({Key? key,required this.file}) : super(key: key);

  @override
  State<AddInfoDialog> createState() => _AddInfoDialogState();
}

class _AddInfoDialogState extends State<AddInfoDialog> {
  final titleFocus = FocusNode();
  String title = '';
  String description = '';

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

  void submit() {
    HomePageController homePageController = Get.find();
    homePageController.addInfoToContent(widget.file.id ,title, description);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        //todo: fix the fucking alignment
        // alignment: Alignment.center,
        title: DialogHeader(
          icon: CustomIcons.info_i,
          title: "Add Info",
          subtitle: "Add a Name and Description for your additional information.",
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
                onChanged: (value) {
                  this.title = value;
                },
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
                onChanged: (value) {
                  this.description = value;
                },
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
        actions: [DialogCancelButton(), DialogSubmitButton(text: "Submit", buttonColor: theme.primaryColor, onPressed: submit)],
      ),
    );
  }
}
