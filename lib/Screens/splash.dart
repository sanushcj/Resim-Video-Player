// ignore_for_file: always_specify_types, use_build_context_synchronously, non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import '../DB/modelclass.dart';
import '../DB/videodata.dart';

import '../navbar.dart';

List <String> VideoTitles = [];
List <String>  VideoSize = [];
List <dynamic> VideoPath = [];
List <String> VideoDuration = [];
Set  <String>  Videofolders = {};

var allvideos = [];
dynamic  datadata;

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});


  @override
  State<Splashscreen> createState() => _SplashscreenState();
  
}
 const MethodChannel _platform =
      MethodChannel('search_files_in_storage/search');

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    searchInStorage();
    super.initState();
   
  }
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
    await Future<dynamic>.delayed(
      const Duration(seconds: 2),
    );
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) =>  const NavBar(),
    ));
  }

  void searchInStorage() {
    _platform.invokeMethod('search').then(
      ( value) {
        final  res = value as String;
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
    log('Function Working');
     GoToHome(context);
     allvideos = Videolist2.map((e) => VideoDatass(title: e.title!, folderName: e.folderName!, size: e.size!, duration: e.duration.toString(), path: e.path!)).toList();
datadata = allvideos;
log('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!${datadata[1]}>>>>>>>>>>>>>!!!!!!!!!!!!!!!!!!!!!!!!!!!!!>>>>>>');
   // ignore: unnecessary_brace_in_string_interps
   log('${Videolist2[2].path}');
   Videofolders = Videolist2.map((e) => e.folderName.toString()).toList().toSet();
   VideoTitles = Videolist2.map((e) => e.title.toString()).toList();
   VideoPath = Videolist2.map((e) => e.path.toString()).toList();
   VideoSize = Videolist2.map((e) => e.size.toString()).toList();
   VideoDuration = Videolist2.map((e) => e.duration.toString()).toList();
  //  log('$VideoTitles');
   
// print(Videofiless);
}
}
