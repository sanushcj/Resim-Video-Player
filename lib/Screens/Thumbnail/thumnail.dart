import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

Future<String> getThumbnail(String tumbnail) async {
  final fileName = await VideoThumbnail.thumbnailFile(
    video: tumbnail,
    thumbnailPath: (await getTemporaryDirectory()).path,
    imageFormat: ImageFormat.PNG,
    quality: 100,
  );
  return fileName!;
}

// ignore: must_be_immutable
class Thumnailcontainer extends StatelessWidget {
  Thumnailcontainer({super.key, required this.VideoPath, required this.index});
  int index;
  String VideoPath;
  String? Img;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        height: 95,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: 160,
            height: 110,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            child: FutureBuilder(
              future: getThumbnail(VideoPath),
              builder: ((context, snapshot) {
                return snapshot.hasData
                    ? Container(
                        width: 100,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50), //20
                        ),
                        child: Image.file(
                          File(snapshot.data!),
                          // File(videovariable
                          //     .thumbnail),
                          fit: BoxFit.cover,
                        ),
                      )
                    : Container(
                        width: 100,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                              image: AssetImage('assets/img/ios loading.jpg'),
                              fit: BoxFit.cover),
                        ),
                      );
              }),
            ),
          ),
        ));
  }


}



// child: Container(
//           width: 100,
//           height: 90,
//       decoration: BoxDecoration(
//         image: DecorationImage( 
//       image:  FileImage((File(thambu.elementAt(index))),),
//           fit: BoxFit.fill,
          
//         ),
//       ),
//         )),
//     ); 