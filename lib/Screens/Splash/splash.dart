// ignore_for_file: always_specify_types, use_build_context_synchronously, non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:resimvideoplayer/controller/homescreen_controller.dart';
import '../../DB/modelclass.dart';
import '../../DB/videodata.dart';
import '../../main.dart';
import '../../navbar.dart';
import '../PlayList/playlistmain.dart';

// List <String> VideoTitles = [];
// List <String>  VideoSize = [];
List<String> VideoPath = [];
List<dynamic> FavDB = [];
// List <String> VideoDuration = [];

List fullvideo = [];
List<VideoDatass> allvideos = [];
List HPLN = [];
// dynamic  datadata;


class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

const MethodChannel _platform = MethodChannel('search_files_in_storage/search');

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
        splashFetch();
    searchInStorage();
    super.initState();
  }

  final HomeScreenController Homecontroller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 4, 57, 87),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
                height: 100,
                width: 100,
                child: Image(
                    image: AssetImage('assets/img/Resim player icon.png'))),
            Text(
              'RESIM VIDEO',
              style: TextStyle(color: Colors.white, fontSize: 40),
            )
          ],
        ),
      ),
    );
  }

  Future<void> GoToHome(BuildContext context) async {
        log("fsfffffffffffffffffffffffffffffffffffff");

    await Future<dynamic>.delayed(
      const Duration(seconds: 2),
    );
   Navigator. pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => NavBar(),
        ),
      );
  }

  void searchInStorage() {

    _platform.invokeMethod('search').then(
      (value) {
        final res = value as String;
        // log('<<$res>>');

        onSuccess(res);
      },
    ).onError((Object? error, StackTrace stackTrace) {});
  }

  Future<void> splashFetch() async {
    if (await _requestPermission(Permission.storage)) {
      searchInStorage();
    } else {
      splashFetch();
    }
  }

  Future<bool> _requestPermission(Permission isPermission) async {
    const Permission store = Permission.storage;
    const Permission access = Permission.accessMediaLocation;

    if (await isPermission.isGranted) {
      await access.isGranted && await store.isGranted;
      return true;
    } else {
      final PermissionStatus result = await store.request();
      final PermissionStatus oneresult = await access.request();

      if (result == PermissionStatus.limited &&
          oneresult == PermissionStatus.limited) {
        return true;
      } else {
        return false;
      }
    }
  }

  Future<void> onSuccess(String VideosDatass) async {

    final dynamic valueMap = jsonDecode(VideosDatass);
    final List<dynamic> Videolist = valueMap as List<dynamic>;
    final Videolist2 = Videolist.map((dynamic e) {
      // Videofiless = Videolist2 ;
      return VideoListData.fromJson(e as Map<String, dynamic>);
    }).toList();

    allvideos = Videolist2.map((e) => VideoDatass(
        title: e.title!,
        folderName: e.folderName!,
        size: e.size!,
        duration: e.duration.toString(),
        path: e.path!,
        Date: e.Date!)).toList();

    box.put('MyVideos', allvideos);
    fullvideo = box.get('MyVideos')!;
   Homecontroller. Videofolders =
        fullvideo.map((e) => e.folderName.toString()).toList().toSet();
    final checkingkeys = box.keys.toList();
    if (checkingkeys.contains('MyFavVideo')) {
      FavDB = box.get('MyFavVideo')!;
    } else {
      box.put('MyFavVideo', FavDB);
    }

    if (checkingkeys.contains('AllPlayListNames')) {
      Get_List_of_playlistNames = box.get('AllPlayListNames')!;
    } else {
      box.put('AllPlayListNames', Get_List_of_playlistNames);
    }
    GoToHome(context);
  }
}
