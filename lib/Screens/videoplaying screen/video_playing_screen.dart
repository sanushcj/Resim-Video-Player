import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resimvideoplayer/Screens/splash.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPage extends StatefulWidget {
  VideoPlayerPage(
      {super.key,
      required this.VideoFetched,
      required this.VTitle,
      required this.Indexofvideo});

  String VideoFetched;
  String VTitle;
  int Indexofvideo;
  @override
  State<VideoPlayerPage> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayerPage> {
  late VideoPlayerController videoPlayerController;
  _playVideo({int index = 0, bool init = false}) {
    if (index < 0 || index >= fullvideo.length) return;
    videoPlayerController =
        VideoPlayerController.file(File(widget.VideoFetched))
          ..addListener(() => setState(() {}))
          ..setLooping(true)
          ..initialize().then((value) => setState(() {}));
  }

  String _videoDuration(Duration duration) {
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

  @override
  void initState() {
    super.initState();
    _playVideo(init: true);
    StatusBarHide();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    StatusBarHide();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.green,
          child: videoPlayerController.value.isInitialized
              ? Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height,
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(20),
                        child: AspectRatio(
                          aspectRatio: videoPlayerController.value.aspectRatio,
                          child: VideoPlayer(videoPlayerController),
                        )),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 120,
                        color: Color.fromARGB(72, 0, 0, 0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                ValueListenableBuilder(
                                  valueListenable: videoPlayerController,
                                  builder: ((context, VideoPlayerValue value,
                                      child) {
                                    return Text(
                                      _videoDuration(value.position),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 13),
                                    );
                                  }),
                                ),
                                Expanded(
                                  child: ClipRRect(
borderRadius: BorderRadius.circular(6),
                                    child: SizedBox(
                                      height: 20,
                                      child: VideoProgressIndicator(
                                          videoPlayerController,
                                          colors: VideoProgressColors(
                                              backgroundColor: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              playedColor: Colors.red,
                                              bufferedColor: Colors.black),
                                          allowScrubbing: true,
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 50,
                                            horizontal: 50,
                                          )),
                                    ),
                                  ),
                                ),
                                Text(
                                  _videoDuration(
                                      videoPlayerController.value.duration),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13),
                                )
                              ],
                            ),
                          
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.lock_outline,
                                      color: Colors.white,
                                      size: 40,
                                    )),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.skip_previous,
                                      color: Colors.white,
                                      size: 40,
                                    )),
                                IconButton(
                                    onPressed: () =>
                                        videoPlayerController.value.isPlaying
                                            ? videoPlayerController.pause()
                                            : videoPlayerController.play(),
                                    icon: Icon(
                                      videoPlayerController.value.isPlaying
                                          ? Icons.pause
                                          : Icons.play_arrow,
                                      color: Colors.white,
                                      size: 40,
                                    )),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.skip_next,
                                      color: Colors.white,
                                      size: 40,
                                    )),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.fullscreen_outlined,
                                      color: Colors.white,
                                      size: 40,
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(color: Colors.white),
                )),
    );
  }
}























// // ignore_for_file: file_names

// import 'dart:io';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'landscape_screen.dart';

// class VideoPlayingScreen extends StatefulWidget {
//   const VideoPlayingScreen({super.key});

//   @override
//   State<VideoPlayingScreen> createState() => _VideoPlayingScreenState();
// }

// class _VideoPlayingScreenState extends State<VideoPlayingScreen> {
//   late VideoPlayerController videoPlayerController;

//   // Future<File?> pickedVideoFile() async {
//   //   final FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.video);
//   //   if (result == null) {
//   //     return null;
//   //   }
//   //   return File(result.files.single.path ?? '');
//   // }

//   @override
//   void initState() {

//     super.initState();

//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//           child: Column(
//         children:<Widget> [
//           Stack(
//             children:<Widget> [
//               SizedBox(
//                 height: 250,
//                 child: VideoPlayerPage(_controller),
//               ),
//               Positioned(
//                 bottom: 0,
//                 right: 0,
//                 child: IconButton(
//                     onPressed: () {
//                       MaterialPageRoute<dynamic>(builder: (BuildContext context) => LandscapePlayerPage(controller: _controller),);
//                     },
//                     icon: const Icon(
//                       Icons.fullscreen,
//                       color: Colors.white,
//                       size: 40,
//                     )),
//               )
//             ],
//           ),
//           SizedBox(height: 250, child: VideoPlayer(_controller)),
//           const SizedBox(
//             height: 12,
//           ),
//           ElevatedButton(
//               onPressed: () async {
//                 // final File? pickedFile = await pickedVideoFile();

//                 _playVideo();
//               },
//               child: const Text('pick a video file'))
//         ],
//       )),
//     );
//   }

//   dynamic _playVideo() {
//     _controller =     VideoPlayerController.asset('assets/video/sample.mp4')
//       ..addListener(() => setState(() {}))
//       ..setLooping(true)
//       ..initialize().then((void value) => _controller.play());
//   }
// }
// import 'dart:io';
// import 'package:appinio_video_player/appinio_video_player.dart';
// import 'package:flutter/material.dart';

// class VideoPlayingScreen extends StatefulWidget {
//   VideoPlayingScreen(
//       {super.key, required this.VideoFetched, required this.VTitle});

//   String VideoFetched;
//   String VTitle;

//   @override
//   VideoPlayingScreenState createState() => VideoPlayingScreenState();
// }

// class VideoPlayingScreenState extends State<VideoPlayingScreen> {
//   late VideoPlayerController videoPlayerController;
//   late CustomVideoPlayerController _customVideoPlayerController;

//   bool startedPlaying = false;

//   @override
//   void initState() {
//     super.initState();
//     videoPlayerController =
//         VideoPlayerController.file(File(widget.VideoFetched))
//           ..initialize().then((value) => setState(() {}));
//     _customVideoPlayerController = CustomVideoPlayerController(
//       context: context,
//       videoPlayerController: videoPlayerController,
//     ); 
//   }

//   @override
//   void dispose() {
//     _customVideoPlayerController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Center(
//         child: CustomVideoPlayer(
//             customVideoPlayerController: _customVideoPlayerController),
//       ),
//     );
//   }
// }
