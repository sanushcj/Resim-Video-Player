import 'package:get/get.dart';
import 'package:resimvideoplayer/controller/fullvideo_controller.dart';

final allVideosController allvideosControlleerr = Get.find();
List a = [];
List<String> filteredFolderVideos = [];
void getFolderVideos(String path) {
  filteredFolderVideos.clear();
  a = allvideosControlleerr.fullvideo.where((element) {
    return element.folderName == path;
  }).toList();
}
