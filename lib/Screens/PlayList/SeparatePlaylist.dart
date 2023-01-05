// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, always_specify_types, must_be_immutable




import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resimvideoplayer/Screens/PlayList/playlist_screen.dart';
import 'package:resimvideoplayer/Screens/Thumbnail/thumnail.dart';
import 'package:resimvideoplayer/Screens/videoplaying%20screen/video_playing_screen.dart';
import 'package:resimvideoplayer/controller/playlist_controller.dart';
import 'package:resimvideoplayer/main.dart';
import 'package:resimvideoplayer/navbar.dart';
import 'package:resimvideoplayer/widgets/appbar.dart';


class InsidePlayList extends StatelessWidget {
  InsidePlayList({
    super.key,
    required this.boxkey,
  });

  String? boxkey;

  @override
  Widget build(BuildContext context) {
    if (box.containsKey(boxkey)) {
      PlayListControllerUpdater. VideosinPlayList = box.get(boxkey)!;
    }else{
     PlayListControllerUpdater. VideosinPlayList.clear();
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
                  GetBuilder<PlayList_Controller>(
                    builder: (Controller) {
                      return PlayListControllerUpdater.VideosinPlayList.isEmpty
                          ? Center(
                              child: Text('Add Videos'),
                            )
                          : SizedBox(
                              height: MediaQuery.of(context).size.height / 1.30,
                              child: ListView.separated(
                                padding: EdgeInsets.only(top: 15),
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    onTap: () => Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => VideoPlayerPage(Videopack: PlayListControllerUpdater.VideosinPlayList ,
                                          VideoFetched: PlayListControllerUpdater.VideosinPlayList[index],
                                          VTitle: PlayListControllerUpdater.VideosinPlayList[index]
                                              .split('/')
                                              .last,
                                          Indexofvideo: index),
                                    )),
                                    onLongPress: () =>    Controller.playlistVIDEOdelete(
                                        context, PlayListControllerUpdater.VideosinPlayList[index], boxkey),

                                    title: Container(
                                      width: double.infinity,
                                      child: Text(
                                       PlayListControllerUpdater. VideosinPlayList[index].split('/').last,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Color.fromARGB(255, 0, 0, 0)),
                                      ),
                                    ),

                                    leading: Thumnailcontainer(
                                        VideoPath: PlayListControllerUpdater.VideosinPlayList[index],
                                        index: index),
                                  );
                                },
                                separatorBuilder: (context, index) => Divider(),
                                itemCount: PlayListControllerUpdater.VideosinPlayList.length,
                              ));
                    }
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
