
// import 'package:flutter/material.dart';
// import 'package:video_thumbnail/video_thumbnail.dart';

// class Thumbnail extends StatelessWidget {
//    Thumbnail({super.key, required this.VidPath});

//   String VidPath;

//   @override
//   Widget build(BuildContext context) {
//   //  final List imagess =  getThumbnail(VidPath);
//     return Container(
//       height: 120.0,
//       width: 120.0,
//       color: Colors.amber,
//       decoration: BoxDecoration(
//       //   image: DecorationImage(
//       //     image: Image.file(File(imagess)) ,
//       //     fit: BoxFit.fill,
//       //   ),
//       //   shape: BoxShape.circle,
//       // ),
//       )
//     );
//   }
   
//   Future<String> getThumbnail(String VidPath) async {
//   final fileName = await VideoThumbnail.thumbnailFile(
//     video: VidPath,
//     imageFormat: ImageFormat.PNG,
//     quality: 100,
//   );
//   // print(fileName.runtimeType);
//   return fileName!;
// }



// }
