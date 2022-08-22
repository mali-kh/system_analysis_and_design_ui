import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:system_analysis_and_design_project/app/controllers/create_library_controller.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/custom_icons.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/dialogs/components/dialog_cancel_button.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/dialogs/components/dialog_header.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/dialogs/components/dialog_submit_button.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/file_type_container.dart';
import 'package:system_analysis_and_design_project/app/models/file_types.dart';
import 'package:system_analysis_and_design_project/app/modules/home/controller.dart';

class CreateLibraryDialog extends StatefulWidget {
  @override
  State<CreateLibraryDialog> createState() => _CreateLibraryDialogState();
}

class _CreateLibraryDialogState extends State<CreateLibraryDialog> {
  final focusNode = FocusNode();
  final textEditingController = TextEditingController();
  final controller = Get.put(CreateLibraryController());
  HomePageController homePageController = Get.find();
  String name = '';

  @override
  void initState() {
    controller.initializeFileType();
    focusNode.requestFocus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final MediaQueryData mq = MediaQuery.of(context);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        //todo: fix the fucking alignment
        // alignment: Alignment.center,
        title: DialogHeader(
          icon: CustomIcons.library_icon,
          title: "Create Library",
          subtitle: "Choose your new library's name and type",
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              onChanged: (value) {
                name = value;
              },
              focusNode: focusNode,
              keyboardType: TextInputType.name,
              controller: textEditingController,
              decoration: InputDecoration(
                hintText: "Name",
                fillColor: Colors.black,
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 80,
              width: mq.size.width,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  width: 10,
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                itemCount: FileType.values.length,
                shrinkWrap: true,
                itemBuilder: (_, idx) {
                  final fileType = FileType.values.elementAt(idx);
                  return GetBuilder<CreateLibraryController>(
                    builder: (controller) {
                      return GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () => controller.changeSelectedFileType(fileType),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                              width: 1.5,
                              style: controller.selectedFileType == fileType ? BorderStyle.solid : BorderStyle.none,
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: SizedBox(
                            width: 70,
                            child: Column(
                              children: [
                                FileTypeContainer(
                                  fileType: fileType,
                                  backgroundSize: 45,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                AutoSizeText(
                                  fileType.name,
                                  style: TextStyle(fontSize: 11),
                                  maxFontSize: 12,
                                  minFontSize: 5,
                                  maxLines: 1,
                                ),
                              ],
                              mainAxisSize: MainAxisSize.min,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
              ),
            ),
          ],
        ),
        actions: [
          DialogCancelButton(),
          DialogSubmitButton(
            text: "Create",
            buttonColor: theme.primaryColor,
            onPressed: () {
              homePageController.addLibrary(name, controller.selectedFileType);
              //TODO: create library
            },
          ),
        ],
      ),
    );
  }
}
