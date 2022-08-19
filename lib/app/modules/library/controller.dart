import 'package:get/get.dart';

import '../../models/list_sort.dart';

class LibrarySortController extends GetxController {
  var sortListDropdownValue = ListSort.DATEUPLOADED;
  bool sortAscending = true;

  void changeListSort(ListSort newValue) {
    sortListDropdownValue = newValue;
    update();
  }

  void changeSortDirection() {
    sortAscending = !sortAscending;
    update();
  }
}
