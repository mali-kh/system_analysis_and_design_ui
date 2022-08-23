import 'dart:isolate';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:system_analysis_and_design_project/app/core/values/configs.dart';
import 'package:system_analysis_and_design_project/app/core/values/strings.dart';
import 'package:system_analysis_and_design_project/app/data/providers/storage_provider.dart';
import 'list_tile/flie_list_tile.dart';
import 'dart:io';

class FilesListView extends StatefulWidget {
  final List files;
  final MediaQueryData mq;
  final ThemeData theme;

  FilesListView(this.files, this.mq, this.theme);

  @override
  State<FilesListView> createState() => _FilesListViewState();
}

class _FilesListViewState extends State<FilesListView> {
  // final ReceivePort _port = ReceivePort();
  //
  // @override
  // void initState() {
  //   super.initState();
  //
  //   IsolateNameServer.registerPortWithName(_port.sendPort, 'downloader_send_port');
  //   _port.listen((dynamic data) {
  //     String id = data[0];
  //     DownloadTaskStatus status = data[1];
  //     int progress = data[2];
  //     setState(() {});
  //   });
  //
  //   FlutterDownloader.registerCallback(downloadCallback);
  // }
  //
  // @override
  // void dispose() {
  //   IsolateNameServer.removePortNameMapping('downloader_send_port');
  //   super.dispose();
  // }
  //
  // static void downloadCallback(String id, DownloadTaskStatus status, int progress) {
  //   final SendPort send = IsolateNameServer.lookupPortByName('downloader_send_port')!;
  //   send.send([id, status, progress]);
  // }
  //
  // void _download(String url) async {
  //   final externalDir = await getExternalStorageDirectory();
  //
  //   final id = await FlutterDownloader.enqueue(
  //     url: url,
  //     headers: {
  //       'X-token': (await StorageProvider.getAccessToken())!,
  //     },
  //     savedDir: externalDir!.path,
  //     showNotification: true,
  //     openFileFromNotification: false,
  //   );
  // }

  late String _localPath;
  late bool _permissionReady;
  late TargetPlatform? platform;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      platform = TargetPlatform.android;
    } else {
      platform = TargetPlatform.iOS;
    }
  }

  Future<bool> _checkPermission() async {
    if (platform == TargetPlatform.android) {
      final status = await Permission.storage.status;
      if (status != PermissionStatus.granted) {
        final result = await Permission.storage.request();
        if (result == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }

  Future<void> _prepareSaveDir() async {
    _localPath = (await _findLocalPath())!;

    print(_localPath);
    final savedDir = Directory(_localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }
  }

  Future<String?> _findLocalPath() async {
    if (platform == TargetPlatform.android) {
      return "/sdcard/download/";
    } else {
      var directory = await getApplicationDocumentsDirectory();
      return directory.path + Platform.pathSeparator + 'Download';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: widget.files.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              print("Downloading file.");
              print(widget.files[index].url);
              // _download(Configs.getBaseUrl + "download/" + widget.files[index].url);

              _permissionReady = await _checkPermission();
              if (_permissionReady) {
                await _prepareSaveDir();
                print("Downloading");
                try {
                  Dio dio = new Dio();
                  dio.options.headers["X-token"] = (await StorageProvider.getAccessToken())!;
                  EasyLoading.show(status: Strings.LOADING, maskType: EasyLoadingMaskType.black, dismissOnTap: false);
                  await dio.download(
                    Configs.getBaseUrl + "download/" + widget.files[index].url,
                    // _localPath + "/" + widget.files[index].url,
                    '/storage/emulated/0/Download/' + widget.files[index].url,
                  );
                  print("Download Completed.");
                  print(_localPath + "/" + widget.files[index].url);
                } catch (e) {
                  print("Download Failed.\n\n" + e.toString());
                } finally {
                  EasyLoading.dismiss();
                }
              }
            },
            behavior: HitTestBehavior.translucent,
            child: FileListTile(
              mq: widget.mq,
              theme: widget.theme,
              file: widget.files[index],
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(),
      ),
    );
  }
}
