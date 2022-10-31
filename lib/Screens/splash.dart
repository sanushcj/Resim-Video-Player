// ignore_for_file: always_specify_types, use_build_context_synchronously, non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:resimvideoplayer/DB/videodata.dart';

import '../navbar.dart';

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
 GoToHome(context);
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
      builder: (context) => const NavBar(),
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

  
  
   Future<void> onSuccess(String audioListFromStorage) async {
    final dynamic valueMap = jsonDecode(audioListFromStorage);
    final List<dynamic> Videolist = valueMap as List<dynamic>;
   dynamic Videolist2 = Videolist.map((dynamic e) {
      return VideoListData.fromJson(e as Map<String, dynamic>);
    }).toList();
   log('${Videolist2}');
}
}
