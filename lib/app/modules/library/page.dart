import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/files_list.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/title_text.dart';
import 'package:system_analysis_and_design_project/app/models/file_types.dart';
import 'package:system_analysis_and_design_project/app/models/library.dart';
import 'package:system_analysis_and_design_project/app/modules/library/controller.dart';

import '../../models/list_sort.dart';

class LibraryPage extends StatelessWidget {
  final Library library = Get.arguments as Library;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final MediaQueryData mq = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        // leading: Text("asdf"),
        bottom: PreferredSize(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                library.type.icon,
                size: 10,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                library.type.name,
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
          preferredSize: Size.zero,
        ),
        title: Text(
          library.name,
          style: TextStyle(
            color: Colors.white,
          ),
        ),

        centerTitle: true,
        backgroundColor: library.type.primaryColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TitleText(
                        text: "Files",
                        theme: theme,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                        ),
                        child: VerticalDivider(
                          thickness: 1,
                        ),
                      ),
                      Text(
                        library.files.length.toString() + " items",
                        style: TextStyle(
                          color: theme.primaryColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.sort_rounded,
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GetBuilder<LibrarySortController>(
                        init: LibrarySortController(),
                        builder: (controller) => DropdownButtonHideUnderline(
                          child: DropdownButton<ListSort>(
                            elevation: 2,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontFamily: 'Lato',
                            ),
                            items: ListSort.values
                                .map(
                                  (value) => DropdownMenuItem(
                                    child: Text(value.name),
                                    value: value,
                                  ),
                                )
                                .toList(),
                            onChanged: (value) =>
                                controller.changeListSort(value!),
                            iconSize: 0,
                            value: controller.sortListDropdownValue,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      SizedBox(
                        height: 15,
                        width: 15,
                        child: GetBuilder<LibrarySortController>(
                          init: LibrarySortController(),
                          builder: (controller) => IconButton(
                            padding: EdgeInsets.all(0),
                            splashRadius: 15,
                            iconSize: 15,
                            onPressed: () {
                              controller.changeSortDirection();
                            },
                            icon: Icon(
                              controller.sortAscending
                                  ? Icons.arrow_downward_rounded
                                  : Icons.arrow_upward_rounded,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          library.files.isEmpty
              ? Expanded(
                  child: Center(
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/svgs/no_file.svg',
                          height: mq.size.height * 0.3,
                          // width: mq.size.width * 0.5,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text("No File is in This Library.")
                      ],
                      mainAxisSize: MainAxisSize.min,
                    ),
                  ),
                )
              : FilesListView(
                  files: library.files,
                  mq: mq,
                  theme: theme,
                ),
        ],
      ),
    );
  }
}
