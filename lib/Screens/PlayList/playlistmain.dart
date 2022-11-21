import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
  final newplaylistname = TextEditingController();
List<dynamic> MainPlayList = [];
List<dynamic> Playlists = [];

class PlayListBackend extends StatelessWidget {
  const PlayListBackend({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  CreatingPlayList(TextEditingController newplaylistname) async {
    String NewPlayLN =  newplaylistname.text.trim();
    Duration(seconds: 3);
    // List <dynamic> NewPlayLN = [];
  }
  
showAlertDialogPlayList(
  BuildContext context,
) {

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
        CreatingPlayList(newplaylistname);
        Navigator.of(context).pop();
        // log('${ newplaylistname.text.trim()};;;;;;');
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
          SizedBox(width: 153.w ),
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
      return alert ;
    },
  );
}

 Future<void> showCustomBottomSheet(
    BuildContext ctx, 
    index,
  ) async {
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
                children: []
                
              ),
            ),
          );
        });




}
}