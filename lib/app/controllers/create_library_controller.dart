import 'package:get/get.dart';
import 'package:system_analysis_and_design_project/app/models/file_types.dart';

class CreateLibraryController extends GetxController {
  late FileType selectedFileType;
  void initializeFileType() {
    selectedFileType = FileType.values.elementAt(0);
    update();
  }

  void changeSelectedFileType(FileType fileType) {
    selectedFileType = fileType;
    update();
  }
}
