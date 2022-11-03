import 'package:hive/hive.dart';
part 'modelclass.g.dart';

@HiveType(typeId: 1)

class VideoDatass {
  VideoDatass({required this.title, required this.folderName, required this.size, required this.duration, required this.path,});

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



}
String boxname = 'Videos';

class StorageBox {
  static Box<List<dynamic>>? _box;
  static Box<List<dynamic>> getInstance() {
    return _box ?? Hive.box(boxname);
  }
}
