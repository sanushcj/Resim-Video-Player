import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resimvideoplayer/main.dart';

final playlistname_Controller = TextEditingController();


List Get_List_of_playlistNames = [];
CreatingPlayList(TextEditingController newplaylistname) async {

  final Playlistname = newplaylistname.text.trim();
  log('${Playlistname}');
  if (Get_List_of_playlistNames.isNotEmpty) {
    log('if case of playlistb worked');
  }
  Get_List_of_playlistNames.add(Playlistname);
  box.put('Playlistnamesss', Get_List_of_playlistNames);
  log('${Get_List_of_playlistNames }');
}

showAlertDialogPlayList(
  BuildContext context,
) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget create = TextButton(
      child: Text(
        "Create",
        style: TextStyle(color: Colors.red),
      ),
      onPressed: () {
        CreatingPlayList(playlistname_Controller);
        Navigator.of(context).pop();
        // log('${newplaylistname.text.trim()}');
      });
  Widget playlistform = Form(
      child: TextField(
    controller: playlistname_Controller,
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
          SizedBox(width: 153.w),
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

PlaylistBottomSheet(
  BuildContext ctx,
  video,
) async {
  log('$video 33');
  showModalBottomSheet(
      context: ctx,
      builder: (ctx1) {
        log('$video path is coming in the playlist');
        return Container(
          height: 250,
          color: Color.fromARGB(255, 214, 247, 255),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(

                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () => showAlertDialogPlayList(ctx),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      child: Row(
                        children: [
                          Icon(Icons.add),
                          SizedBox(
                            width: 100,
                          ),
                          Text('Create New Playlist'),
                          // showAlertDialogPlayList(ctx)
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) => Text(Get_List_of_playlistNames[index]),
                        separatorBuilder: (context, index) => Divider(
                              thickness: 1
                            ),
                        itemCount: Get_List_of_playlistNames.length),
                  )
                ]),
          ),
        );
      });
}
