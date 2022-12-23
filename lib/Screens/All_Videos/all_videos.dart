// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, always_specify_types


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resimvideoplayer/Screens/Search/searchdelegate.dart';
import 'package:resimvideoplayer/Screens/Thumbnail/thumnail.dart';
import 'package:resimvideoplayer/widgets/bottomsheet.dart';
import '../Settings/settings.dart';
import '../Splash/splash.dart';
import '../videoplaying screen/video_playing_screen.dart';

class AllVideos extends StatefulWidget {
  AllVideos({super.key});

  @override
  State<AllVideos> createState() => _AllVideosState();
}

class _AllVideosState extends State<AllVideos> {
  // BottomSheetClass obj = BottomSheetClass();
  List<dynamic> thumnailsss = [];

// SortFunctions functionnn = SortFunctions();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 4, 57, 87),
        body: Column(
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
                          image:
                              AssetImage('assets/img/Resim player icon.png'))),
                  SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: Text(
                      'All Videos',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 85.w, top: 20.h),
                    child: IconButton(
                        onPressed: () {
                        showSearch(context: context, delegate: MySearch());
                        },
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 0.w, top: 20.h),
                    child: IconButton(
                      onPressed: () {
                        
                     
     
                      },
                      icon: Icon(Icons.import_export),
                      color: Colors.white,
                    ),
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
                      onLongPress: () => showCustomBottomSheet(
                          context, fullvideo[index].path, index),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => VideoPlayerPage(
                              VideoFetched: fullvideo[index].path.toString(),
                              VTitle: (fullvideo[index].title.toString()),
                              Indexofvideo: index,
                            ),
                          ),
                        );
                      },
                      title: Container(
                        width: double.infinity,
                        child: Text(
                          fullvideo[index].title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 17,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ),

                      leading: Thumnailcontainer(VideoPath:fullvideo[index].path,index: index),
                      
  
                      // thumnailsss.add() getThumbnail(fullvideo[index].path);
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: fullvideo.length,
                )),
          ],
        ),
      ),
    );
  }
}
