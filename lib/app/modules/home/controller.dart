import 'package:file_picker/file_picker.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as DD;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:system_analysis_and_design_project/app/core/values/configs.dart';
import 'package:system_analysis_and_design_project/app/core/values/strings.dart';
import 'package:system_analysis_and_design_project/app/data/domain/model/request/content_requests.dart';
import 'package:system_analysis_and_design_project/app/data/domain/model/response/auth_reponses.dart';
import 'package:system_analysis_and_design_project/app/data/domain/model/response/content_responses.dart';
import 'package:system_analysis_and_design_project/app/data/providers/storage_provider.dart';
import 'package:system_analysis_and_design_project/app/data/services/authentication/auth_service.dart';
import 'package:system_analysis_and_design_project/app/data/services/content/content_service.dart';
import 'package:system_analysis_and_design_project/app/models/file.dart';
import 'package:system_analysis_and_design_project/app/models/file_types.dart' as Custom;
import 'package:system_analysis_and_design_project/app/models/library.dart';

class HomePageController extends GetxController {
  RxList<Library> libraries = RxList();
  var files = [].obs;
  var username = ''.obs;
  var firstName = ''.obs;
  var lastName = ''.obs;

  @override
  void onInit() async {
    try {
      EasyLoading.show(status: Strings.LOADING, maskType: EasyLoadingMaskType.black, dismissOnTap: true);
      super.onInit();
      await getLibraries();
      await getAllFiles();
      await getUserInfo();
    } catch (e) {} finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> grantPermission(String username, int contentId) async {
    if (username.length > 0) {
      try {
        var response = await ContentService().grantPermissionContent(GrantPermissionContentRequest(username, contentId));
        if (response.code == "OK") {
          Get.back();
        }
      } catch (e) {
        print("tokhm fds");
      }
    }
  }

  Future<void> deleteContent(int id) async {
    try {
      DeleteContentResponse response = await ContentService().deleteContent(id);
      if (response.code == "Ok") {
        libraries.clear();
        await getLibraries();
        await getAllFiles();
        Get.back();
      }
    } catch (e) {
      print("tokhm Fdasfsd");
    }
  }

  Future<void> rename(int id, String name) async {
    if (name.length > 0) {
      try {
        var response = await ContentService().editContentName(EditContentNameRequest(id, name));
        if (response['code'] == "Ok") {
          libraries.clear();
          await getLibraries();
          await getAllFiles();
          Get.back();
        }
      } catch (e) {
        print("tokhm Fdasfsd");
      }
    }
  }

  Future<void> addContentToLibrary(String libraryName, int contentId) async {
    try {
      AddContentToLibraryResponse response = await ContentService().addContentToLibrary(AddContentToLibraryRequest(libraryName, contentId));
      if (response.code == "OK") {
        libraries.clear();
        await getLibraries();
        await getAllFiles();
        Get.back();
      }
    } catch (e) {
      print("tokhm khar");
    }
  }

  Future<void> addInfoToContent(int id, String title, String description) async {
    if (title.length > 0 && description.length > 0) {
      try {
        AddContentInfoResponse response = await ContentService().addInfoToContent(AddInfoToContentRequest(id, {title: description}));
        if (response.code == "OK") {
          Get.back();
          Get.back();
          await getAllFiles();
          //todo: do something like update or anything else
        }
      } catch (e) {
        print("tokhm khar");
      }
    }
  }

  Future<void> getUserInfo() async {
    try {
      GetUserInfoResponse response = await AuthService().getInfo();
      if (response.code == "OK") {
        firstName.value = response.info.firstName;
        username.value = response.info.username;
        lastName.value = response.info.lastName;
        //todo: do something like update or anything else
      }
    } catch (e) {
      print("tokhm khar");
    }
  }

  Future<void> getAllFiles() async {
    files.clear();
    await getFiles();
    await getSharedFiles();
  }

  Future<void> getSharedFiles() async {
    FilesResponse response = await ContentService().getSharedFiles();
    if (response.code == "OK") {
      for (Info file in response.info) {
        File temp = File(
          id: file.id,
          name: file.name,
          uploadedDate: file.dateCreated,
          size: file.fileSize,
          type: Custom.FileTypeTransform.fromString(file.typeCategory),
          additionalInfos: file.info,
          isAttachment: file.fatherContent == null ? false : true,
          hasAttachments: false,
          attachments: [],
          isSharedWithMe: true,
          libraryId: null,
          url: file.fileDownloadName,
        );
        this.files.add(temp);
      }
    }
  }

  Future<void> getFiles() async {
    try {
      FilesResponse response = await ContentService().getFiles({'all_content': true});

      if (response.code == "OK") {
        List<File> attachments = [];
        for (Info file in response.info) {
          File temp = File(
            id: file.id,
            name: file.name,
            uploadedDate: file.dateCreated,
            size: file.fileSize,
            type: Custom.FileTypeTransform.fromString(file.typeCategory),
            additionalInfos: file.info,
            isAttachment: file.fatherContent == null ? false : true,
            hasAttachments: file.hasAttachment,
            attachments: [],
            isSharedWithMe: false,
            libraryId: file.library,
            url: file.fileDownloadName,
          );
          if (file.fatherContent == null) {
            this.files.add(temp);
          } else {
            attachments.add(temp..fatherId = file.fatherContent);
          }
        }

        for (File attachment in attachments) {
          for (File notAttachment in this.files) {
            if (attachment.fatherId == notAttachment.id) {
              notAttachment.attachments.add(attachment);
            }
          }
        }

        for (File file in this.files) {
          for (Library library in this.libraries) {
            if (file.libraryId != null && file.libraryId == library.id) {
              library.files.add(file);
            }
          }
        }
        //todo: do something like update or anything else
      }
    } catch (e) {
      print(e);
      print("tokhm sag");
    }
  }

  Future<void> getLibraries() async {
    try {
      LibrariesInfoResponse response = await ContentService().getLibraries();
      if (response.code == "OK") {
        response.info.forEach((element) {
          this.libraries.add(
                Library(
                  id: element.id,
                  name: element.name,
                  type: Custom.FileTypeTransform.fromString(element.type),
                  numberOfItems: element.member,
                  size: 0,
                  files: [],
                  count: element.contentNumber
                ),
              );
        });
        //todo: do something like update or anything else
      }
    } catch (e) {
      print("fdsaofjdousajfidosjafds");
    }
  }

  void addLibrary(String name, Custom.FileType fileType) async {
    if (name.length > 0) {
      try {
        AddLibraryResponse response = await ContentService().addLibrary(AddLibraryRequest(name, fileType));
        if (response.code == "OK") {
          this.libraries.clear();
          await getLibraries();
          Get.back();
          //todo: do something like update or anything else
        }
      } catch (e) {}
    }
  }

  void uploadAttachment(int fatherContent) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.single.path != null) {
      try {
        EasyLoading.show(status: Strings.LOADING, maskType: EasyLoadingMaskType.black, dismissOnTap: true);
        DD.MultipartFile file = await DD.MultipartFile.fromFile(
          result.files.single.path!,
        );
        DD.FormData formData = DD.FormData.fromMap({
          'file': file,
          'father_content': fatherContent,
        });
        DD.Dio dio = DD.Dio();
        dio.interceptors.add(
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            error: true,
            compact: true,
            maxWidth: 90,
          ),
        );
        await dio.post(
          '${Configs.getContentUrl}content/',
          data: formData,
          options: DD.Options(
            headers: {
              'X-token': '${await StorageProvider.getAccessToken()}',
            },
            contentType: "multipart/form-data",
          ),
        );
        await getAllFiles();
      } catch (e) {
        print(e);
        e.printError();
      } finally {
        EasyLoading.dismiss();
      }
    }
  }

  void uploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.single.path != null) {
      try {
        EasyLoading.show(status: Strings.LOADING, maskType: EasyLoadingMaskType.black, dismissOnTap: true);
        DD.MultipartFile file = await DD.MultipartFile.fromFile(
          result.files.single.path!,
        );
        DD.FormData formData = DD.FormData.fromMap({
          'file': file,
        });
        DD.Dio dio = DD.Dio();
        dio.interceptors.add(
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            error: true,
            compact: true,
            maxWidth: 90,
          ),
        );
        await dio.post(
          '${Configs.getContentUrl}content/',
          data: formData,
          options: DD.Options(
            headers: {
              'X-token': '${await StorageProvider.getAccessToken()}',
            },
            contentType: "multipart/form-data",
          ),
        );
        await getAllFiles();
      } catch (e) {
        print(e);
        e.printError();
      } finally {
        EasyLoading.dismiss();
      }
    }
  }
}
