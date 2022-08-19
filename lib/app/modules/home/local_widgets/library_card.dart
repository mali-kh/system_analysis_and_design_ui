import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:system_analysis_and_design_project/app/data/domain/enumeration/library_actions.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/dialogs/library_delete_dialog.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/dialogs/library_rename_dialog.dart';
import 'package:system_analysis_and_design_project/app/models/file_types.dart';
import 'package:system_analysis_and_design_project/app/routes/routes.dart';

import '../../../models/library.dart';

class LibraryCard extends StatelessWidget {
  final Library library;
  final ThemeData theme;

  const LibraryCard({
    Key? key,
    required this.library,
    required this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.LIBRARY, arguments: library),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          8,
        ),
        child: BackdropFilter(
          filter: new ImageFilter.blur(
            sigmaX: 1.7,
            sigmaY: 1.7,
          ),
          child: Container(
            decoration: new BoxDecoration(
              color: library.type.secondaryColor.withOpacity(0.5),
            ),
            width: 140,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 10,
                bottom: 10,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/folder_icon.svg',
                        height: 30,
                        color: library.type.primaryColor,
                      ),
                      PopupMenuButton<LibraryAction>(
                        child: Icon(
                          Icons.more_vert,
                          size: 20,
                        ),
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        itemBuilder: (ctx) => [
                          PopupMenuItem<LibraryAction>(
                            value: LibraryAction.RENAME,
                            onTap: () {
                              Future.delayed(
                                const Duration(seconds: 0),
                                () => showDialog(
                                  context: context,
                                  builder: (context) => LibraryRenameDialog(
                                    libraryName: library.name,
                                  ),
                                ),
                              );
                            },
                            padding: EdgeInsets.only(bottom: 10),
                            height: 30,
                            child: Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.pen,
                                    size: 13,
                                  ),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                    "Rename",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              ),
                            ),
                          ),
                          PopupMenuItem<LibraryAction>(
                            value: LibraryAction.DELETE,
                            // padding: EdgeInsets.symmetric(vertical: 10),
                            onTap: () {
                              Future.delayed(
                                const Duration(seconds: 0),
                                () => showDialog(
                                  context: context,
                                  builder: (context) =>
                                      const LibraryDeleteDialog(),
                                ),
                              );
                            },
                            height: 10,
                            child: Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.trashCan,
                                    size: 13,
                                  ),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                    "Delete",
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      library.name,
                      style: TextStyle(
                        color: theme.primaryColor,
                        fontSize: 15,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        library.numberOfItems.toString() + " items",
                        style: TextStyle(
                          color: theme.primaryColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 11,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          library.type.icon,
                          color: library.type.primaryColor,
                          size: 10,
                        ),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
