// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, always_specify_types, must_be_immutable

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resimvideoplayer/Screens/PlayList/SeparatePlaylist.dart';
import 'package:resimvideoplayer/widgets/appbar.dart';
import '../Settings/settings.dart';
import 'playlistmain.dart';

class PlaylistPage extends StatefulWidget {
  PlaylistPage({super.key});

  @override
  State<PlaylistPage> createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromARGB(255, 4, 57, 87),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width,
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  AppBarVideo(),
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(30))),
                    height: MediaQuery.of(context).size.height / 1.33,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            showAlertDialogPlayList(context);
                          },
                          child: Container(
                            margin:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.add,
                                  color: Color.fromARGB(255, 4, 57, 87),
                                  size: 25,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  'Make a New PlayList',
                                  style: TextStyle(fontSize: 20),
                                ),
                                SizedBox(
                                  height: 50,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 1.29,
                            child: Get_List_of_playlistNames.isNotEmpty
                                ? GridView.builder(
                                    itemCount: Get_List_of_playlistNames.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2),
                                    itemBuilder: (context, index) => InkWell(
                                      onLongPress: () {
                                        playlistDelete(context,
                                            Get_List_of_playlistNames[index]);
                                      },
                                      onTap: () => Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => InsidePlayList(
                                            boxkey: Get_List_of_playlistNames[
                                                index]),
                                      )),
                                      child: Card(
                                        color: Colors.primaries[Random()
                                            .nextInt(
                                                Colors.primaries.length)][300],
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Center(
                                                child: Text(
                                              Get_List_of_playlistNames[index],
                                              style: TextStyle(fontSize: 20),
                                            ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : Center(
                                    child: Text('Create new Playlist'),
                                  )),
                        Divider(
                          thickness: 1,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
