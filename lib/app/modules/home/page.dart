import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:system_analysis_and_design_project/app/controllers/files_controller.dart';
import 'dart:ui';
import 'dart:math' as math;

import 'package:system_analysis_and_design_project/app/controllers/libraries_controller.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/custom_icons.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/flie_list_tile.dart';
import 'package:system_analysis_and_design_project/app/global_widgets/title_text.dart';
import 'package:system_analysis_and_design_project/app/models/file_types.dart';
import 'package:system_analysis_and_design_project/app/models/list_sort.dart';
import 'package:system_analysis_and_design_project/app/modules/home/controllers/filter_contorller.dart';
import 'package:system_analysis_and_design_project/app/routes/routes.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _mq = MediaQuery.of(context);
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Stack(
          fit: StackFit.loose,
          children: [
            Positioned(
              child: SvgPicture.asset(
                'assets/svgs/raining_leaf.svg',
              ),
              top: -10,
              right: -10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: SafeArea(
                minimum: EdgeInsets.symmetric(
                    // horizontal: 15,
                    ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () => Get.toNamed(
                              Routes.PROFILE,
                            ),
                            child: Row(
                              children: [
                                Hero(
                                  tag: "Pic",
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'assets/images/sample_profile.jpg'),
                                    minRadius: _mq.size.width * 0.075,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: _mq.size.width * 0.2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Welcome,",
                                        textDirection: TextDirection.ltr,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: theme.primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17 * _mq.textScaleFactor,
                                        ),
                                        // maxLines: 1,
                                        // softWrap: true,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Satya",
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: theme.hintColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                              mainAxisSize: MainAxisSize.min,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: ClipRRect(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 4,
                                  sigmaY: 4,
                                ),
                                child: SizedBox(
                                  height: 35,
                                  child: TextField(
                                    style: TextStyle(
                                      height: 0.9,
                                    ),
                                    textAlign: TextAlign.left,
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: InputDecoration(
                                      fillColor:
                                          Color(0xffD1F5F0).withOpacity(0.5),
                                      filled: true,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      border: InputBorder.none,
                                      hintText: "Search Files, Libraries...",
                                      hintStyle: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 10,
                                      ),
                                      prefixIcon: Icon(
                                        Icons.search_rounded,
                                        size: 17,
                                        semanticLabel: "Search",
                                      ),
                                      isCollapsed: true,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Align(
                        child: TitleText(
                          text: "Your Libraries",
                          theme: theme,
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Stack(
                      children: [
                        SvgPicture.asset(
                          'assets/svgs/libraries_background.svg',
                          width: _mq.size.width,
                          color: Color(0xff5BC2AA),
                          height: 140,
                          fit: BoxFit.cover,
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              height: 105,
                              width: _mq.size.width,
                              child: RefreshIndicator(
                                onRefresh: () {
                                  print("hello");
                                  return Future.delayed(Duration(seconds: 2));
                                },
                                child: ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                    width: 10,
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  itemCount: dummy_libraries.length,
                                  shrinkWrap: true,
                                  itemBuilder: (_, idx) {
                                    return ClipRRect(
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
                                            color: dummy_libraries[idx]
                                                .type
                                                .secondaryColor
                                                .withOpacity(0.5),
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/svgs/folder_icon.svg',
                                                      height: 30,
                                                      color:
                                                          dummy_libraries[idx]
                                                              .type
                                                              .primaryColor,
                                                    ),
                                                    PopupMenuButton(
                                                      child: Icon(
                                                        Icons.more_vert,
                                                        size: 20,
                                                      ),
                                                      itemBuilder: (ctx) => [],
                                                    ),
                                                  ],
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    dummy_libraries[idx].name,
                                                    style: TextStyle(
                                                      color: theme.primaryColor,
                                                      fontSize: 15,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      dummy_libraries[idx]
                                                              .numberOfItems
                                                              .toString() +
                                                          " items",
                                                      style: TextStyle(
                                                        color:
                                                            theme.primaryColor,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontSize: 11,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 10),
                                                      child: Icon(
                                                        dummy_libraries[idx]
                                                            .type
                                                            .icon,
                                                        color:
                                                            dummy_libraries[idx]
                                                                .type
                                                                .primaryColor,
                                                        size: 10,
                                                      ),
                                                    )
                                                  ],
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  scrollDirection: Axis.horizontal,
                                  physics: BouncingScrollPhysics(),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: Row(
                        children: [
                          // Text(
                          //   "All Files",
                          //   style: TextStyle(
                          //     color: theme.primaryColor,
                          //     fontSize: 20,
                          //   ),
                          // ),
                          TitleText(
                            text: "All Files",
                            theme: theme,
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
                              GetBuilder<FilterController>(
                                init: FilterController(),
                                builder: (controller) =>
                                    DropdownButtonHideUnderline(
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
                                child: GetBuilder<FilterController>(
                                  init: FilterController(),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                    ),
                    // ExpansionTile(
                    //   title: Text("Hello"),
                    //   trailing: Icon(Icons.abc_rounded),
                    //   leading: Icon(Icons.ac_unit_sharp),
                    //   subtitle: Text("asdf"),
                    // ),
                    // ExpansionPanelList(
                    //   children: [
                    //     ExpansionPanel(
                    //       headerBuilder: (context, isExpanded) =>
                    //           Row(children: []),
                    //       body: Row(),
                    //       isExpanded: true,
                    //     ),
                    //   ],
                    // ),

                    Expanded(
                      child: ListView.separated(
                        itemCount: files_dummy.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => print("HSDF"),
                            behavior: HitTestBehavior.translucent,
                            child: FileListTile(
                              mq: _mq,
                              theme: theme,
                              file: files_dummy[index],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => Divider(),
                      ),
                    )
                    // ExpandablePanel(
                    //   // controller: ExpandableController(),
                    //   theme: ExpandableThemeData(
                    //       expandIcon: Icons.chevron_right,
                    //       iconRotationAngle: math.pi * 0.5,
                    //       animationDuration: Duration(milliseconds: 100),
                    //       headerAlignment:
                    //           ExpandablePanelHeaderAlignment.center,
                    //       tapBodyToExpand: false,
                    //       tapBodyToCollapse: true,
                    //       tapHeaderToExpand: false,
                    //       iconColor: theme.primaryColor,
                    //       iconPlacement: ExpandablePanelIconPlacement.right),
                    //   header: Padding(
                    //     padding: const EdgeInsets.only(
                    //       left: 10,
                    //     ),
                    //     child: Row(
                    //       children: [
                    //         Row(
                    //           children: [
                    //             ClipRRect(
                    //               borderRadius: BorderRadius.circular(5),
                    //               child: Container(
                    //                 decoration: BoxDecoration(
                    //                   color: Color(0xff66DCCC).withOpacity(0.5),
                    //                 ),
                    //                 height: 35,
                    //                 width: 35,
                    //                 child: Icon(
                    //                   CustomIcons.document,
                    //                   color: Color(0xff03967F),
                    //                   size: 20,
                    //                 ),
                    //               ),
                    //             ),
                    //             Padding(
                    //               padding: EdgeInsets.only(
                    //                 left: 8,
                    //               ),
                    //               child: Column(
                    //                 children: [
                    //                   Container(
                    //                     constraints: BoxConstraints(
                    //                         maxWidth: _mq.size.width * 0.5),
                    //                     child: Text(
                    //                       "SADFinal.docx",
                    //                       style: TextStyle(
                    //                         color: theme.primaryColor,
                    //                         fontSize: 14,
                    //                       ),
                    //                       overflow: TextOverflow.ellipsis,
                    //                     ),
                    //                   ),
                    //                   SizedBox(
                    //                     height: 3,
                    //                   ),
                    //                   Row(
                    //                     children: [
                    //                       Container(
                    //                         constraints: BoxConstraints(
                    //                             maxWidth: _mq.size.width * 0.3),
                    //                         child: Text(
                    //                           "2022, 05, 03 | 83.31 MB",
                    //                           style: TextStyle(
                    //                             color: theme.primaryColor,
                    //                             fontWeight: FontWeight.w300,
                    //                             fontSize: 8.5,
                    //                           ),
                    //                           overflow: TextOverflow.ellipsis,
                    //                         ),
                    //                       ),
                    //                       SizedBox(
                    //                         width: 5,
                    //                       ),
                    //                       ClipRRect(
                    //                         borderRadius:
                    //                             BorderRadius.circular(20),
                    //                         child: Container(
                    //                           decoration: BoxDecoration(
                    //                             color: theme.cardColor,
                    //                           ),
                    //                           child: Padding(
                    //                             padding:
                    //                                 const EdgeInsets.symmetric(
                    //                               horizontal: 5,
                    //                               // vertical: 1,
                    //                             ),
                    //                             child: Row(
                    //                               children: [
                    //                                 Icon(
                    //                                   Icons.group_outlined,
                    //                                   size: 13,
                    //                                 ),
                    //                                 SizedBox(
                    //                                   width: 2,
                    //                                 ),
                    //                                 Text(
                    //                                   "Shared With You",
                    //                                   style: TextStyle(
                    //                                     fontSize: 7.5,
                    //                                   ),
                    //                                 ),
                    //                               ],
                    //                             ),
                    //                           ),
                    //                         ),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ],
                    //                 crossAxisAlignment:
                    //                     CrossAxisAlignment.start,
                    //               ),
                    //             )
                    //           ],
                    //         ),
                    //         Row(
                    //           children: [
                    //             ClipRRect(
                    //               borderRadius: BorderRadius.circular(100),
                    //               child: Container(
                    //                 constraints: BoxConstraints(
                    //                   maxWidth: _mq.size.width * 0.2,
                    //                 ),
                    //                 decoration: BoxDecoration(
                    //                   color: Color(0xff66DCCC).withOpacity(0.5),
                    //                 ),
                    //                 padding: const EdgeInsets.symmetric(
                    //                   horizontal: 6.5,
                    //                   vertical: 3.5,
                    //                 ),
                    //                 child: Row(
                    //                   mainAxisSize: MainAxisSize.min,
                    //                   children: [
                    //                     Icon(
                    //                       CustomIcons.library_icon,
                    //                       color: Color(0xff03967F),
                    //                       size: 12.5,
                    //                     ),
                    //                     SizedBox(
                    //                       width: 6,
                    //                     ),
                    //                     Text(
                    //                       "Uni Docs",
                    //                       overflow: TextOverflow.ellipsis,
                    //                       style: TextStyle(fontSize: 9),
                    //                     ),
                    //                   ],
                    //                 ),
                    //                 // ),
                    //               ),
                    //             ),
                    //             GestureDetector(
                    //               onTap: () {},
                    //               child: Icon(
                    //                 Icons.more_vert,
                    //                 size: 20,
                    //                 color: theme.primaryColor,
                    //               ),
                    //             )
                    //           ],
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         ),
                    //       ],
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     ),
                    //   ),
                    //   collapsed: Container(),
                    //   expanded: Text(
                    //     "asdfasdf",
                    //     softWrap: true,
                    //   ),
                    // )
                  ],
                ),
              ),
            )
          ],
          alignment: Alignment.topRight,
          clipBehavior: Clip.hardEdge,
        ),
      ),
    );
  }
}
