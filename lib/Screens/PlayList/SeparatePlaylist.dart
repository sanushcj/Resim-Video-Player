// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, always_specify_types, must_be_immutable


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resimvideoplayer/Screens/PlayList/playlistmain.dart';
import 'package:resimvideoplayer/Screens/videoplaying%20screen/video_playing_screen.dart';
import 'package:resimvideoplayer/main.dart';

import '../../navbar.dart';
import '../Settings/settings.dart';
import '../Thumbnail/thumnail.dart';

List VideosinPlayList = [];

class InsidePlayList extends StatelessWidget {
  InsidePlayList({
    super.key,
    required this.boxkey,
  });

  String? boxkey;

  @override
  Widget build(BuildContext context) {
    if (box.containsKey(boxkey)) {
      VideosinPlayList = box.get(boxkey)!;
    }else{
      VideosinPlayList.clear();
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 4, 57, 87),
        body: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 11,
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
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NavBar(),
                      ));
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
                            'Add new videos',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 50,
                          )
                        ],
                      ),
                    ),
                  ),
                  // ignore: unnecessary_null_comparison
                  VideosinPlayList.isEmpty
                      ? Center(
                          child: Text('Add Videos'),
                        )
                      : SizedBox(
                          height: MediaQuery.of(context).size.height / 1.29,
                          child: ListView.separated(
                            padding: EdgeInsets.only(top: 15),
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              // functionnn.assendingorder();
                              // abc.sort((a, b) => a.length.compareTo(b.length));
                              // log('$abc after sorting');

                              //  fullvideo.sort((a, b) => a.length.compareTo(b.length));
                              // log('message');
                              return ListTile(
                                onTap: () => Navigator.of(context)
                                    .push(MaterialPageRoute(
                                  builder: (context) => VideoPlayerPage(
                                      VideoFetched: VideosinPlayList[index],
                                      VTitle: VideosinPlayList[index]
                                          .split('/')
                                          .last,
                                      Indexofvideo: index),
                                )),
                                onLongPress: () => playlistVIDEOdelete(
                                    context, VideosinPlayList[index], boxkey),

                                title: Container(
                                  width: double.infinity,
                                  child: Text(
                                    VideosinPlayList[index].split('/').last,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                ),

                                leading: Thumnailcontainer(
                                    VideoPath: VideosinPlayList[index],
                                    index: index),
                              );
                            },
                            separatorBuilder: (context, index) => Divider(),
                            itemCount: VideosinPlayList.length,
                          )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
