import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/custom_icons.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/dialogs/add_to_library_dialog.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/dialogs/delete_file_dialog.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/dialogs/share_file_dialog.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/file_bottom_sheet_item.dart';
import 'package:system_analysis_and_design_project/app/models/file.dart';
import 'package:system_analysis_and_design_project/app/models/file_types.dart';
import 'package:system_analysis_and_design_project/app/routes/routes.dart';

import '../dialogs/file_rename_dialog.dart';
import 'file_list_tile_info_text.dart';

class FileListTileMoreAction extends StatelessWidget {
  final ThemeData theme;
  final MediaQueryData mq;
  final File file;

  const FileListTileMoreAction({
    Key? key,
    required this.theme,
    required this.mq,
    required this.file,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  // color: theme.cardColor,
                  decoration: BoxDecoration(
                    color: theme.cardColor,
                    borderRadius: BorderRadiusDirectional.vertical(
                      top: Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      right: 15,
                      left: 15,
                      bottom: 8,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                file.type.icon,
                                color: file.type.primaryColor,
                                size: 18,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    file.name,
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  FileListtileInfoText(
                                    size: file.size,
                                    uploadedDate: file.uploadedDate,
                                    theme: theme,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        if (file.library != null)
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                CustomIcons.library_icon,
                                color: file.type.primaryColor,
                                size: 18,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                file.library!.name,
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              )
                            ],
                          ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        FileBottomSheetItem(
                          mq: mq,
                          icon: CustomIcons.info,
                          color: theme.primaryColor,
                          text: "Info",
                          onTap: () {
                            Navigator.pop(context);

                            Get.toNamed(
                              Routes.FILE_INFO,
                              arguments: file,
                            );
                          },
                        ),
                        FileBottomSheetItem(
                          mq: mq,
                          icon: CustomIcons.rename,
                          color: theme.primaryColor,
                          text: "Rename",
                          onTap: () {
                            Navigator.pop(context);
                            showDialog(
                              context: context,
                              builder: (context) {
                                return FileRenameDialog(
                                  fileName: file.name,
                                  file: file,
                                );
                              },
                            );
                          },
                        ),
                        FileBottomSheetItem(
                          mq: mq,
                          icon: CustomIcons.share,
                          color: theme.primaryColor,
                          text: "Share",
                          onTap: () {
                            Navigator.pop(context);
                            showDialog(
                              context: context,
                              builder: (context) => ShareDialog(file),
                            );
                          },
                        ),
                        FileBottomSheetItem(
                          mq: mq,
                          icon: CustomIcons.library_menu,
                          color: theme.primaryColor,
                          text: file.library != null
                              ? "Remove from Library"
                              : "Add to Library",
                          onTap: file.library != null
                              ? () {
                                  Navigator.pop(context);
                                  //TODO: remove from library
                                }
                              : () {
                                  Navigator.pop(context);
                                  showDialog(
                                    context: context,
                                    builder: (context) => AddToLibraryDialog(
                                      fileType: file.type,
                                      file: file,
                                    ),
                                  );
                                },
                        ),
                        FileBottomSheetItem(
                          mq: mq,
                          icon: CustomIcons.delete,
                          color: Colors.red,
                          text: "Delete File",
                          onTap: () {
                            Navigator.pop(context);
                            showDialog(
                              context: context,
                              builder: (context) => DeleteFileDialog(file.id),
                            );
                          },
                          hasDivider: false,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(10),
            ),
          ),
          isScrollControlled: true,
        );
      },
      child: Icon(
        Icons.more_vert,
        size: 20,
        color: theme.primaryColor,
      ),
    );
  }
}
