
import 'package:flutter/material.dart';
import 'package:resimvideoplayer/Screens/splash.dart';

snackbar(context) {

ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text('snack'),
            duration: const Duration(seconds: 3),
            action: SnackBarAction(
              label: 'Deleted SuccessFully',
              onPressed: () { },
            ),
          ));
}


previousVideo(int currentIndex ,String CurrentVideoPath,String VidTitle ) {
  if(currentIndex>0){
CurrentVideoPath = fullvideo[currentIndex -1].path;
currentIndex = currentIndex-1;
VidTitle = fullvideo[currentIndex -1].title;
  }
  // return CurrentVideoPath ;
}

NextVideo(int currentIndex ,String CurrentVideoPath,String VidTitle) {
  if(currentIndex >=0){
CurrentVideoPath = fullvideo[currentIndex +1].path;
currentIndex = currentIndex+1;
VidTitle = fullvideo[currentIndex +1].title;
  }
  return CurrentVideoPath;
}

