
import 'dart:developer';

import 'package:resimvideoplayer/Screens/Splash/splash.dart';

import '../../DB/modelclass.dart';
import '../../main.dart';
List <dynamic> fullFavVideo = <dynamic>[];
List <VideoDatass> likedVideos = [];
class FavMain  {



AddFavv(index){

     likedVideos = allvideos.map((e) => VideoDatass(title: e.title[index], folderName: e.folderName[index], size: e.size[index], duration: e.duration[index], path: e.path, Date: e.Date)).toList();
     box.put("FavVideo", likedVideos);
  fullFavVideo =   box.get('FavVideo')!;
  log('$fullFavVideo ''''''''''''''');
}


}