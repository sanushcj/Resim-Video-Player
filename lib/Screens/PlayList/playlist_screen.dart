// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, always_specify_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resimvideoplayer/main.dart';

import '../Settings/settings.dart';
import 'playlistmain.dart';

class PlaylistPage extends StatelessWidget {
  PlaylistPage({super.key});

  List<String> namess = [
    'Camera',
    'DCIM',
    'Videos',
    'Movies',
    'CBSE SLEEPING',
    'Short Filims',
    'Ajo Varghese Videos',
    'Infopark',
    'Abin K Ruby Videos',
    'Wedding',
    'Devotional Videos'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 4, 57, 87),
        body: ListView(
          children: [
            Container(
              height: 75.h,
              width: 360.w,
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
                          image:
                              AssetImage('assets/img/Resim player icon.png'))),
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
                              WidgetsBinding.instance.addPostFrameCallback((_) {
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
              height: MediaQuery.of(context).size.height / 1.325,
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
                      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
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
                      height: MediaQuery.of(context).size.height / 1.325,
                      child: Get_List_of_playlistNames.isNotEmpty
                          ? GridView.builder(
                            
                              itemCount: Get_List_of_playlistNames.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemBuilder: (context, index) => InkWell(
                                onTap: () => box.containsKey(key),
                                child: Card(
                                  child: Column(
                                    children: [Text(Get_List_of_playlistNames[index])],
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
    );
  }
}
