import 'package:flutter/material.dart';

import '../imp functions/functins.dart';

showAlertDialogDelete(BuildContext context) {

  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed:  () {snackbar(context);},
  );
  Widget continueButton = TextButton(
    child: Text("Delete",style: TextStyle(color: Colors.red),),
    onPressed: (){Navigator.of(context).pop();}
  );

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
