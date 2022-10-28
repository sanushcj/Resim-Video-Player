// // ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, always_specify_types, must_be_immutable

// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'allvideos.dart';
// import 'search.dart';
// import 'settings.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   void initState() {
//     super.initState();
//     AllVideos();
//   }

//   // List<String> namess = [
//   //   'Camera',
//   //   'DCIM',
//   //   'Videos',
//   //   'Movies',
//   //   'CBSE SLEEPING',
//   //   'Short Filims',
//   //   'Ajo Varghese Videos',
//   //   'Infopark',
//   //   'Abin K Ruby Videos',
//   //   'Wedding',
//   //   'Devotional Videos'
//   // ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 4, 57, 87),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Container(
//               height: 75.h,
//               width: 360.w,
//               color: const Color.fromARGB(255, 4, 57, 87),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                       margin: const EdgeInsets.only(
//                         left: 20.0,
//                       ),
//                       height: 80.h,
//                       width: 40.w,
//                       child: Image(
//                           image:
//                               AssetImage('assets/img/Resim player icon.png'))),
//                   SizedBox(
//                     width: 5,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 36),
//                     child: Text(
//                       'RESIM VIDEO',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(left: 124.w, top: 20.h),
//                     child: IconButton(
//                         onPressed: () {
//                           Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => SearchPage(),
//                           ));
//                         },
//                         icon: Icon(
//                           Icons.search,
//                           color: Colors.white,
//                         )),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(top: 20, left: 0.w),
//                     child: PopupMenuButton<int>(
//                       icon: Icon(
//                         Icons.more_vert,
//                         color: Colors.white,
//                       ),
//                       itemBuilder: (context) => [
//                         // popupmenu item 1
//                         PopupMenuItem(
//                             value: 0,
//                             // row has two child icon and text.
//                             child: Row(
//                               children: const [
//                                 Icon(Icons.settings),
//                                 SizedBox(
//                                   // sized box with width 10
//                                   width: 10,
//                                 ),
//                                 Text('Settings')
//                               ],
//                             ),
//                             onTap: () {
//                               WidgetsBinding.instance.addPostFrameCallback((_) {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) {
//                                       return SettingsPage();
//                                     },
//                                   ),
//                                 );
//                               });
//                             }),
//                         // popupmenu item 2
//                         PopupMenuItem(
//                           value: 1,
//                           // row has two child icon and text
//                           child: Row(
//                             children: [
//                               IconButton(
//                                 onPressed: () {},
//                                 icon: Icon(Icons.chrome_reader_mode),
//                               ),
//                               SizedBox(
//                                 // sized box with width 10
//                                 width: 10,
//                               ),
//                               Text('About')
//                             ],
//                           ),
//                         ),
//                       ],
//                       offset: Offset(0, 100),
//                       color: Colors.grey,
//                       elevation: 2,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius:
//                       BorderRadius.only(topLeft: Radius.circular(30))),
//               height: MediaQuery.of(context).size.height / 1.3,
//               child: ListView.separated(
//                 physics: BouncingScrollPhysics(),
//                 shrinkWrap: true,
//                 itemBuilder: (context, index) => ListTile(
//                   leading: Icon(
//                     Icons.folder_outlined,
//                     size: 40,
//                   ),
//                   // title: Text(namess[index]),
//                 ),
//                 separatorBuilder: (context, index) => Divider(),
//                 // itemCount: namess.length,
//                 itemCount: 10,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }



import 'dart:developer';
import 'dart:io';

import 'package:file_manager/file_manager.dart';
import 'package:flutter/material.dart';




class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final FileManagerController controller = FileManagerController();

  @override
  Widget build(BuildContext context) {
    return ControlBackButton(
      controller: controller,
      child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () => createFolder(context),
                icon: Icon(Icons.create_new_folder_outlined),
              ),
              IconButton(
                onPressed: () => sort(context),
                icon: Icon(Icons.sort_rounded),
              ),
              IconButton(
                onPressed: () => selectStorage(context),
                icon: Icon(Icons.sd_storage_rounded),
              )
            ],
            title: ValueListenableBuilder<String>(
              valueListenable: controller.titleNotifier,
              builder: (context, title, _) => Text(title),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () async {
                await controller.goToParentDirectory();
              },
            ),
          ),
          body: Container(
            margin: EdgeInsets.all(10),
            child: FileManager(
              controller: controller,
              builder: (context, snapshot) {
                 List<FileSystemEntity> entities = snapshot;
                 print(('$entities  firsstt print'    ));
                print('$snapshot printed snapshot');
                return ListView.builder(
                  itemCount: entities.length,
                  itemBuilder: (context, index) {
                    FileSystemEntity entity = entities[index];
                  print  ('${entities[index].path}');
                    print('${entities} Printed entities');  
                    return Card(
                      child: ListTile(
                        leading: FileManager.isFile(entity)
                            ? Icon(Icons.feed_outlined)
                            : Icon(Icons.folder),
                        title: Text(FileManager.basename(entity)),
                        subtitle: subtitle(entity),
                        onTap: () async {
                          if (FileManager.isDirectory(entity)) {
                            // open the folder
                            controller.openDirectory(entity);
    
                            // delete a folder
                            // await entity.delete(recursive: true);
    
                            // rename a folder
                            // await entity.rename("newPath");
    
                            // Check weather folder exists
                            // entity.exists();
    
                            // get date of file
                            // DateTime date = (await entity.stat()).modified;
                          } else {
                            // delete a file
                            // await entity.delete();
    
                            // rename a file
                            // await entity.rename("newPath");
    
                            // Check weather file exists
                            // entity.exists();
    
                            // get date of file
                            // DateTime date = (await entity.stat()).modified;
    
                            // get the size of the file
                            // int size = (await entity.stat()).size;
                          }
                        },
                      ),
                    );
                  },
                );
              },
            ),
          )),
    );
  }

  Widget subtitle(FileSystemEntity entity) {
    return FutureBuilder<FileStat>(
      future: entity.stat(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (entity is File) {
            int size = snapshot.data!.size;

            return Text(
              "${FileManager.formatBytes(size)}",
            );
          }
          return Text(
            "${snapshot.data!.modified}".substring(0, 10),
          );
        } else {
          return Text("");
        }
      },
    );
  }
  

  selectStorage(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: FutureBuilder<List<Directory>>(
          future: FileManager.getStorageList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<FileSystemEntity> storageList = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: storageList
                        .map((e) => ListTile(
                              title: Text(
                                "${FileManager.basename(e)}",
                              ),
                              onTap: () {
                                controller.openDirectory(e);
                                Navigator.pop(context);
                              },
                            ))
                        .toList()),
              );
            }
            return Dialog(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  sort(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                  title: Text("Name"),
                  onTap: () {
                    controller.sortBy(SortBy.name);
                    Navigator.pop(context);
                  }),
              ListTile(
                  title: Text("Size"),
                  onTap: () {
                    controller.sortBy(SortBy.size);
                    Navigator.pop(context);
                  }),
              ListTile(
                  title: Text("Date"),
                  onTap: () {
                    controller.sortBy(SortBy.date);
                    Navigator.pop(context);
                  }),
              ListTile(
                  title: Text("type"),
                  onTap: () {
                    controller.sortBy(SortBy.type);
                    Navigator.pop(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  createFolder(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController folderName = TextEditingController();
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: TextField(
                    controller: folderName,
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      // Create Folder
                      await FileManager.createFolder(
                          controller.getCurrentPath, folderName.text);
                      // Open Created Folder
                      controller.setCurrentPath =
                          controller.getCurrentPath + "/" + folderName.text;
                    } catch (e) {}

                    Navigator.pop(context);
                  },
                  child: Text('Create Folder'),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
