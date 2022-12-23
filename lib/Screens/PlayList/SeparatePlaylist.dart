// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, always_specify_types, must_be_immutable


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resimvideoplayer/Screens/PlayList/playlistmain.dart';
import 'package:resimvideoplayer/Screens/videoplaying%20screen/video_playing_screen.dart';
import 'package:resimvideoplayer/main.dart';
import 'package:resimvideoplayer/widgets/appbar.dart';

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
           AppBarVideo(),
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
                          height: MediaQuery.of(context).size.height / 1.33,
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
