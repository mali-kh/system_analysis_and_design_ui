import '../models/file_types.dart';
import '../models/library.dart';

final dummy_libraries = [
  Library(
    id: 1,
    name: "Uni Docs",
    type: FileType.DOCUMENT,
    numberOfItems: 12,
    size: 342,
    files: [],
  ),
  Library(
    id: 2,
    name: "New Codes",
    type: FileType.PROGRAMMING,
    numberOfItems: 12,
    size: 342,
    files: [],
  ),
  Library(
    id: 3,
    name: "My Images",
    type: FileType.IMAGE,
    numberOfItems: 12,
    size: 342,
    files: [],
  ),
  Library(
    id: 4,
    name: "Dummy Lib",
    type: FileType.AUDIO,
    numberOfItems: 12,
    size: 342,
    files: [],
  ),
];
