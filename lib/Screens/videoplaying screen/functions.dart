import 'package:flutter/services.dart';


  


  String videoDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final Seconds = twoDigits(duration.inSeconds.remainder(60));

    return [if (duration.inHours > 0) hours, minutes, Seconds].join(':');
  }

  StatusBarHide() async {
    Duration(seconds: 4);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }