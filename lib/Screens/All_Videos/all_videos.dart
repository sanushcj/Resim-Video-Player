// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, always_specify_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resimvideoplayer/Screens/Thumbnail/thumnail.dart';
import 'package:resimvideoplayer/controller/fullvideo_controller.dart';
import 'package:resimvideoplayer/widgets/appbar.dart';
import 'package:resimvideoplayer/widgets/bottomsheet.dart';
import '../videoplaying screen/video_playing_screen.dart';

class AllVideos extends StatelessWidget {
  AllVideos({super.key});

  // BottomSheetClass obj = BottomSheetClass();
  List<dynamic> thumnailsss = [];
// SortFunctions functionnn = SortFunctions();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: const Color.fromARGB(255, 4, 57, 87),
        body: Column(
          children: [
            AppBarVideo(),
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(30))),
                height: MediaQuery.of(context).size.height/1.30,
                child: GetBuilder<allVideosController>(
                  builder: (Controller) {
                    return ListView.separated(
                      padding: EdgeInsets.only(top: 15),
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ListTile(
                          onLongPress: () => showCustomBottomSheet(
                              context, Controller.fullvideo[index].path, index),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => VideoPlayerPage(
                                  VideoFetched: Controller.fullvideo[index].path.toString(),
                                  VTitle: (Controller.fullvideo[index].title.toString()),
                                  Indexofvideo: index,
                                ),
                              ),
                            );
                          },
                          title: Container(
                            width: double.infinity,
                            child: Text(
                              Controller.fullvideo[index].title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                          ),

                          leading: Thumnailcontainer(
                              VideoPath: Controller.fullvideo[index].path, index: index),

                          // thumnailsss.add() getThumbnail(fullvideo[index].path);
                        );
                      },
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: Controller.fullvideo.length,
                    );
                  }
                )),
          ],
        ),
      ),
    );
  }
}
