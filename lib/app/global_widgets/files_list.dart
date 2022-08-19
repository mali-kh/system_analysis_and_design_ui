import 'package:flutter/material.dart';

import 'list_tile/flie_list_tile.dart';

class FilesListView extends StatelessWidget {
  final List files;
  final MediaQueryData mq;
  final ThemeData theme;
  const FilesListView({
    Key? key,
    required this.files,
    required this.mq,
    required this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: files.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => print("Downloading file."),
            behavior: HitTestBehavior.translucent,
            child: FileListTile(
              mq: mq,
              theme: theme,
              file: files[index],
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(),
      ),
    );
  }
}
