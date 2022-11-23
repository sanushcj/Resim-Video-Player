// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, always_specify_types

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resimvideoplayer/widgets/bottomsheet.dart';
import '../../main.dart';
import '../Search/search.dart';
import '../Settings/settings.dart';
import '../Splash/splash.dart';
import '../videoplaying screen/video_playing_screen.dart';

List<dynamic> Fav = [];

// List <dynamic> FavDB = [];
class UserFav extends StatefulWidget {
  UserFav({super.key});

  @override
  State<UserFav> createState() => _UserFavState();
}

class _UserFavState extends State<UserFav> {
  @override
  Widget build(BuildContext context) {
    // log('${FavDB[1]} this is favssonggg');
    // BottomSheetClass bs = BottomSheetClass();
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 4, 57, 87),
        body: Column(
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
                      'FAVORITE VIDEOS',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 97.w, top: 20.h),
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SearchPage(),
                          ));
                        },
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
                child: FavDB.isNotEmpty
                    ? ListView.separated(
                        padding: EdgeInsets.only(top: 15),
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          log('${FavDB.length}.................');
                          return ListTile(
                            onLongPress: () => setState(() {
                             showCustomBottomSheet(context, FavDB, index);
                            }),

                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => VideoPlayerPage(
                                    VideoFetched: FavDB[index],
                                    VTitle: (FavDB[index].split('/').last),
                                    Indexofvideo: index,
                                  ),
                                ),
                              );
                            },
                            title: Text(FavDB[index].split('/').last),
                            // leading: Thumbnail(VidPath:fullvideo[index].path.toString() ),
                          );
                        },
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: FavDB.length)
                    : Center(
                        child: Text('Add Favorite Videos'),
                      )),
          ],
        ),
      ),
    );
  }
}
