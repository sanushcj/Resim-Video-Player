// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, always_specify_types, must_be_immutable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resimvideoplayer/Screens/PlayList/SeparatePlaylist.dart';
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
                  Container(
                    height: MediaQuery.of(context).size.height / 12,
                    width: double.infinity,
                    color: const Color.fromARGB(255, 4, 57, 87),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(
                              left: 20.0,
                            ),
                            height: 80.h,
                            width: 40.w,
                            child: Image(
                                image: AssetImage(
                                    'assets/img/Resim player icon.png'))),
                        SizedBox(
                          width: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 36),
                          child: Text(
                            'PlayLists',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 150.w, top: 20.h),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.search,
                                color: Colors.white,
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20, left: 0.w),
                          child: PopupMenuButton<int>(
                            icon: Icon(
                              Icons.more_vert,
                              color: Colors.white,
                            ),
                            itemBuilder: (context) => [
                              // popupmenu item 1
                              PopupMenuItem(
                                  value: 0,
                                  // row has two child icon and text.
                                  child: Row(
                                    children: const [
                                      Icon(Icons.settings),
                                      SizedBox(
                                        // sized box with width 10
                                        width: 10,
                                      ),
                                      Text('Settings')
                                    ],
                                  ),
                                  onTap: () {
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return SettingsPage();
                                          },
                                        ),
                                      );
                                    });
                                  }),
                              // popupmenu item 2
                              PopupMenuItem(
                                value: 1,
                                // row has two child icon and text
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.chrome_reader_mode),
                                    ),
                                    SizedBox(
                                      // sized box with width 10
                                      width: 10,
                                    ),
                                    Text('About')
                                  ],
                                ),
                              ),
                            ],
                            offset: Offset(0, 100),
                            color: Colors.grey,
                            elevation: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(30))),
                    height: MediaQuery.of(context).size.height / 1.29,
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
                                        setState(() {
                                          playlistDelete(context,
                                              Get_List_of_playlistNames[index]);
                                        });
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
