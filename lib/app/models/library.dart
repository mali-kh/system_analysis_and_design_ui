import './file_types.dart';

class Library {
  int id;
  String name;
  FileType type;
  int numberOfItems;
  double size;
  List files;
  Library({
    required this.id,
    required this.name,
    required this.type,
    required this.numberOfItems,
    required this.size,
    required this.files,
  });
}
