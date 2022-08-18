import 'package:get/get.dart';

import '../models/library.dart';

class AddToLibraryController extends GetxController {
  late Library selectedLibrary;
  List<Library> libraries = [];

  void changeSelectedLibrary(Library library) {
    selectedLibrary = library;
    update();
  }
}
