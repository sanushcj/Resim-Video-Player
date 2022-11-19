import 'package:hive/hive.dart';
part 'modelclass.g.dart';

@HiveType(typeId: 1)

class VideoDatass {
  VideoDatass({required this.title, required this.folderName, required this.size, required this.duration, required this.path,required this.Date,});

  @HiveField(0)
  int? id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String folderName;

  @HiveField(3)
  final String size;

  @HiveField(4)
  final String duration;

  @HiveField(5)
  final String path;

    @HiveField(6)
  final String Date;
}

String boxname = 'Videos';
// ignore: avoid_classes_with_only_static_members
class StorageBox {
  static Box<List<dynamic>>? _box;
  static Box<List<dynamic>> getInstance() {
    return _box ?? Hive.box(boxname);
  }
}

