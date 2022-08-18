import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/add_to_library_dialog.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/custom_icons.dart';
import 'package:system_analysis_and_design_project/app/models/file.dart';
import 'package:system_analysis_and_design_project/app/models/file_types.dart';
import 'package:system_analysis_and_design_project/app/modules/file_info/local_widgets/info_row.dart';
import 'package:dotted_border/dotted_border.dart';

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
                  "Sad Final.docx",
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
                                  );
                                },
                              );
                            },
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              radius: Radius.circular(12),
                              padding: EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 10),
                              dashPattern: [2],
                              color: theme.primaryColor,
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
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
                      shrinkWrap: true,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Container();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),

      // body: Column(
      //   children: [
      //     Stack(
      //       children: [
      //         Container(
      //           width: mq.size.width,
      //           height: mq.size.height * 0.1,
      //           decoration: BoxDecoration(
      //             color: theme.hintColor.withOpacity(0.6),
      //             borderRadius: BorderRadius.vertical(
      //               bottom: Radius.circular(20),
      //             ),
      //           ),
      //         ),
      //         ClipRRect(
      //           borderRadius: BorderRadius.vertical(
      //             bottom: Radius.circular(20),
      //           ),
      //           child: BackdropFilter(
      //             filter: ImageFilter.blur(
      //               sigmaX: 100,
      //               sigmaY: 100,
      //             ),
      //             child: Container(
      //               width: mq.size.width,
      //               height: mq.size.height * 0.1,
      //               decoration: BoxDecoration(
      //                 color: Colors.white.withOpacity(0.5),
      //                 // borderRadius: BorderRadius.vertical(
      //                 //   bottom: Radius.circular(30),
      //                 // ),
      //               ),
      //             ),
      //           ),
      //         ),
      //         Padding(
      //           padding: EdgeInsets.only(
      //             top: mq.size.height * 0.05,
      //           ),
      //           child: Stack(
      //             children: [
      //               Positioned(
      //                 left: 0,
      //                 child: Row(
      //                   children: [
      //                     Icon(
      //                       Icons.chevron_left,
      //                     ),
      //                     SizedBox(
      //                       width: 0,
      //                     ),
      //                     Text(
      //                       "Back",
      //                     ),
      //                   ],
      //                   mainAxisSize: MainAxisSize.min,
      //                 ),
      //               ),
      //               Align(
      //                 child: Text(
      //                   "Info",
      //                   style: TextStyle(
      //                     color: theme.primaryColor,
      //                     fontSize: 22,
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         )
      //       ],
      //     )
      //   ],
      // ),
    );
  }
}
