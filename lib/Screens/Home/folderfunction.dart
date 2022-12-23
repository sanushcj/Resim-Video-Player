import 'package:resimvideoplayer/Screens/Splash/splash.dart';

List a = [];
List<String> filteredFolderVideos = [];
void getFolderVideos(String path) {
  filteredFolderVideos.clear();
  a = fullvideo.where((element) {
    return element.folderName == path;
  }).toList();
}
