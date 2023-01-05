// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, always_specify_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:resimvideoplayer/Colors/mycolors.dart';
import 'package:resimvideoplayer/Screens/Thumbnail/thumnail.dart';
import 'package:resimvideoplayer/widgets/appbar.dart';
import '../All_Videos/all_videos.dart';
import '../videoplaying screen/video_playing_screen.dart';

class FolderOpenScreen extends StatefulWidget {
  FolderOpenScreen({super.key, required this.myfoldervideos});
  List<dynamic> myfoldervideos = [];

  @override
  State<FolderOpenScreen> createState() => _FolderOpenScreenState();
}

class _FolderOpenScreenState extends State<FolderOpenScreen> {
  @override
  void initState() {
    super.initState();
    AllVideos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainTheme,
      body: SafeArea(
        child: Column(
          children: [
            AppBarVideo(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(30))),
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => ListTile(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => VideoPlayerPage(Videopack:widget.myfoldervideos ,
                        VideoFetched:
                            (widget.myfoldervideos[index].path.toString()),
                        VTitle:
                            ((widget.myfoldervideos[index].title.toString())),
                        Indexofvideo: index,
                      ),
                    )),
                    leading: Thumnailcontainer(
                        VideoPath: widget.myfoldervideos[index].path.toString(),
                        index: index),
                    title: Text(widget.myfoldervideos[index].title),
                  ),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: widget.myfoldervideos.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
