// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, always_specify_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../All_Videos/all_videos.dart';
import '../Search/search.dart';
import '../Settings/settings.dart';
import '../Splash/splash.dart';

class FolderOpenScreen extends StatefulWidget {
   const FolderOpenScreen({super.key, });


  @override
  State<FolderOpenScreen> createState() => _FolderOpenScreenState();
}

class _FolderOpenScreenState extends State<FolderOpenScreen> {
  @override
  void initState() {
    super.initState();
    AllVideos();
  }

  // List<String> namess = [
  //   'Camera',
  //   'DCIM',
  //   'Videos',
  //   'Movies',
  //   'CBSE SLEEPING',
  //   'Short Filims',
  //   'Ajo Varghese Videos',
  //   'Infopark',
  //   'Abin K Ruby Videos',
  //   'Wedding',
  //   'Devotional Videos'
  // ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 4, 57, 87),
      body: SafeArea(
        child: Column(
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
                      'RESIM VIDEO',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 124.w, top: 20.h),
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
                                onPressed: () {
                                 
                                },
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
              height: MediaQuery.of(context).size.height / 1.3,
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => ListTile(
                  onTap: () => fullvideo[index].path ,
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
} 