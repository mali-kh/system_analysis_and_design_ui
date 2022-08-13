import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../models/list_sort.dart';

class FilterController extends GetxController {
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
