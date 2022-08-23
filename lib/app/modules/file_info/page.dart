import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/custom_icons.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/dialogs/add_info_dialog.dart';
import 'package:system_analysis_and_design_project/app/models/file.dart';
import 'package:system_analysis_and_design_project/app/models/file_types.dart';
import 'package:system_analysis_and_design_project/app/modules/file_info/local_widgets/info_row.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../global_widgets/dialogs/add_to_library_dialog.dart';

class FileInfoPage extends StatelessWidget {
  final File file = Get.arguments as File;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mq = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => Navigator.pop(context),
          child: Row(
            children: [
              Icon(
                Icons.chevron_left,
                color: Colors.white,
              ),
              Text(
                "Back",
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        title: Text(
          "Info",
          style: TextStyle(
            color: theme.cardColor,
          ),
        ),
        backgroundColor: theme.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Icon(
                CustomIcons.document,
                color: FileType.DOCUMENT.primaryColor,
                size: 50,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: AutoSizeText(
                  file.name,
                  maxLines: 1,
                  minFontSize: 10,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: theme.primaryColor,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: mq.size.width * 0.1),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: theme.cardColor,
                ),
                padding: EdgeInsets.symmetric(horizontal: 17, vertical: 10),
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    InfoRow(
                      color: theme.primaryColor,
                      icon: CustomIcons.size_box,
                      title: "Size",
                      description: File.formatBytes(
                        file.size,
                        1,
                      ),
                    ),
                    InfoRow(
                      color: theme.primaryColor,
                      icon: CustomIcons.date,
                      title: "Date Added",
                      description: DateFormat.yMMMMd().format(
                        file.uploadedDate,
                      ),
                    ),
                    InfoRow(
                      color: theme.primaryColor,
                      icon: CustomIcons.file_type,
                      title: "Type",
                      description: file.type.name,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                CustomIcons.library_icon,
                                size: 18,
                                color: theme.primaryColor,
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                "Library",
                                style: TextStyle(
                                  color: theme.primaryColor,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AddToLibraryDialog(
                                    fileType: file.type,
                                    file: file,
                                  );
                                },
                              );
                            },
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              radius: Radius.circular(12),
                              padding: EdgeInsets.symmetric(
                                vertical: 3,
                                horizontal: 10,
                              ),
                              dashPattern: [2],
                              color: theme.primaryColor,
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.add_rounded,
                                      size: 15,
                                      color: theme.primaryColor,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Add to Library",
                                      style: TextStyle(
                                        fontSize: 9,
                                        color: theme.primaryColor,
                                      ),
                                    )
                                  ],
                                  mainAxisSize: MainAxisSize.min,
                                ),
                                // child: Container(
                                //   width: 100,
                                //   child: IntrinsicHeight(
                                //     child: Stack(
                                //       children: [
                                //         Positioned(
                                //           left: 0,
                                //           child: Icon(
                                //             Icons.add_rounded,
                                //             size: 15,
                                //             color: theme.primaryColor,
                                //           ),
                                //         ),
                                //         Align(
                                //           child: Text(
                                //             'Add to Library',
                                //             style: TextStyle(fontSize: 10),
                                //           ),
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  shrinkWrap: true,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: mq.size.width * 0.1,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: theme.cardColor,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 17,
                  vertical: 17,
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          CustomIcons.info,
                          size: 20,
                          color: theme.primaryColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Additional Info",
                          style: TextStyle(
                            color: theme.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: file.additionalInfos.length,
                      itemBuilder: (context, index) {
                        return InfoRow(
                          color: theme.primaryColor,
                          //todo: fix this little shit (original was abc)
                          icon: Icons.adb,
                          title: file.additionalInfos.keys.elementAt(index),
                          description: file.additionalInfos.values.elementAt(index),
                          hasIcon: false,
                        );
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AddInfoDialog(
                              file: file,
                            );
                          },
                        );
                      },
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: Radius.circular(12),
                        padding: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          bottom: 5,
                          top: 3,
                        ),
                        dashPattern: [2],
                        color: theme.primaryColor,
                        child: IntrinsicHeight(
                          child: Stack(
                            children: [
                              Positioned.fill(
                                left: 0,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Icon(
                                    Icons.add_rounded,
                                    size: 15,
                                    color: theme.primaryColor,
                                  ),
                                ),
                              ),
                              Align(
                                child: Text(
                                  'Add info',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
    );
  }
}
