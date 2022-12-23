
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resimvideoplayer/Screens/Search/searchdelegate.dart';
import 'package:resimvideoplayer/Screens/Settings/settings.dart';

class AppBarVideo extends StatelessWidget {
  const AppBarVideo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                showSearch(context: context, delegate: MySearch());
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
    );
  }
}

// Set<String> folderFetchedVideos = {};
