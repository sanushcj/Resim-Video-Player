

import 'package:flutter/material.dart';

class VideoPlayer extends StatefulWidget {
   VideoPlayer({super.key, required this.VideoFetched, required this.VTitle});

String VideoFetched;
  String VTitle;

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return Container();
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
//   late VideoPlayerController _controller;

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
//                 child: VideoPlayer(_controller),
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
