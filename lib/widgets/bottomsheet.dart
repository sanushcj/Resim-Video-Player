// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:resimvideoplayer/Screens/Home/folderfunction.dart';
import 'package:resimvideoplayer/Screens/Splash/splash.dart';
import '../Screens/Favorites/functions.dart';
import '../Screens/PlayList/playlistmain.dart';
import 'alertdialogues.dart';

String? pathofvid;
Favoritesfunctions fff = Favoritesfunctions();
Future<void> showCustomBottomSheet(
  BuildContext ctx,
  bottom,
  index,
) async {
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
                    onPressed: () => showAlertDialogDelete(
                          ctx,
                          bottom,
                        ),
                    icon: Icon(
                      Icons.delete_forever_outlined,
                      color: Color.fromARGB(224, 255, 0, 0),
                    ),
                    label: Text('Delete',
                        style: TextStyle(color: Colors.red, fontSize: 16))),

// DELETEBUTTON ENDS

                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(0, 255, 0, 0),
                        elevation: 0),
                    onPressed: () {
                      PlaylistBottomSheet(
                        ctx,
                        bottom,
                      );
                    },
                    icon: Icon(
                      Icons.list_alt_outlined,
                      color: Color.fromARGB(223, 0, 0, 0),
                    ),
                    label: Text('Add PlayList',
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 16))),

                // playlist finished

                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(0, 255, 0, 0),
                        elevation: 0),
                    onPressed: () {
                      fff.addtoFav(allvideosControlleerr.fullvideo[index].path);
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
