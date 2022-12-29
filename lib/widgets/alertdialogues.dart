import 'package:flutter/material.dart';
import 'package:resimvideoplayer/Screens/Favorites/favorite_screen.dart';


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
       favControllerUpdater.DeleteFav(index);
        Navigator.of(context).pop();
      });

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    content: Text(
        "Are you sure do you want to Remove ${favControllerUpdater.FavDB[index].split('/').last} ? "),
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
