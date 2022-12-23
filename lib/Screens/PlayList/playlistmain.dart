import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resimvideoplayer/main.dart';

import '../../widgets/alertdialogues.dart';
import 'SeparatePlaylist.dart';

final playlistname_Controller = TextEditingController();

List Get_List_of_playlistNames = [];
CreatingPlayList(TextEditingController newplaylistname) async {
  final Playlistname = newplaylistname.text.trim();
  Get_List_of_playlistNames.add(Playlistname);
  box.put('AllPlayListNames', Get_List_of_playlistNames);
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
  showModalBottomSheet(
      context: ctx,
      builder: (ctx1) {
        return Container(
          height: 300,
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
                  Divider(
                    thickness: 1,
                  ),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                onTap: () => playlistChecking(
                                    Get_List_of_playlistNames[index], video),
                                title: Text(
                                  Get_List_of_playlistNames[index],
                                  style: TextStyle(fontSize: 18),
                                ),
                                leading: Icon(
                                  Icons.playlist_add,
                                  size: 25,
                                ),
                              ),
                            ),
                        separatorBuilder: (context, index) =>
                            Divider(thickness: 1),
                        itemCount: Get_List_of_playlistNames.length),
                  )
                ]),
          ),
        );
      });
}

playlistChecking(String Keyyy, String Video) {
  if (box.containsKey(Keyyy)) {
    VideosinPlayList.clear();
    VideosinPlayList = box.get(Keyyy)!;
    VideosinPlayList.add(Video);
    box.put(Keyyy, VideosinPlayList);
    log('Video in plaulistytttt $VideosinPlayList');
  } else {
    VideosinPlayList.clear();
    VideosinPlayList.add(Video);
    box.put(Keyyy, VideosinPlayList);
  }
}

playlistDelete(
  BuildContext ctx,
  keyofthebox,
) async {
  showModalBottomSheet(
      context: ctx,
      builder: (ctx1) {
        return Container(
          height: 300,
          color: Color.fromARGB(255, 214, 247, 255),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(

                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(0, 255, 0, 0),
                          elevation: 0),
                      onPressed: () =>
                          showAlertDialogDeleteForPlaylist(ctx, keyofthebox),
                      icon: Icon(
                        Icons.delete_forever_outlined,
                        color: Color.fromARGB(224, 255, 0, 0),
                      ),
                      label: Text('Delete',
                          style: TextStyle(color: Colors.red, fontSize: 16))),
                  Divider(
                    thickness: 1,
                  ),
                ]),
          ),
        );
      });
}

playlistVIDEOdelete(BuildContext ctx, nameofTheVideo, PlayListname) async {
  showModalBottomSheet(
      context: ctx,
      builder: (ctx1) {
        return Container(
          height: 300,
          color: Color.fromARGB(255, 214, 247, 255),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(

                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(0, 255, 0, 0),
                          elevation: 0),
                      onPressed: () => showAlertDialogDeleteForPlaylistVideos(
                          ctx, nameofTheVideo, PlayListname),
                      icon: Icon(
                        Icons.delete_forever_outlined,
                        color: Color.fromARGB(224, 255, 0, 0),
                      ),
                      label: Text('Delete',
                          style: TextStyle(color: Colors.red, fontSize: 16))),
                  Divider(
                    thickness: 1,
                  ),
                ]),
          ),
        );
      });
}
