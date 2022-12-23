// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, always_specify_types, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resimvideoplayer/Screens/Home/folderScreen.dart';
import 'package:resimvideoplayer/Screens/Home/folderfunction.dart';
import 'package:resimvideoplayer/widgets/appbar.dart';
import '../All_Videos/all_videos.dart';
import '../Search/searchdelegate.dart';
import '../Settings/settings.dart';
import '../Splash/splash.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
  });

  List<dynamic> folderFetchedVideos = [];


  @override
  Widget build(BuildContext context) {
// fullvideo.folderName.length;
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 4, 57, 87),
      backgroundColor: Colors.red,
      extendBody: true,
      body: SafeArea(
        child: Column(
          children: [
            AppBarVideo(),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(30))),
              height: MediaQuery.of(context).size.height,
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => ListTile(
                  onTap: () {
                    final myfoldervideos =
                        getFolderVideos(Videofolders.elementAt(index));
                Get.to(FolderOpenScreen(myfoldervideos: a));
                  },
                  leading: Icon(
                    Icons.folder_outlined,
                    size: 40,
                  ),
                  title: Text(Videofolders.elementAt(index)),
                ),
                separatorBuilder: (context, index) => Divider(),
                itemCount: Videofolders.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // functionpathSplit(String path) {
  //   String a = path;
  //   List<dynamic> b = a.split('/');
  //   log(b.toString());
  //   log('${b[b.length - 2]}');

  //   // log('$folderFetchedVideos');
  //   folderFetchedVideos = b[b.length - 2].toString() as Set<String>;
  // }
}
