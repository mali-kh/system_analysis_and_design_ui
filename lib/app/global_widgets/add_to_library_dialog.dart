import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:system_analysis_and_design_project/app/controllers/add_to_library_controller.dart';

import 'package:system_analysis_and_design_project/app/controllers/libraries_controller.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/custom_icons.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/dialog_cancel_button.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/dialog_header.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/dialog_submit_button.dart';
import 'package:system_analysis_and_design_project/app/models/file_types.dart';

import '../models/library.dart';

class AddToLibraryDialog extends StatefulWidget {
  final FileType fileType;
  const AddToLibraryDialog({
    Key? key,
    required this.fileType,
  }) : super(key: key);

  @override
  State<AddToLibraryDialog> createState() => _AddToLibraryDialogState();
}

class _AddToLibraryDialogState extends State<AddToLibraryDialog> {
  List<Library> canBeChosenLibraries = [];
  bool doesHaveLibrariesToChoose = false;
  final controller = Get.put(AddToLibraryController());
  @override
  void initState() {
    canBeChosenLibraries =
        dummy_libraries.where((lib) => lib.type == widget.fileType).toList();
    if (canBeChosenLibraries.isNotEmpty) {
      doesHaveLibrariesToChoose = true;
      controller.changeSelectedLibrary(canBeChosenLibraries[0]);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mq = MediaQuery.of(context);
    final ThemeData theme = Theme.of(context);
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: DialogHeader(
        icon: CustomIcons.library_icon,
        title: "Add to Library",
        subtitle: "Select a Library to add the file.",
      ),
      alignment: Alignment.center,
      content: doesHaveLibrariesToChoose
          ? DropdownButtonHideUnderline(
              child: GetBuilder<AddToLibraryController>(
                builder: (controller) {
                  return DropdownButton<Library>(
                    items: canBeChosenLibraries.map((value) {
                      return DropdownMenuItem(
                        child: Text(value.name),
                        value: value,
                      );
                    }).toList(),
                    value: controller.selectedLibrary,
                    onChanged: (value) {
                      controller.changeSelectedLibrary(value!);
                    },
                  );
                },
              ),
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'There are no libraries to choose from :(',
                  maxLines: 1,
                  // minFontSize: 10,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.redAccent,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    primary: theme.primaryColor,
                  ),
                  onPressed: () {},
                  icon: Icon(
                    CustomIcons.library_icon,
                    size: 15,
                  ),
                  label: Text(
                    "Create Library",
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ],
            ),
      actions: [
        DialogCancelButton(),
        if (doesHaveLibrariesToChoose) DialogSubmitButton(text: "Add"),
      ],
    );
  }
}
