import 'package:flutter/widgets.dart';
import '../global_widgets/custom_icons.dart';

enum FileType {
  VIDEO,
  IMAGE,
  AUDIO,
  DOCUMENT,
  PROGRAMMING,
  EXECUTABLE,
  COMPRESSED,
}

extension FileExtension on FileType {
  String get name {
    switch (this) {
      case FileType.VIDEO:
        return 'Video';
      case FileType.IMAGE:
        return 'Image';
      case FileType.AUDIO:
        return 'Audio';
      case FileType.DOCUMENT:
        return 'Document';
      case FileType.PROGRAMMING:
        return 'Programming';
      case FileType.EXECUTABLE:
        return 'Executable';
      case FileType.COMPRESSED:
        return 'compressed';
      default:
        return '';
    }
  }

  Color get primaryColor {
    switch (this) {
      case FileType.DOCUMENT:
        return Color(0xff03967F);
      case FileType.IMAGE:
        return Color(0xffD90F0F);
      case FileType.PROGRAMMING:
        return Color(0xffFBAD16);
      case FileType.AUDIO:
        return Color(0xff9033D6);
      case FileType.VIDEO:
        return Color(0xff0060FA);
      case FileType.COMPRESSED:
        return Color(0xff561603);
      case FileType.EXECUTABLE:
        return Color(0xff484163);
      default:
        return Color(0xff);
    }
  }

  Color get secondaryColor {
    switch (this) {
      case FileType.DOCUMENT:
        return Color(0xff66DCCC);
      case FileType.IMAGE:
        return Color(0xffF26E6E);
      case FileType.PROGRAMMING:
        return Color(0xffFFC85F);
      case FileType.AUDIO:
        return Color(0xffB859FF);
      case FileType.VIDEO:
        return Color(0xff629EFF);
      case FileType.COMPRESSED:
        return Color(0xffBC431F);
      case FileType.EXECUTABLE:
        return Color(0xff897EB5);
      default:
        return Color(0xff);
    }
  }

  IconData get icon {
    switch (this) {
      case FileType.DOCUMENT:
        return CustomIcons.document;
      case FileType.IMAGE:
        return CustomIcons.image;
      case FileType.PROGRAMMING:
        return CustomIcons.programming;
      case FileType.AUDIO:
        return CustomIcons.audio;
      case FileType.VIDEO:
        return CustomIcons.video;
      case FileType.COMPRESSED:
        return CustomIcons.compressed;
      case FileType.EXECUTABLE:
        return CustomIcons.executable;
      default:
        return CustomIcons.file_type;
    }
  }
}
