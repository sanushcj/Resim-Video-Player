import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resimvideoplayer/Screens/Home/folderfunction.dart';
import 'package:resimvideoplayer/Screens/Splash/splash.dart';
import 'package:resimvideoplayer/Screens/videoplaying%20screen/video_playing_screen.dart';

import '../../Colors/mycolors.dart';
import '../Settings/settings.dart';

class MySearch extends SearchDelegate<dynamic> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(
              context,
              null,
            );
          } else {
            query = ' ';
          }
        },
        icon: const Icon(
          Icons.clear,
        ),
      )
    ];
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      textTheme: const TextTheme(
        displayMedium: TextStyle(
          color: Colors.white,
        ),
      ),
      // hintColor: kwhite,
      appBarTheme: const AppBarTheme(color: MainTheme),
      inputDecorationTheme: searchFieldDecorationTheme ??
          const InputDecorationTheme(
            border: InputBorder.none,
          ),
    );
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(
          context,
          null,
        );
      },
      icon: const Icon(
        Icons.arrow_back,
        // color: kwhiteIcon,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<dynamic> searched = allvideosControlleerr.fullvideo
        .map((e) => e.path)
        .toList()
        .where(
          (dynamic element) => element.toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: searched.isEmpty
          ? const Center(
              child: Text(
                'No Search Result !',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ).r,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15).r,
                    ),
                    child: ListTile(
                      onTap: () async {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => VideoPlayerPage(
                              VideoFetched: searched[index].toString(),
                              VTitle: (searched[index].split('/').last),
                              Indexofvideo: index,
                            ),
                          ),
                        );
                      },
                      title: Padding(
                        padding: const EdgeInsets.only(
                          left: 5.0,
                          bottom: 3,
                          top: 3,
                        ).r,
                        child: Text(
                          searched[index].split('/').last,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  return Divider();
                },
                itemCount: searched.length,
              ),
            ),
    );
  }

// search element
  @override
  Widget buildSuggestions(BuildContext context) {
    final List<dynamic> searched = allvideosControlleerr.fullvideo
        .map((e) => e.path)
        .toList()
        .where(
          (dynamic element) => element.toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();
    print('$searched hhhhhhhhhhi');
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: searched.isEmpty
          ? const Center(
              child: Text(
                'No Search Result !',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ).r,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15).r,
                    ),
                    child: ListTile(
                      onTap: () async {
                        print(searched);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => VideoPlayerPage(
                              VideoFetched: searched[index].toString(),
                              VTitle: (searched[index].split('/').last),
                              Indexofvideo: index,
                            ),
                          ),
                        );
                      },
                      title: Padding(
                        padding: const EdgeInsets.only(
                          left: 5.0,
                          bottom: 3,
                          top: 3,
                        ).r,
                        child: Text(
                          searched[index].split('/').last,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  return Divider();
                },
                itemCount: searched.length,
              ),
            ),
    );
  }
}

// ignore_for_file: always_specify_types

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MainTheme,
        body: ListView(
          children: <Widget>[
            Container(
              height: 75.h,
              width: 360.w,
              color: const Color.fromARGB(255, 4, 57, 87),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      margin: const EdgeInsets.only(
                        left: 20.0,
                      ),
                      height: 80.h,
                      width: 40.w,
                      child: const Image(
                          image:
                              AssetImage('assets/img/Resim player icon.png'))),
                  const SizedBox(
                    width: 5,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 36),
                    child: Text(
                      'RESIM VIDEOS',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 160.w),
                    child: PopupMenuButton<int>(
                      icon: const Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                      itemBuilder: (BuildContext context) => [
                        // popupmenu item 1
                        PopupMenuItem<int>(
                            value: 0,
                            // row has two child icon and text.
                            child: Row(
                              children: const <Widget>[
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
                                  MaterialPageRoute<dynamic>(
                                    builder: (BuildContext context) {
                                      return const SettingsPage();
                                    },
                                  ),
                                );
                              });
                            }),
                        // popupmenu item 2
                        PopupMenuItem<int>(
                          value: 1,
                          // row has two child icon and text
                          child: Row(
                            children: <Widget>[
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.chrome_reader_mode),
                              ),
                              const SizedBox(
                                // sized box with width 10
                                width: 10,
                              ),
                              const Text('About')
                            ],
                          ),
                        ),
                      ],
                      offset: const Offset(0, 100),
                      color: Colors.grey,
                      elevation: 2,
                    ),
                  ),
                ],
              ),
            ),
            Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(30))),
                height: MediaQuery.of(context).size.height / 1.1526,
                child: Form(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          style: const TextStyle(
                              fontSize: 15.0, color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search Your video',
                            filled: true,
                            fillColor: const Color.fromARGB(124, 54, 101, 159),
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 6.0, top: 8.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 4, 57, 87)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
