
import 'package:flutter/material.dart';

// import '../imp functions/functins.dart';

showAlertDialogDelete(BuildContext context) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed: () {
      (context);
    },
  );
  Widget continueButton = TextButton(
      child: Text(
        "Delete",
        style: TextStyle(color: Colors.red),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      });

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    content: Text("Are you sure do you want to delete video ?"),
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

showAlertDialogPlayList(
  BuildContext context,
) {
  final newplaylistname = TextEditingController();

  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed: () {
      (context);
    },
  );
  Widget create = TextButton(
      child: Text(
        "Create",
        style: TextStyle(color: Colors.red),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      });
  Widget playlistform = Form(
      child: TextField(
    controller: newplaylistname,
    decoration: const InputDecoration(
      border: OutlineInputBorder(),
      hintText: 'Enter playlist Name',
      fillColor: Color.fromARGB(145, 255, 255, 255),
      filled: true,
    ),
  ));

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    actions: [
      playlistform,
      Row(
        children: [
          cancelButton,
           create,
        ],
      ),
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
