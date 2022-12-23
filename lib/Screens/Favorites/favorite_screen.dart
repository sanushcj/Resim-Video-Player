// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, always_specify_types
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resimvideoplayer/Screens/Thumbnail/thumnail.dart';
import 'package:resimvideoplayer/widgets/appbar.dart';
import 'package:resimvideoplayer/widgets/bottomsheet.dart';
import '../Search/searchdelegate.dart';
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
            AppBarVideo(),
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(30))),
                height: MediaQuery.of(context).size.height / 1.33,
                child: FavDB.isNotEmpty
                    ? ListView.separated(
                        padding: EdgeInsets.only(top: 15),
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ListTile(
                              onLongPress: () => setState(() {
                                    showCustomBottomSheet(
                                        context, FavDB, index);
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
                              leading: Thumnailcontainer(
                                  VideoPath: FavDB[index], index: index));
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
