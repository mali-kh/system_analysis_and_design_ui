enum ListSort { DATEUPLOADED, SIZE }

extension ListSortExtension on ListSort {
  String get name {
    switch (this) {
      case ListSort.DATEUPLOADED:
        return 'Date';
      case ListSort.SIZE:
        return 'Size';
      default:
        return 'Date';
    }
  }
}
