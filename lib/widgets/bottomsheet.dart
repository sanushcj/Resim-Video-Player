import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:resimvideoplayer/Screens/Favorites/favorite_screen.dart';
import 'package:resimvideoplayer/Screens/Splash/splash.dart';
import 'package:resimvideoplayer/main.dart';
import '../Screens/PlayList/playlistmain.dart';
import 'alertdialogues.dart';

class BottomSheetClass  {

  PlayListBackend obj = PlayListBackend();

Future<void> showCustomBottomSheet(BuildContext ctx, index,) async {
  log('$index');
  showModalBottomSheet(
      context: ctx,
      builder: (ctx1) {
        return Container(
          height: 208,
          color: Color.fromARGB(255, 214, 247, 255),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(0, 255, 0, 0),
                        elevation: 0),
                    onPressed: () => showAlertDialogDelete(ctx),
                    icon: Icon(
                      Icons.delete_forever_outlined,
                      color: Color.fromARGB(224, 255, 0, 0),
                    ),
                    label: Text('Delete',
                        style: TextStyle(color: Colors.red, fontSize: 16))),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(0, 255, 0, 0),
                        elevation: 0),
                   onPressed:() => obj.showAlertDialogPlayList(ctx), 
                    icon: Icon(
                      Icons.list_alt_outlined,
                      color: Color.fromARGB(223, 0, 0, 0),
                    ),
                    label: Text('Add PlayList',
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 16))),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(0, 255, 0, 0),
                        elevation: 0),
                    onPressed: () {
                        //  fv.AddFavv(index,fullvideo[index].path,);
                      // log('$index');log('${fullFavVideo.length} print');
  // likedVideos =  fullvideo[index].path;
  //   log('$likedVideos');
  //    box.put("FavVideo", likedVideos);
  // fullFavVideo =   box.get('FavVideo')!;
  // log('0000000000000');
  // log('$fullFavVideo ');
addtoFav(fullvideo[index].path);

  // Navigator.of(ctx).push(MaterialPageRoute(builder: (context) => Favoritemain(index: index, path: fullvideo[index].path, Title: fullvideo[index].title,),));
                   
                      },
                    icon: Icon(
                      Icons.favorite_border,
                      color: Color.fromARGB(223, 0, 0, 0),
                    ),
                    label: Text('Add Favorites',
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 16))),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(0, 255, 0, 0),
                        elevation: 0),
                    onPressed: () => Navigator.pop(ctx),
                    icon: Icon(
                      Icons.share_outlined,
                      color: Color.fromARGB(223, 0, 0, 0),
                    ),
                    label: Text('Share',
                        style: TextStyle(color: Colors.black, fontSize: 16))),
                // ElevatedButton(
                //   child: const Text('Close BottomSheet'),
                //
                // ),
              ],
            ),
          ),
        );
      });
}

  void addtoFav(path,) {
    log('$path');
    Fav.add(path);
    box.put('MyFavVideo', Fav);
  }
}




