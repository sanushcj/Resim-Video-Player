import 'package:flutter/material.dart';
import 'package:resimvideoplayer/Screens/PlayList/playlistmain.dart';
import 'package:resimvideoplayer/Screens/Splash/splash.dart';
import 'package:resimvideoplayer/main.dart';
import '../Screens/PlayList/SeparatePlaylist.dart';

showAlertDialogDeleteFavoriteVideos(BuildContext context, index,) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = TextButton(
      child: Text(
        "Remove",
        style: TextStyle(color: Colors.red),
      ),
      onPressed: () {
       FavDB.remove(FavDB[index]);
        Navigator.of(context).pop();
      });

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    content: Text(
        "Are you sure do you want to Remove ${FavDB[index].split('/').last} ? "),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

// import '../imp functions/functins.dart';
showAlertDialogDeleteForPlaylist(
  BuildContext context,
  String nameoftheplaylist,
) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = TextButton(
      child: Text(
        "Delete",
        style: TextStyle(color: Colors.red),
      ),
      onPressed: () {
        if (box.containsKey(nameoftheplaylist)) {
          box.delete(nameoftheplaylist);
        }
        Get_List_of_playlistNames.remove(nameoftheplaylist);
        Get_List_of_playlistNames = box.get('Playlistnamesss')!;
        Navigator.of(context).pop();
      });

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    content: Text("Are you sure do you want to delete ${nameoftheplaylist} ?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialogDeleteForPlaylistVideos(
    BuildContext context, String nameofTheVideo, PlayListname) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = TextButton(
      child: Text(
        "Delete",
        style: TextStyle(color: Colors.red),
      ),
      onPressed: () {
        final playlist = box.get(PlayListname);
        playlist!.remove(nameofTheVideo);
        box.put(PlayListname, playlist);
        VideosinPlayList = box.get(PlayListname)!;
        Navigator.of(context).pop();
      });

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    content: Text(
        "Are you sure do you want to delete ${nameofTheVideo.split('/').last} ?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
